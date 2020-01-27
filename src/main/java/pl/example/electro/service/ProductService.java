package pl.example.electro.service;

import pl.example.electro.entity.Product;
import pl.example.electro.entity.Review;
import pl.example.electro.entity.User;

import java.math.BigDecimal;
import java.util.List;

public interface ProductService {

    BigDecimal getHigh();

    void save(Product product);

    Review addReview(Review review, User userId, Long productId);

    Product addRating(Long productId, Integer rating);

    List<Product> getAllProducts();

    List<Product> getSampleProducts();

    Product findById(Long id);

    List<Product> findByManufacturers(String[] manufacturers);

    List<Product> filterByPriceBetween(String minPrice, String maxPrice);

    void editProduct(Product product);

    Product initializeProduct(Product product);
}
