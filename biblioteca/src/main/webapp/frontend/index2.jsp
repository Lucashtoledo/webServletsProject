<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Área do Bibliotecário</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<div class="overlay"></div>

<!-- Cabeçalho com nome do usuário e botão de logout -->
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

<!-- Conteúdo principal -->
<main>
    <h1>Área do Bibliotecário</h1>
    <br/>

</main>
<footer>
    <p>&copy; 2024 Biblioteca. Todos os direitos reservados.</p>
    <p><a href="">Fale Conosco</a> | <a href="">Política de Privacidade</a></p>
</footer>
</body>
</html>


