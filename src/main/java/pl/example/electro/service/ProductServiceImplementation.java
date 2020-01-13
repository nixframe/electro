package pl.example.electro.service;

import org.springframework.stereotype.Service;
import pl.example.electro.entity.Product;
import pl.example.electro.entity.Review;
import pl.example.electro.entity.User;
import pl.example.electro.repository.ProductRepository;
import pl.example.electro.repository.ReviewRepository;

@Service
public class ProductServiceImplementation implements ProductService {
    private ProductRepository productRepository;
    private ReviewRepository reviewRepository;
    private UserService userService;

    @Override
    public Product save(Product product) {
        return null;
    }

    @Override
    public Review addReview(Review review, User userId, Long productId) {
        return null;
    }

    @Override
    public Product addRating(Long productId, Integer rating) {
        return null;
    }
}
