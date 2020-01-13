package pl.example.electro.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "product")
public class Product {

    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    public List<Review> reviews = new ArrayList<>();

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    private String name;
    @NotNull
    @ManyToOne
    private Manufacturer manufacturer;
    @NotBlank
    @Column(columnDefinition = "text")
    private String description;
    @NotNull
    private BigDecimal price;
    private Integer quantity;
    @Max(7)
    private Double rating;
    private Integer ratingsNumber;
    private String picture;
    private LocalDateTime created;

}
