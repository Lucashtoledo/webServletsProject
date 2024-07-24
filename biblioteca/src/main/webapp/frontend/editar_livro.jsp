<%@ page import="org.academy.model.Livro" %>
<%@ page import="org.academy.dao.LivroDAO" %><%--
  Created by IntelliJ IDEA.
  User: lucas
  Date: 24/07/2024
  Time: 02:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    <h1>Editar livro</h1>

    <%
        String idParam = request.getParameter("id");
        Livro livro = null;

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                LivroDAO livroDAO = new LivroDAO();
                livro = livroDAO.findById(id);
            } catch (NumberFormatException e) {
                // Tratar erro de formato de número
            }
        }

        if (livro != null) {
    %>

    <form action="../livro" method="post">
            <input type="hidden" id="id" name="id" value="<%= livro.getId() %>" readonly></label><br>
        <label for="isbn">ISBN<br>
            <input type="text" id="isbn" name="isbn" value="<%= livro.getIsbn() %>" placeholder="ISBN"></label><br>
        <label for="titulo">Título<br>
            <input type="text" id="titulo" name="titulo" value="<%= livro.getTitulo() %>" placeholder="Título"></label><br>
        <label for="categoria">Categoria<br>
            <input type="text" id="categoria" name="categoria" value="<%= livro.getCategoria() %>" placeholder="Categoria"></label><br>
        <label for="quantidade">Quantidade<br>
            <input type="text" id="quantidade" name="quantidade" value="<%= livro.getQuantidade() %>" placeholder="Quantidade"></label><br><br>
        <input type="hidden" name="acao" value="atualizar">
        <input type="submit" value="Atualizar">
    </form>
    <% } else { %>
    <p>Livro não encontrado.</p>
    <% } %>
</main>
<footer>
    <p>&copy; 2024 Biblioteca. Todos os direitos reservados.</p>
    <p><a href="">Fale Conosco</a> | <a href="">Política de Privacidade</a></p>
</footer>

</header>
</body>
</html>