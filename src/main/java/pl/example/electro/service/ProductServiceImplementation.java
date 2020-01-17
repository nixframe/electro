package pl.example.electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.example.electro.entity.Product;
import pl.example.electro.entity.Review;
import pl.example.electro.entity.User;
import pl.example.electro.repository.ProductRepository;
import pl.example.electro.repository.ReviewRepository;

import java.math.BigDecimal;
import java.util.List;

@Service
public class ProductServiceImplementation implements ProductService {

    private ProductRepository productRepository;
    private ReviewRepository reviewRepository;
    private UserService userService;

    @Autowired
    public ProductServiceImplementation(ProductRepository productRepository, ReviewRepository reviewRepository, UserService userService) {
        this.productRepository = productRepository;
        this.reviewRepository = reviewRepository;
        this.userService = userService;
    }

    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public BigDecimal getHigh() {
        return productRepository.high();
    }

    @Override
    public Review addReview(Review review, User userId, Long productId) {
        return review;
    }

    @Override
    public Product addRating(Long productId, Integer rating) {
        return null;
    }

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> getSampleProducts() {
        return productRepository.findFirst3ByOrderByCreated();
    }

    @Override
    public Product findById(Long id) {
        return productRepository.findFirstById(id);
    }
}
