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

    public LivroDAO() {

    }

    public List<Livro> findAll() {
        try (Session session = factory.openSession()) {
            return session.createQuery("from livros").list();
        } catch (Exception e) {
            e.printStackTrace();
            throw new HibernateException("Não foi possível encontrar todos os livros: " + e.getMessage());
        }
    }

    public void save(Livro livro) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.persist(livro);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            throw new HibernateException("Erro ao gravar novo livro: " + e.getMessage());
        }
    }

    public void deleteByID(Long id) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            Livro livro = session.get(Livro.class, id);
            if (livro != null) {
                transaction = session.beginTransaction();
                session.delete(livro);
                transaction.commit();
            } else {
                throw new HibernateException("Livro com ID " + id + " não encontrado.");
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new HibernateException("Erro ao excluir livro: " + e.getMessage());
        }
    }

    public void atualizarByID(Long id, int novoISBN, String novoTitulo, String novaCategoria, int novaQuantidade) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            Livro livro = session.get(Livro.class, id);
            if (livro != null) {
                transaction = session.beginTransaction();
                livro.setIsbn(novoISBN);
                livro.setTitulo(novoTitulo);
                livro.setCategoria(novaCategoria);
                livro.setQuantidade(novaQuantidade);
                session.update(livro);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new HibernateException("Erro ao atualizar livro: " + e.getMessage());
        }
    }

    public Livro findById(int id) {
        try (Session session = factory.openSession()) {
            return session.get(Livro.class, id);
        } catch (Exception e) {

            throw new HibernateException("Erro ao buscar Livro: " + e.getMessage());
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
            throw new HibernateException("Erro ao atualizar Livro: " + e.getMessage());
        }
    }

    public List<Livro> buscarPorTitulo(String titulo) {
        try (Session session = factory.openSession()) {
            Query<Livro> query = session.createQuery("from livros where titulo like :titulo", Livro.class);
            query.setParameter("titulo", "%" + titulo + "%");
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            throw new HibernateException("Erro ao buscar Livros por título: " + e.getMessage());
        }
    }
}
