const token = localStorage.getItem("token");

console.log("TOKEN:", token);


if (!token) {

    alert("Você precisa estar logado!");

    window.location.href = "login.html";

}
else {

    const botao = document.getElementById('enviar');

    botao.addEventListener('click', async () => {

        const mensagem =
            document.getElementById('mensagem').value;


        const resposta = await fetch(
            'http://localhost:3000/perguntar',
            {
                method: 'POST',

                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}`
                },

                body: JSON.stringify({
                    mensagem: mensagem
                })
            }
        );


        const dados = await resposta.json();


        document.getElementById('resposta').innerText =
            dados.resposta;


        document.getElementById('mensagem').value = '';
    });


    const botaoSair = document.getElementById('sair');


    botaoSair.addEventListener('click', () => {

        localStorage.removeItem('token');

        alert('Logout realizado!');

        window.location.href = 'login.html';

    });

}