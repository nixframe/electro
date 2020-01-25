package pl.example.electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.example.electro.entity.*;
import pl.example.electro.repository.OrderRepository;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class OrderServiceImplementation implements OrderService{
    private OrderRepository orderRepository;
    private CartService cartService;
    private ProductService productService;

    @Autowired
    public OrderServiceImplementation(OrderRepository orderRepository, CartService cartService, ProductService productService) {
        this.orderRepository = orderRepository;
        this.cartService = cartService;
        this.productService = productService;
    }

    @Override
    public Order findById(Long id) {
        return orderRepository.getFirstById(id);
    }

    @Override
    public Order createOrder(User user) {
        Order order = new Order();
        for (CartItem item : cartService.getCartItems()) {
            order.getOrderItemList().add(new OrderItem(item.getProduct(), item.getProductQuantity()));
            productService.findById(item.getProduct().getId())
                    .setQuantity(productService.findById(item.getProduct().getId()).getQuantity() - item.getProductQuantity());
        }
        order.setUser(user);
        order.setTotalAmount(cartService.getTotal());
        order.setPaymentReceived(false);
        order.setOrderCreation(LocalDateTime.now());
        orderRepository.save(order);
        cartService.clearCart();
        return order;
    }

    @Override
    public List<Order> getAllUserOrders(User user) {
        return orderRepository.findAllByUserId(user.getId());
    }

    @Override
    public Order payOrder(Order order) {
        order.setPaymentReceived(true);
        return orderRepository.save(order);
    }

    @Override
    public Order completeOrder(Long id) {
        Order order = orderRepository.getFirstById(id);
        order.setOrderCompletion(LocalDateTime.now());
        return orderRepository.save(order);
    }

    @Override
    public void cancelOrder(Long orderId) {
        Order order = orderRepository.getFirstById(orderId);
        for (OrderItem item : order.getOrderItemList()) {
            productService.findById(item.getProduct().getId()).setQuantity(productService.findById(item.getProduct().getId()).getQuantity() + item.getProductQuantity());
        }
        orderRepository.delete(order);
    }
}
