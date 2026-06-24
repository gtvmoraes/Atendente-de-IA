# Sistema de Atendimento com Chatbot

## Descrição

Sistema de suporte ao cliente desenvolvido com autenticação de usuários,
banco de dados e chatbot para atendimento automático.

O sistema permite que usuários realizem cadastro, login e enviem mensagens
para o assistente virtual.


## Tecnologias utilizadas

Frontend:
- HTML
- CSS
- JavaScript

Backend:
- Node.js
- Express

Banco de dados:
- Mysql Workbench
- XAMPP
- AUXÍLIO DA EXTENSÃO (THUNDER CLIENT)

Autenticação:
- JWT
- bcrypt para criptografia de senha


## Funcionalidades

✔ Cadastro de usuários

✔ Login com autenticação

✔ Proteção de rotas utilizando token

✔ Chatbot para respostas automáticas

✔ Registro das mensagens no banco de dados

✔ Histórico de atendimento


## Como executar o projeto

### Backend

Entrar na pasta: cd backend -> npm run dev


## Rotas principais

POST /cadastro

Realiza cadastro de usuários.

POST /login

Realiza autenticação e retorna token.

POST /perguntar

Recebe mensagens do usuário e retorna respostas do chatbot.



## Segurança

O acesso ao chatbot é permitido apenas para usuários autenticados.

O sistema utiliza token JWT enviado no cabeçalho Authorization.