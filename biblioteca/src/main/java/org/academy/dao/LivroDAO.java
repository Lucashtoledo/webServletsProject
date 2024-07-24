//classe responsável pelo CRUD da tabela "livros"
package org.academy.dao;

import org.academy.model.Livro;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


import java.util.List;

public class LivroDAO {

    private SessionFactory factory = ServiceDAO.getSessionFactory();

    public LivroDAO(SessionFactory sessionFactory) {
    }

    public List<Livro> findAll(){
        try (Session session = factory.openSession()) {
            return session.createQuery("from livros").list();
        }catch (Exception e) {
            e.printStackTrace();
            throw new HibernateException("Não foi possivel encontrar todos os livros" + e.getMessage());
        }
    }

    public void save(Livro livro) {
        Transaction transaction = null;

        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.persist(livro);
            transaction.commit();
        }catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            throw new HibernateException("Erro ao gravar novo livro" + e.getMessage());
        }
    }

    public void delete(Livro livro) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.delete(livro);
            transaction.commit();
        }catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            throw new HibernateException("Erro ao excluir livro" + e.getMessage());
        }
    }


    public Livro findById(int id) {
        try (Session session = factory.openSession()) {
            return session.get(Livro.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new HibernateException("Erro ao buscar Livro " + e.getMessage());
        }
    }

    public void update(Livro livro) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.update(livro);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            throw new HibernateException("Erro ao atualizar Livro    " + e.getMessage());
        }
    }

    public List<Livro> buscarPorTitulo(String titulo) {
        try (Session session = factory.openSession()) {
            Query<Livro> query = session.createQuery("from livros where titulo like :titulo", Livro.class);
            query.setParameter("titulo", "%" + titulo + "%");
            return query.getResultList();
        }catch (Exception e) {
            e.printStackTrace();
            throw new HibernateException("Erro ao buscar Livros por título" + e.getMessage());
        }
    }

    public List<Livro> buscarPorCategoria(String categoria) {
        try (Session session = factory.openSession()) {
            Query<Livro> query = session.createQuery("from livros where categorias.nome = :categoria", Livro.class);
            query.setParameter("categoria", categoria);
            return query.getResultList();
        }catch (Exception e) {
            e.printStackTrace();
            throw new HibernateException("Erro ao buscar Livros por categoria" + e.getMessage());
        }
    }

}