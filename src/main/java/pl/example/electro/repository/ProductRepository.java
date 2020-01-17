package pl.example.electro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.example.electro.entity.Product;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query("SELECT max(price) FROM Product")
    BigDecimal high();

    List<Product> findFirst3ByOrderByCreated();

    Product findFirstById(Long Id);
}
