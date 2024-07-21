<%--
  Created by IntelliJ IDEA.
  User: a867759
  Date: 7/20/2024
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Área do bibliotecário</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h1>Bem-vindo, <%= ((org.academy.model.Usuario) session.getAttribute("usuario")).getNome() %>!</h1>
<br/>
<a href="/gerenciarLivros.jsp">Gerenciar Livros</a>
<a href="/gerenciarCategorias.jsp">Gerenciar Categorias</a>
<form action="logout" method="post">
    <input type="submit" value="Logout">
</form>
</body>
</html>

