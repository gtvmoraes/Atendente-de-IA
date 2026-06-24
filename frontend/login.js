const formulario = document.getElementById('formLogin');

formulario.addEventListener('submit', async (e) => {

    e.preventDefault();

    const email = document.getElementById('email').value;
    const senha = document.getElementById('senha').value;


    try {

        const resposta = await fetch(
            'http://localhost:3000/login',
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    email,
                    senha
                })
            }
        );


        const dados = await resposta.json();

        console.log("Status:", resposta.status);
        console.log("Resposta:", dados);


        if (resposta.ok) {

            localStorage.setItem(
                'token',
                dados.token
            );

            alert('Login realizado com sucesso!');

            window.location.href = 'chat.html';

        } else {

            alert(dados.mensagem || 'Erro no login');

        }


    } catch (erro) {

        console.log("Erro:", erro);
        alert("Erro ao conectar com o servidor");

    }

});