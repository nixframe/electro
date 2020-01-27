package pl.example.electro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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

    List<Product> findFirstByManufacturerId(Long id);

    List<Product> findAllByManufacturerIdIn(List<Long> ids);

    @Query("SELECT p FROM Product p JOIN p.manufacturer m WHERE m.id IN :ids")
    List<Product> findAllByManufacturersIds(@Param("ids") List<Long> ids);

    List<Product> findAllByPriceBetween(BigDecimal minPrice, BigDecimal maxPrice);
}
