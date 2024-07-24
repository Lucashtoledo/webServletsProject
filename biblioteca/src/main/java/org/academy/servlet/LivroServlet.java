package org.academy.servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.academy.dao.LivroDAO;
import org.academy.model.Livro;
import org.hibernate.HibernateException;
import java.io.IOException;
import java.util.List;


@WebServlet("/livro")
public class LivroServlet extends HttpServlet {
    LivroDAO dao;

    public void init(){
        dao = new LivroDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listLivros(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");
        String mensagem = "";

        if (acao != null) {
            switch (acao) {
                case "delete":
                    mensagem = deleteLivro(request, response);
                    break;
                case "adicionar":
                    mensagem = addLivro(request, response);
                    break;
                case "atualizar":
                    mensagem = atualizarLivro(request, response);
                    break;
                default:
                    mensagem = "Ação desconhecida.";
            }
        } else {
            mensagem = "Ação não especificada.";
        }

        HttpSession session = request.getSession();
        session.setAttribute("mensagem", mensagem);
        response.sendRedirect(request.getContextPath() + "/frontend/listar_livros.jsp");
    }

    private String addLivro(HttpServletRequest request, HttpServletResponse response) {
        try {
            int isbn = Integer.parseInt(request.getParameter("isbn"));
            String titulo = request.getParameter("titulo");
            String categoria = request.getParameter("categoria");
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));

            Livro livro = new Livro(isbn, titulo, quantidade, categoria);
            dao.save(livro);
            return "Livro cadastrado com sucesso!";
        } catch (NumberFormatException e) {
            return "Erro ao cadastrar livro: Formato de número inválido.";
        } catch (HibernateException e) {
            return e.getMessage();
        }
    }


    private String deleteLivro(HttpServletRequest request, HttpServletResponse response) {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                Long id = Long.parseLong(idParam);
                dao.deleteByID(id);
                return "Livro excluído com sucesso!";
            } catch (NumberFormatException e) {
                return "ID inválido.";
            } catch (HibernateException e) {
                return e.getMessage();
            }
        } else {
            return "ID não fornecido.";
        }
    }


    private String atualizarLivro(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idParam = request.getParameter("id");
           try{
               Long id = Long.parseLong(idParam);
               int isbn = Integer.parseInt(request.getParameter("isbn"));
               String titulo = request.getParameter("titulo");
               String categoria = request.getParameter("categoria");
               int quantidade = Integer.parseInt(request.getParameter("quantidade"));
               dao.atualizarByID(id, isbn, titulo, categoria, quantidade);
               return "Livro atualizado com sucesso!";
           }catch(NumberFormatException e){
               return "Erro ao cadastrar livro: Formato de número inválido.";
           }catch (HibernateException e){
               return e.getMessage();
           }

    }

    private void listLivros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Livro> livros = dao.findAll();
        request.setAttribute("livros", livros);
        request.getRequestDispatcher("frontend/listar_livros.jsp").forward(request, response);
    }

}