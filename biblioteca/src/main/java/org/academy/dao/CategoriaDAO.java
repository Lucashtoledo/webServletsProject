//classe responsável pelo CRUD da tabela "livros"
package org.academy.dao;

import org.academy.model.Categoria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import java.util.List;

public class CategoriaDAO {

    private SessionFactory factory = ServiceDAO.getSessionFactory();

    public List<Categoria> findAll(){
        try (Session session = factory.openSession()) {
            return session.createQuery("from categorias").list();
        }catch (Exception e) {
            e.printStackTrace();
            throw new HibernateException("Não foi possivel encontrar todas as categorias" + e.getMessage());
        }
    }

    public void save(Categoria categoria) {
        Transaction transaction = null;

        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.persist(categoria);
            transaction.commit();
        }catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            throw new HibernateException("Erro ao gravar nova categoria" + e.getMessage());
        }
    }

    public void delete(Categoria categoria) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.delete(categoria);
            transaction.commit();
        }catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            throw new HibernateException("Erro ao excluir categoria" + e.getMessage());
        }
    }


    public Categoria findById(int id) {
        try (Session session = factory.openSession()) {
            return session.get(Categoria.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new HibernateException("Erro ao buscar Categoria " + e.getMessage());
        }
    }

    public void update(Categoria categoria) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.update(categoria);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            throw new HibernateException("Erro ao atualizar Categoria    " + e.getMessage());
        }
    }

}