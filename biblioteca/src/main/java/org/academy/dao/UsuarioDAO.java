//classe responsável pelo CRUD da tabela "usuarios"
package org.academy.dao;

import org.academy.model.Usuario;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class UsuarioDAO {

    private SessionFactory factory = ServiceDAO.getSessionFactory();

    public UsuarioDAO(SessionFactory sessionFactory) {
    }

    public void salvar(Usuario usuario) {
        Transaction transaction = null;
        try(Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.persist(usuario);
            transaction.commit();
        }catch(Exception e) {
            if(transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            throw new HibernateException("Erro ao salvar o usuário!" + e.getMessage());
        }
    }

    public List<Usuario> listar(){
        try(Session session = factory.openSession()) {
            return session.createQuery("from usuarios", Usuario.class).getResultList();
        }catch(HibernateException e) {
            e.printStackTrace();
            throw new HibernateException("Não é possível listar os usuários!: " + e.getMessage());
        }
    }

    // validacao por e-mail
    public Usuario validarUsuario(String email, String senha) {
        try(Session session = factory.openSession()) {
            Query<Usuario> query = session.createQuery("from usuarios where email = :email and senha = :senha", Usuario.class);
            query.setParameter("email", email);
            query.setParameter("senha", senha);
            return query.uniqueResult();
        }catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao validar o usuário: " + e.getMessage());
        }
    }
    }
