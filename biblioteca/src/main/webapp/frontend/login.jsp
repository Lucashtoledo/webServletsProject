<%--
  Created by IntelliJ IDEA.
  User: a867759
  Date: 7/14/2024
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<main>
    <h2>Login</h2>
    <div class="cad-container">
        <form action="/login" method="post">
            Email: <input type="text" name="email" required><br>
            Senha: <input type="password" name="senha" required><br>
            <input type="submit" value="Login">
            <button onclick="window.location.href='index.jsp'">Voltar</button>
        </form>
        <c:if test="${param.erro !=null}">
            <p style="color: red;">Email ou senha inválidos!</p>
        </c:if>
    </div>
</main>

</body>
</html>
