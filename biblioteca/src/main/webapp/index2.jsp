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
    <header>
        <nav>
            <ul>
                <li><a href="index2.jsp">Home</a> </li>
                <li><a href="/frontend/listar_livros.jsp">Catálogo</a> </li>
                <li><a href="/frontend/cadastro_livro.jsp">Cadastrar Livros</a> </li>
                <li><a href="/frontend/listar_livros.jsp">Listar Livros</a> </li>
                <li><a href="/frontend/gerenciar_livros.jsp">Gerenciar Livros</a> </li>
            </ul>
        </nav>
    </header>
    <h1>Bem-vindo, <%= ((org.academy.model.Usuario) session.getAttribute("usuario")).getNome() %>!</h1>
    <br/>
    <form action="logout" method="post">
        <input type="submit" value="Logout">
    </form>
</body>
</html>

