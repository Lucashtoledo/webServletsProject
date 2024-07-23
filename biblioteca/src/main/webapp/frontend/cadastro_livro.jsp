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
    <title>Cadastro de livro</title>
</head>
<body>
<h2>Cadastrar</h2>
<form action="../livro" method="post">
    ISBN: <input type="text" name="isbn" required><br>
    Titulo: <input type="text" name="titulo" required><br>
    Categoria: <input type="text" name="categoria" required><br>
    Quantidade: <input type="text" name="quantidade" required><br>
    <input type="submit" value="Cadastrar">
</form>
<a href="/frontend/listar_livros.jsp">Listar Livros</a>
<a href="/index.jsp">Voltar</a>
</body>
</html>