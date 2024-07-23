package org.academy.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.academy.dao.LivroDAO;
import org.academy.model.Livro;

import java.io.IOException;
import java.util.List;

@WebServlet("/livro")
public class LivroServlet extends HttpServlet {
    LivroDAO dao;

    public void init(){
        dao = new LivroDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Livro> livro = dao.findAll();
        request.setAttribute("livro", livro);
        request.getRequestDispatcher("frontend/listar_livros.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String acao = request.getParameter("acao");

        if (acao == null) {
            acao = "list";
        }

        switch (acao) {
            case "delete":
                deleteLivro(request, response);
                break;
        }

        int isbn = Integer.parseInt(request.getParameter("isbn"));
        String titulo = request.getParameter("titulo");
        String categoria = request.getParameter("categoria");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        Livro livro = new Livro(isbn, titulo, quantidade, categoria);
        dao.save(livro);
        response.sendRedirect("frontend/cadastro_livro.jsp");
    }


    private void deleteLivro(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        dao.deleteByID(id);
        response.sendRedirect("frontend/gerenciar_livro.jsp");
    }
}