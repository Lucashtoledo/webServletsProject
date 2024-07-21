package org.academy.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.academy.dao.LivroDAO;
import org.academy.dao.ServiceDAO;
import org.academy.model.Livro;

import java.io.IOException;
import java.util.List;

@WebServlet("/buscar")
public class BuscaLivrosServlet extends HttpServlet {
    private LivroDAO livroDAO;

    public void init() throws ServletException {
        livroDAO = new LivroDAO(ServiceDAO.getSessionFactory());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        String categoria = request.getParameter("categoria");

        List<Livro> livros;

        if(titulo != null && !titulo.isEmpty()){
            livros = livroDAO.buscarPorTitulo(titulo);
        } else if (categoria != null && !categoria.isEmpty()) {
            livros = livroDAO.buscarPorCategoria(categoria);
        }else {
            livros = livroDAO.findAll();
        }
        request.setAttribute("livros", livros);
        request.getRequestDispatcher("/catalogo.jsp").forward(request, response);
    }
}
