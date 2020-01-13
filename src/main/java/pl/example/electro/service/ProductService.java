package pl.example.electro.service;

import pl.example.electro.entity.Product;
import pl.example.electro.entity.Review;
import pl.example.electro.entity.User;

public interface ProductService {

    Product save(Product product);
    Review addReview(Review review, User userId, Long productId);
    Product addRating(Long productId, Integer rating);
}
