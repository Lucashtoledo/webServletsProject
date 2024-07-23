<%@ page import="org.academy.dao.LivroDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.academy.model.Livro" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.academy.model.Categoria" %>
<%@ page import="org.academy.dao.CategoriaDAO" %><%--
  Created by IntelliJ IDEA.
  User: lucas
  Date: 18/07/2024
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Usuários</title>
</head>
<body>
    <h1>Categorias</h1>
    <thread>
        <tr>
            <th>Categoria:</th>
        </tr>
    </thread>
    <tbody>
        <%
            CategoriaDAO categoriaDAO = new CategoriaDAO();
            List<Categoria> list = categoriaDAO.findAll();
            for (Categoria categoria : list) {
        %>
        <tr>
            <br><td><%= categoria.getNome() %></td>
        </tr>
        <%

            }
        %>
    </tbody>
</body>
</html>
