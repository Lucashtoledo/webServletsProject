package org.academy.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "livros")
public class Livro {
    @Id
    @Column(nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    private Integer isbn;
    @Column(nullable = false)
    private String titulo;
    @Column(nullable = false)
    private Integer quantidade;
    @Column
    private String categoria;

    public Livro(Integer isbn, String titulo, Integer quantidade, String categoria) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.quantidade = quantidade;
        this.categoria = categoria;
    }
    public Livro(Integer isbn, String titulo, Integer quantidade) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.quantidade = quantidade;
    }

}
