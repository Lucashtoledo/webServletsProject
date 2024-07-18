package org.academy;

import org.academy.dao.UsuarioDAO;
import org.academy.model.Usuario;

public class Main {
    public static void main(String[] args) {

        Usuario usuario1 = new Usuario();
        usuario1.setNome("Joao");
        usuario1.setEmail("joao@mail.com");
        usuario1.setSenha("123456");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.salvar(usuario1);

    }
}