<%@ page import="org.academy.dao.LivroDAO" %>
<%@ page import="org.academy.model.Livro" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Biblioteca</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<header>
    <nav>
        <ul class="nav-menu">
            <li><a href="index.jsp">HOME</a></li>
            <li><a href="listar_livros_sem_login.jsp">LISTAR LIVROS</a></li>
            <li class="login"><a href="login.jsp">LOGIN</a></li>
            <li class="login"><a href="cadastroUsuario.jsp">CADASTRE-SE</a></li>
        </ul>
    </nav>
</header>

<!-- Rodapé -->
<footer>
    <p>&copy; 2024 Biblioteca. Todos os direitos reservados.</p>
    <p><a href="contato.jsp">Fale Conosco</a> | <a href="politicaPrivacidade.jsp">Política de Privacidade</a></p>
</footer>
</body>
</html>
