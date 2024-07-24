<%--
  Created by IntelliJ IDEA.
  User: lucas
  Date: 24/07/2024
  Time: 02:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastrar Livro</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<header>
    <nav>
        <ul class="nav-menu">
            <li><a href="index2.jsp">HOME</a></li>
            <li><a href="cadastrar_livro.jsp">CADASTRAR LIVRO</a></li>
            <li><a href="listar_livros.jsp">LISTAR LIVROS</a></li>
            <li id="logout">
                <form id="logout-form" action="../logout" method="post" style="display: none;"></form>
                <a href="#" onclick="document.getElementById('logout-form').submit(); return false;">LOGOUT</a>
            </li>

        </ul>
    </nav>
</header>
<main>
    <div class="cad-container">
    <form action="../livro" method="post">
        ISBN: <br><input type="text" name="isbn" required><br>
        Título: <br><input type="text" name="titulo" required><br>
        Categoria: <br><input type="text" name="categoria" required><br>
        Quantidade: <br><input type="text" name="quantidade" required><br>
        <input type="hidden" name="acao" value="adicionar">
        <input type="submit" value="Adicionar">
    </form>
    </div>
</main>
<footer>
    <p>&copy; 2024 Biblioteca. Todos os direitos reservados.</p>
    <p><a href="">Fale Conosco</a> | <a href="">Política de Privacidade</a></p>
</footer>
</body>
</html>
