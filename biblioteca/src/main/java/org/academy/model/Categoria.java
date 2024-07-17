package org.academy.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "categorias")
public class Categoria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long cod_cat;
    @Column(nullable = false)
    private String nome;

    public Categoria(String nome) {
        this.nome = nome;
    }
}
