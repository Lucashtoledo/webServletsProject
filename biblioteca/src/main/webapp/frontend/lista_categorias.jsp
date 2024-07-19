<%--
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
            <th>ID</th>
            <th>Nome</th>
        </tr>
    </thread>
    <tbody>
        <c:forEach var="categoria" items="${categorias}">
            <tr>
                <td>${categoria.id}</td>
                <td>${categoria.nome}</td>
            </tr>
        </c:forEach>
    </tbody>
</body>
</html>
