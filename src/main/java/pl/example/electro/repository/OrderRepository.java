package pl.example.electro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.example.electro.entity.Order;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findAllByUserId(Long id);

    Order getFirstById(Long id);

    List<Order> findAllByOrderCompletionIsNotNull();

    List<Order> findAllByOrderCompletionIsNullAndPaymentReceivedIsFalse();

    List<Order> findAllByOrderCreationIsNotNull();

    List<Order> findAllByOrderCompletionIsNullAndPaymentReceivedIsTrue();


}
