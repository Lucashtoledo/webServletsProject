<%--
  Created by IntelliJ IDEA.
  User: a867759
  Date: 7/14/2024
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro de usuários</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Cadastro de usuários</h2>
    <form action="/cadastro_usuario" method="post">
        Nome: <input type="text" name="nome" required><br>
        Email: <input type="text" name="email" required><br>
        Senha: <input type="password" name="senha" required><br>
        <input type="submit" value="Cadastre-se">
        <button onclick="window.location.href='/index.jsp'">Voltar</button>
    </form>
</body>
</html>
