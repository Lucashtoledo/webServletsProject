package org.academy.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.academy.dao.CategoriaDAO;
import org.academy.dao.ServiceDAO;
import org.academy.model.Categoria;

import java.io.IOException;
import java.util.List;

@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet {

    private CategoriaDAO categoriaDAO;

    public void init() throws ServletException {
        categoriaDAO = new CategoriaDAO(ServiceDAO.getSessionFactory());
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Categoria> categorias = categoriaDAO.findAll();
        request.setAttribute("categorias", categorias);
        request.getRequestDispatcher("frontend/catalogo.jsp").forward(request, response);
    }
}
