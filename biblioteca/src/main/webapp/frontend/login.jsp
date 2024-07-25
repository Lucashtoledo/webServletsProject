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
            <button type="button" onclick="window.location.href='index.jsp'">Voltar</button>
        </form>
    </div>
</main>

<script>
    window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('error')) {
            alert('Usuário ou senha incorretos');
        }
    };
</script>

</body>
</html>
