package org.academy.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.academy.dao.ServiceDAO;
import org.academy.dao.UsuarioDAO;
import org.academy.model.Usuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    public void init() throws ServletException {
        usuarioDAO = new UsuarioDAO(ServiceDAO.getSessionFactory());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        try{
            Usuario usuario = usuarioDAO.validarUsuario(email, senha);
            if(usuario != null){
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                //response.sendRedirect("index.jsp");
                response.sendRedirect("index2.jsp");
            }else {
                response.sendRedirect("login.jsp?erro=true");
            }
        }catch (Exception e){
            throw new ServletException(e);
        }
    }


}