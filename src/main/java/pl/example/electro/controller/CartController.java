package pl.example.electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.example.electro.entity.Cart;
import pl.example.electro.entity.CartItem;
import pl.example.electro.entity.Manufacturer;
import pl.example.electro.service.CartService;
import pl.example.electro.service.ManufacturerService;
import pl.example.electro.service.ProductService;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    private CartService cartService;
    private ProductService productService;
    private ManufacturerService manufacturerService;

    @Autowired
    public CartController(CartService cartService, ProductService productService, ManufacturerService manufacturerService) {
        this.cartService = cartService;
        this.productService = productService;
        this.manufacturerService = manufacturerService;
    }

    @Resource
    private Cart cart;

    @ModelAttribute("totalPrice")
    public String getSum() {
        return cartService.getTotal().toString();
    }

    @ModelAttribute("cartItems")
    public List<CartItem> getCartItems() {
        return cart.getCartItemsList();
    }

    @ModelAttribute("manufacturers")
    public List<Manufacturer> manufacturers() {
        return manufacturerService.findAll();
    }

    @ModelAttribute("highPrice")
    public BigDecimal getHighestPrice() {
        return productService.getHigh();
    }

    @RequestMapping("/")
    public String showCart() {
        return "cart";
    }

    @GetMapping("/add")
    public String addToCartById(@RequestParam Long id) {
        cartService.addProductToCart(id);
        return "redirect:/cart";
    }

    @GetMapping("/subtract")
    public String subtractFromCartById(@RequestParam Long id) {
        cartService.subtractFromCartById(id);
        return "redirect:/cart";
    }

    @GetMapping("/remove")
    public String removeFromCartById(@RequestParam Long id) {
        cartService.removeFromCartById(id);
        return "redirect:/cart";
    }
}
