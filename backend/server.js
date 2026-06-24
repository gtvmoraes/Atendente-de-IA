require('dotenv').config();
const axios = require('axios');


const express = require('express');
const db = require('./db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const cors = require('cors');


const app = express();
app.use(cors());

const segredo = 'chave_secreta';

function verificarToken(req, res, next) {

    const token = req.headers.authorization;


    if (!token) {
        return res.status(401).send('Token não enviado');
    }


    try {

        const tokenLimpo = token.replace("Bearer ", "");


        const usuario = jwt.verify(
            tokenLimpo,
            segredo
        );


        req.usuario = usuario;


        next();


    } catch (erro) {

        res.status(401).send('Token inválido');

    }

}

app.use(express.json());



//integrando api gemini
async function testarGemini() {

    try {

        const resposta = await axios.post(
            `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${process.env.GEMINI_API_KEY}`,
            {
                contents: [
                    {
                        parts: [
                            {
                                text: "Quem é você?"
                            }
                        ]
                    }
                ]
            }
        );

        console.log(
            resposta.data.candidates[0].content.parts[0].text
        );

    } catch (erro) {

        console.log(erro.response?.data || erro.message);

    }

}


//rota perguntar para o Gemini
app.post('/perguntar', verificarToken, async (req, res) => {

    const contexto = `Você é uma assistente virtual de um salão de beleza chamado OS DUVISUAL.
    Sua função é atender clientes e ajudar com informações sobre o salão.
    Você pode responder dúvidas sobre:
    - serviços oferecidos;
    - preços aproximados;
    - horários de atendimento;
    - agendamentos;
    - funcionamento do salão.
    Sempre seja educada, simpática e profissional.
    Quando o cliente iniciar uma conversa, cumprimente e pergunte como pode ajudar.
    Não invente informações que não foram fornecidas pelo salão.`

    const { mensagem } = req.body;

    const usuario_id = req.usuario.id;

    try {

        const resposta = await axios.post(
            `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${process.env.GEMINI_API_KEY}`,
            {
                contents: [
                    {
                        parts: [
                            {
                                text: contexto + "\n\nMensagem do cliente: " + mensagem
                            }
                        ]
                    }
                ]
            }
        );


        const respostaGemini =
            resposta.data.candidates[0]
            .content.parts[0].text;


        const sql = `
            INSERT INTO mensagem
            (usuario_id, mensagem_usuario, resposta_bot)
            VALUES (?, ?, ?)
        `;


        db.query(
            sql,
            [
                usuario_id,
                mensagem,
                respostaGemini
            ],
            (erro) => {

                if (erro) {
                    console.log("Erro ao salvar histórico:", erro);
                }

            }
        );


        res.json({
            resposta: respostaGemini
        });


    } catch (erro) {

        console.log(
            erro.response?.data || erro.message
        );

        res.status(500).json({
            erro: "Erro ao consultar Gemini"
        });

    }

});

//rota cadastro
app.post('/cadastro', async (req, res) => {

      console.log('Rota cadastro foi chamada');
    const { nome, email, senha } = req.body;

    const senhaCriptografada = await bcrypt.hash(senha, 10);

    const sql = `
        INSERT INTO usuarios (nome, email, senha)
        VALUES (?, ?, ?)
    `;

    db.query(
        sql,
        [nome, email, senhaCriptografada],
        (erro, resultado) => {

            if (erro) {
                console.log(erro);
                res.status(500).send('Erro ao cadastrar usuário');
                return;
            }

            res.send('Usuário cadastrado com sucesso!');
        }
    );

});


//rota login
app.post('/login', (req, res) => {

    const { email, senha } = req.body;


    const sql = `
        SELECT * FROM usuarios
        WHERE email = ?
    `;


    db.query(sql, [email], async (erro, resultado) => {

        if (erro) {
            console.log(erro);
            res.status(500).send('Erro no banco de dados');
            return;
        }


        if (resultado.length === 0) {
            res.status(404).send('Usuário não encontrado');
            return;
        }


        const usuario = resultado[0];


        const senhaCorreta = await bcrypt.compare(
            senha,
            usuario.senha
        );


        if (!senhaCorreta) {
            res.status(401).send('Senha incorreta');
            return;
        }


            const token = jwt.sign(
        {
            id: usuario.id,
            email: usuario.email
        },
        segredo,
        {
            expiresIn: '1h'
        }
    );


    res.json({
        mensagem: "Login realizado com sucesso!",
        token: token
    });

    });

});

//rota mensagem
app.post('/mensagem', verificarToken, (req, res) => {

    const usuario_id = req.usuario.id;

    const { mensagem } = req.body;

    const sql = `
        INSERT INTO mensagem
        (usuario_id, mensagem_usuario)
        VALUES (?, ?)
    `;

    db.query(
        sql,
        [usuario_id, mensagem],
        (erro, resultado) => {

            if (erro) {
                console.log(erro);
                return res.status(500).send(
                    'Erro ao salvar mensagem'
                );
            }

            res.json({
                mensagem: 'Mensagem salva com sucesso!'
            });

        }
    );

});



app.listen(3000, () => {    
    console.log('Servidor rodando na porta 3000');
});