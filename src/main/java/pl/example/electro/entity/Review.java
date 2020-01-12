package pl.example.electro.entity;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String author;
    private String text;
    private LocalDateTime created;

    @ManyToOne
    private Product product;

}
