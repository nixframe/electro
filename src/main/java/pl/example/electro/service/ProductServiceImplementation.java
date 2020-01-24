package pl.example.electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.example.electro.entity.Product;
import pl.example.electro.entity.Review;
import pl.example.electro.entity.User;
import pl.example.electro.repository.ProductRepository;
import pl.example.electro.repository.ReviewRepository;

import java.math.BigDecimal;
import java.util.ArrayList;
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

    @Override
    public List<Product> findByManufacturers(String[] manufacturers) {
        if (manufacturers != null) {
            List<Long> ids = new ArrayList<>();

            for (String s : manufacturers) {
                try {
                    ids.add(Long.parseLong(s));
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }

            if (ids.size() > 0) {
                return productRepository.findAllByManufacturerId(ids);
            }
        }
        return null;
    }

    @Override
    public List<Product> filterByPriceBetween(String minPrice, String maxPrice) {
        if (minPrice != null & maxPrice != null) {
            try{
                return productRepository.findAllByPriceBetween(new BigDecimal(minPrice), new BigDecimal(maxPrice));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
