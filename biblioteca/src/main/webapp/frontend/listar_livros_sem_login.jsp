<%@ page import="org.academy.dao.LivroDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.academy.model.Livro" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Livros</title>

    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="../index.jsp">HOME</a></li>
            <li><a href="listar_livros_sem_login.jsp">LISTAR LIVROS</a></li>
            <li class="login"><a href="login.jsp">LOGIN</a></li>
            <li class="login"><a href="login.jsp">CADASTRE-SE</a></li>
        </ul>
    </nav>
</header>
<main>
    <h1>Livros</h1>
    <div class="book-container">
        <%
            LivroDAO livroDAO = new LivroDAO();
            List<Livro> list = livroDAO.findAll();
            for (Livro livro : list) {
        %>
        <div class="book-item">
            <img src="../images/book1.jpg" alt="<%=livro.getTitulo()%>" style="width: 100%">
            <br>
            <%= livro.getTitulo() %>
            <br>
        </div>
        <% } %>
    </div>
</main>
<footer>
    <p>&copy; 2024 Biblioteca. Todos os direitos reservados.</p>
    <p><a href="">Fale Conosco</a> | <a href="">Política de Privacidade</a></p>
</footer>
</body>
</html>
