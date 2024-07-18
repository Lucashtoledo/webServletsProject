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
    <title>Cadastro de categoria</title>
</head>
<body>
<h2>Cadastrar</h2>
<form action="/cad_categoria" method="post">
    Nome: <input type="text" name="nome" required><br>
    <input type="submit" value="Cadastre-se">
</form>
<a href="/index.jsp">Voltar</a>
</body>
</html>