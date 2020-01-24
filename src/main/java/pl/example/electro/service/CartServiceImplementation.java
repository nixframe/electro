package pl.example.electro.service;

import org.springframework.stereotype.Service;
import pl.example.electro.entity.Cart;
import pl.example.electro.entity.CartItem;
import pl.example.electro.entity.Product;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;

@Service
public class CartServiceImplementation implements CartService {
    private ProductService productService;

    @Resource
    private Cart cart;

    public CartServiceImplementation(ProductService productService) {
        this.productService = productService;
    }

    @Override
    public List<CartItem> getCartItems() {
        return cart.getCartItemsList();
    }

    @Override
    public void addProductToCart(Long id) {
        Product product = productService.findById(id);
        if (product != null) {
            for (CartItem c : cart.getCartItemsList()) {
                if (c.getProduct().getId().equals(product.getId())) {
                    if ((product.getQuantity() - c.getProductQuantity()) > 0) {
                        c.setProductQuantity(c.getProductQuantity() + 1);
                    }
                    return;
                }
            }
        }
        cart.getCartItemsList().add(new CartItem(product, 1));
    }

    @Override
    public BigDecimal getTotal() {
        double total = 0;
        for (CartItem c : cart.getCartItemsList()) {
            total += c.getProductQuantity() * c.getProduct().getPrice().doubleValue();
        }
        return BigDecimal.valueOf(total);
    }

    @Override
    public void subtractFromCartById(Long id) {
        for (CartItem c : cart.getCartItemsList()) {
            if (c.getProduct().getId().equals(id)) {
                if (c.getProductQuantity() > 1) {
                    c.setProductQuantity(c.getProductQuantity() - 1);
                }
                // TODO Removing from cart when quantity == 1
                return;
            }
        }
    }

    @Override
    public void removeFromCartById(Long id) {
        cart.getCartItemsList().removeIf(c -> c.getProduct().getId().equals(id));
    }

    @Override
    public void clearCart() {
        cart.getCartItemsList().clear();
    }
}
