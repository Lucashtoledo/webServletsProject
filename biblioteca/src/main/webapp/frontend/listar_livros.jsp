<%@ page import="org.academy.dao.LivroDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.academy.model.Livro" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Livros</title>
    <script>
        function confirmDelete() {
            return confirm("Tem certeza de que deseja excluir este livro?");
        }
    </script>
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
    <h1>Lista de livros</h1>
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
            <form action="editar_livro.jsp" method="get">
                <input type="hidden" name="id" value="<%= livro.getId() %>">
                <input type="submit" value="Editar">
            </form>
            <form action="../livro" method="post" onsubmit="return confirmDelete()">
                <input type="hidden" name="id" value="<%=livro.getId()%>">
                <input type="hidden" name="acao" value="delete">
                <input type="submit" value="Delete">
            </form>
            <br>
        </div>
        <% } %>
    </div>
</main>
<footer>
    <p>&copy; 2024 Biblioteca. Todos os direitos reservados.</p>
    <p><a href="">Fale Conosco</a> | <a href="">Política de Privacidade</a></p>
</footer>
<%
    // Acessar a mensagem da sessão
    session = request.getSession(false);
    if (session != null) {
        String mensagem = (String) session.getAttribute("mensagem");
        if (mensagem != null && !mensagem.isEmpty()) {
%>
<script>
    alert("<%= mensagem %>");
</script>
<%
            // Limpar a mensagem após o uso
            session.removeAttribute("mensagem");
        }
    }
%>
</body>
</html>
