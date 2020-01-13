package pl.example.electro.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Entity
@Table(name="review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    private String author;
    @Column(columnDefinition = "text")
    @NotBlank
    private String text;
    private LocalDateTime created;

    @ManyToOne
    private Product product;

}
