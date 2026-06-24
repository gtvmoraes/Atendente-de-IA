const formulario = document.getElementById('formCadastro');

formulario.addEventListener('submit', async (e) => {

    e.preventDefault();

    const nome = document.getElementById('nome').value;
    const email = document.getElementById('email').value;
    const senha = document.getElementById('senha').value;


    const resposta = await fetch(
        'http://localhost:3000/cadastro',
        {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                nome,
                email,
                senha
            })
        }
    );


    if (resposta.ok) {

        alert('Cadastro realizado com sucesso!');

        window.location.href = 'login.html';

    }

});