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
<body>
    <header>
        <nav>
            <ul>
                <li><a href="../index2.jsp">Home</a> </li>
                <li><a href="listar_livros.jsp">Catálogo</a> </li>
                <li><a href="cadastro_livro.jsp">Cadastrar Livros</a> </li>
                <li><a href="listar_livros.jsp">Listar Livros</a> </li>
                <li><a href="gerenciar_livros.jsp">Gerenciar Livros</a> </li>
            </ul>
        </nav>
    </header>
    <main>
        <h1>Gerenciar Livro</h1>
        <section id="editar">
            <h2>Editar Livro</h2>
        </section>
       <p> --------------------------------------------------------------------------------------</p>
        <section id="excluir">
            <h2>Excluir Livro</h2>
            <form action="/livro" method="post">
                <input type="hidden" name="acao" value="delete">
                <input type="text" name="id" placeholder="Buscar por ID">
                <input type="submit" value="Excluir">
            </form>
        </section>
    </main>

    <footer>@Todos os direitos reservados</footer>
</body>
</html>
