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
    <title>Área do Bibliotecário</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<div class="overlay"></div>

<!-- Cabeçalho com nome do usuário e botão de logout -->
<header>
    <div class="user-info">
        <span>Bem-vindo, <%= ((org.academy.model.Usuario) session.getAttribute("usuario")).getNome() %>!</span>
        <form action="../logout" method="post" class="logout-form">
            <input type="submit" value="Logout">
        </form>
    </div>
</header>

<!-- Conteúdo principal -->
<div class="content">
    <h1>Área do Bibliotecário</h1>
    <br/>
    <nav>
        <ul class="nav-menu">
            <li><a href="/gerenciarLivros.jsp">Gerenciar Livros</a></li>
            <li><a href="/gerenciarCategorias.jsp">Gerenciar Categorias</a></li>
        </ul>
    </nav>
</div>
</body>
</html>


