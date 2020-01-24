package pl.example.electro.service;

import pl.example.electro.entity.CartItem;

import java.math.BigDecimal;
import java.util.List;

public interface CartService {
    List<CartItem> getCartItems();

    void addProductToCart(Long id);

    BigDecimal getTotal();

    void subtractFromCartById(Long id);

    void removeFromCartById(Long id);

    void clearCart();
}
