<%@ page import="org.academy.dao.LivroDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.academy.model.Livro" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Livros</title>
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="../index2.jsp">Home</a> </li>
            <li><a href="listar_livros.jsp">Listar Livros</a> </li>
            <li><a href="gerenciar_livros.jsp">Gerenciar Livros</a> </li>
        </ul>
    </nav>
</header>
<h1>Livros</h1>
<th>
    <tr>
        <th>ISBN</th>
        <th>Titulo</th>
        <th>Categoria</th>
        <th>Quantidade</th>
    </tr>
</th>
<tbody>
<%
    LivroDAO livroDAO = new LivroDAO();
    List<Livro> list = livroDAO.findAll();
    for (Livro livro: list) {
%>
<tr>
    <br>
    <td><%= livro.getIsbn() %></td>
    <td><%= livro.getTitulo() %></td>
    <td><%= livro.getCategoria() %></td>
    <td><%= livro.getQuantidade() %></td>

</tr>
<%

    }
%>
</tbody>
</body>
</html>
