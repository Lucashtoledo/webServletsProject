<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Biblioteca</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="overlay"></div>
<h1>Biblioteca</h1>

<!-- Menu de Login -->
<div class="login-menu">
  <button class="login-button">Login</button>
  <div class="login-dropdown">
    <a href="login.jsp">Login</a>
    <a href="cadastroUsuario.jsp">Cadastrar-se</a>
  </div>
</div>

<!-- Menu de Navegação -->
<nav>
  <ul class="nav-menu">
    <li><a href="catalogo.jsp">Catálogo de Livros</a></li>
    <li><a href="sobre.jsp">Sobre Nós</a></li>
    <li><a href="contato.jsp">Contato</a></li>
  </ul>
</nav>

<!-- Grid de imagens de livros -->
  <div class="book-grid">
    <img src="images/book1.jpg" alt="Book 1" class="book-cover">
    <img src="images/book2.jpg" alt="Book 2" class="book-cover">
    <img src="images/book3.jpg" alt="Book 3" class="book-cover">
    <img src="images/book4.jpg" alt="Book 4" class="book-cover">
</div>
<!-- Rodapé -->
<footer>
  <p>&copy; 2024 Biblioteca. Todos os direitos reservados.</p>
  <p><a href="contato.jsp">Fale Conosco</a> | <a href="politicaPrivacidade.jsp">Política de Privacidade</a></p>
</footer>
</body>
</html>
