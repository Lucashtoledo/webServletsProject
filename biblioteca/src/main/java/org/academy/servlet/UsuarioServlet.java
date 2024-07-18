package org.academy.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.academy.dao.UsuarioDAO;
import org.academy.model.Usuario;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;

@WebServlet("/usuario")
public class UsuarioServlet extends HttpServlet {
    private SessionFactory sessionFactory;
    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        // Inicializa a SessionFactory e passa para o UsuarioDAO
        sessionFactory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Usuario.class).buildSessionFactory();
        usuarioDAO = new UsuarioDAO(sessionFactory);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario usuario = new Usuario();
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setSenha(senha);

        try {
            usuarioDAO.salvar(usuario);
        } catch (Exception e) {
            throw new ServletException("Erro ao salvar o usuário.", e);
        }

        response.sendRedirect("login.jsp");
    }

    @Override
    public void destroy() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}
