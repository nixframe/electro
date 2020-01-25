package pl.example.electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.example.electro.service.ManufacturerService;
import pl.example.electro.service.OrderService;
import pl.example.electro.service.ProductService;
import pl.example.electro.service.UserService;

@Controller
@RequestMapping("/admin")
@Secured("ROLE_ADMIN")
public class AdminController {
    private UserService userService;
    private ManufacturerService manufacturerService;
    private ProductService productService;
    private OrderService orderService;

    @Autowired
    public AdminController(UserService userService, ManufacturerService manufacturerService, ProductService productService, OrderService orderService) {
        this.userService = userService;
        this.manufacturerService = manufacturerService;
        this.productService = productService;
        this.orderService = orderService;
    }

    // PANEL

    @RequestMapping("")
    public String showAdminPanel() {
        return "admin/adminPanel";
    }
}
