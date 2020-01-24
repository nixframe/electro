package pl.example.electro.service;


import pl.example.electro.entity.Order;
import pl.example.electro.entity.Payment;
import pl.example.electro.entity.User;

import java.util.List;

public interface OrderService {
    Order findById(Long id);

    Order createOrder(User user);

    List<Order> getAllUserOrders(User user);

    Order payOrder(Long id, Payment payment);

    Order completeOrder(Long id);

    void cancelOrder(Long id);

}
