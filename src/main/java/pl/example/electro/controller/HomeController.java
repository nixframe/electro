package pl.example.electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.example.electro.service.MAnufacturerService;
import pl.example.electro.service.ProductService;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    private ProductService productService;
    private MAnufacturerService manufacturerService;

    @Autowired
    public HomeController(ProductService productService, MAnufacturerService manufacturerService) {
        this.productService = productService;
        this.manufacturerService = manufacturerService;
    }

    @RequestMapping("")
    public String homePage(Model model, HttpSession session) {
        return "index";
    }
}
