<%@ page import="org.academy.dao.LivroDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.academy.model.Livro" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Livros</title>
</head>
<body>
<h1>Livros</h1>
<th>
    <tr>
        <th>ID</th>
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
    <td><%= livro.getId() %></td>
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
