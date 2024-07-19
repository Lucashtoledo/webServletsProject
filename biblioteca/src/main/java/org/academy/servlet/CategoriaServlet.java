package org.academy.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.academy.dao.CategoriaDAO;
import org.academy.model.Categoria;

import java.io.IOException;
import java.util.List;

@WebServlet("/cad_categoria")
public class CategoriaServlet extends HttpServlet {
    CategoriaDAO dao;

    public void init(){
        dao = new CategoriaDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Categoria> categorias = dao.findAll();
        request.setAttribute("categorias", categorias);
        request.getRequestDispatcher("/lista_categorias.jsp").forward(request, response);
    }
}