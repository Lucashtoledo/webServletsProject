<%--
  Created by IntelliJ IDEA.
  User: lucas
  Date: 23/07/2024
  Time: 08:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Catálogo de Livros</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<body>
<header>
    <nav>
        <ul class="nav-menu">
            <li><a href="index2.jsp">HOME</a></li>
            <li><a href="gerenciar_livros.jsp">GERENCIAR LIVROS</a></li>
            <li><a href="listar_livros.jsp">LISTAR LIVROS</a></li>
            <li id="logout">
                <form id="logout-form" action="../logout" method="post" style="display: none;"></form>
                <a href="#" onclick="document.getElementById('logout-form').submit(); return false;">LOGOUT</a>
            </li>

        </ul>
    </nav>
</header>
<main>
    <h1>Gerenciar Livro</h1>

    <section id="Adicionar">
        <h2>Adicionar Livro</h2>

    </section>
    <p>-------------------------------------------------------------------------</p>
    <section id="editar">
        <h2>Editar Livro</h2>
        <form action="../livro" method="post">
            <label for="id">ID do livro a ser atualizado<br>
                <input type="text" id="id" name="id" placeholder="ID"></label><br>
            <label for="isbn">Novo ISBN<br>
                <input type="text" id="isbn" name="isbn" placeholder="ISBN"></label><br>
            <label for="titulo">Novo Título<br>
                <input type="text" id="titulo" name="titulo" placeholder="Título"></label><br>
            <label for="categoria">Nova Categoria<br>
                <input type="text" id="categoria" name="categoria" placeholder="Categoria"></label><br>
            <label for="quantidade">Nova Quantidade<br>
                <input type="text" id="quantidade" name="quantidade" placeholder="Quantidade"></label><br><br>

            <input type="hidden" name="acao" value="atualizar">
            <input type="submit" value="Atualizar">
        </form>
    </section>
    <p> --------------------------------------------------------------------------------------</p>
    <section id="excluir">
        <h2>Excluir Livro</h2>
        <form action="../livro" method="post">
            <input type="text" name="id" placeholder="Buscar por ID">
            <input type="hidden" name="acao" value="delete">
            <input type="submit" value="Delete">
        </form>
    </section>
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
