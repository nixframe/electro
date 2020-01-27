package pl.example.electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.example.electro.entity.Product;
import pl.example.electro.service.ProductService;
import pl.example.electro.service.UserService;


@org.springframework.web.bind.annotation.RestController
@Secured("ROLE_ADMIN")
public class RestController {

    private ProductService productService;

    @Autowired
    public RestController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/rest")
    public Product getProduct(@RequestParam Long id) {
        return productService.findById(id);
    }
}
