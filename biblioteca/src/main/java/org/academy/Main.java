package org.academy;

<<<<<<< HEAD
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


=======
import org.academy.dao.CategoriaDAO;
import org.academy.dao.LivroDAO;
import org.academy.model.Categoria;
import org.academy.model.Livro;

public class Main {
    public static void main(String[] args) {
        Categoria cat1 = new Categoria("Comédia");
        CategoriaDAO dao = new CategoriaDAO();
        dao.save(cat1);
>>>>>>> main
    }
}