package pl.example.electro.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Cart {

    private List<CartItem> cartItemsList = new ArrayList<>();

    public List<CartItem> getCartItems() {
        return cartItemsList;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItemsList = cartItems;
    }
}
