package org.academy.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.academy.dao.ServiceDAO;
import org.academy.model.Categoria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;

@WebServlet("/cad_categoria")
public class CadastrarCategoria extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/cad_categoria.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");

        Categoria categoria = new Categoria(nome);

        Transaction transaction = null;
        try (Session session = ServiceDAO.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.persist(categoria);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}