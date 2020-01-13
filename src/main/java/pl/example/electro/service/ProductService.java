package pl.example.electro.service;

import org.springframework.data.jpa.repository.Query;
import pl.example.electro.entity.Product;
import pl.example.electro.entity.Review;
import pl.example.electro.entity.User;

import java.math.BigDecimal;
import java.util.List;

public interface ProductService {

    Product save(Product product);
    Review addReview(Review review, User userId, Long productId);
    Product addRating(Long productId, Integer rating);
}
