package pl.example.electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.example.electro.entity.Manufacturer;
import pl.example.electro.entity.Product;
import pl.example.electro.service.ManufacturerService;
import pl.example.electro.service.ProductService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {
    private ProductService productService;
    private ManufacturerService manufacturerService;

    @Autowired
    public HomeController(ProductService productService, ManufacturerService manufacturerService) {
        this.productService = productService;
        this.manufacturerService = manufacturerService;
    }

    @ModelAttribute("sampleProducts")
    public List<Product> getSampleProducts() {
        return productService.getSampleProducts();
    }

    @RequestMapping("/")
    public String getHomePage(Model model, HttpSession session) {
        session.setAttribute("highPrice", productService.getHigh());
        List<Manufacturer> manufacturers = manufacturerService.findAll();
        session.setAttribute("manufacturers", manufacturers);
        return "index";
    }
}
