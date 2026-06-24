const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'projeto_sistema'
})

connection.connect((erro) => {

    if (erro) {
        console.log('Erro ao conectar ao banco de dados:', erro);
        return;
    } 

    console.log('Conexão bem-sucedida ao banco de dados!');
});

module.exports = connection;