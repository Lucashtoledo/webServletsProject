<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Catálogo de Livros</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
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
    <h1>Catálogo de Livros</h1>

    <!-- Barra de busca -->
    <form action="/buscarCatalogo" method="get">
        <input type="text" name="titulo" placeholder="Buscar por título">
        <input type="submit" value="Buscar">
    </form>

    <!-- Filtro por categoria -->
    <form action="/buscarCatalogo" method="get">
        <select name="categoria">
            <option value="">Selecione uma categoria</option>
            <c:forEach var="categoria" items="${categorias}">
                <option value="${categoria.nome}">${categoria.nome}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Filtrar">
    </form>

    <!-- Lista de livros -->
    <c:forEach var="livro" items="${livros}">
        <div>
            <h2>${livro.titulo}</h2>
            <p>${livro.autor}</p>
            <p>Categoria: ${livro.categoria.nome}</p>
        </div>
    </c:forEach>

    <br/>
    <button onclick="window.location.href='/index.jsp'">Voltar</button>
</body>
</html>

