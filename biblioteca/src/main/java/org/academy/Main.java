package org.academy;

import org.academy.dao.CategoriaDAO;
import org.academy.dao.LivroDAO;
import org.academy.model.Categoria;
import org.academy.model.Livro;

public class Main {
    public static void main(String[] args) {
        Categoria cat1 = new Categoria("Comédia");
        CategoriaDAO dao = new CategoriaDAO();
        dao.save(cat1);
    }
}