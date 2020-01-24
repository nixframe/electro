package pl.example.electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.example.electro.entity.Manufacturer;
import pl.example.electro.entity.Product;
import pl.example.electro.service.ManufacturerService;
import pl.example.electro.service.ProductService;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/prod")
public class ProductController {

    private ProductService productService;
    private ManufacturerService manufacturerService;

    @Autowired
    public ProductController(ProductService productService, ManufacturerService manufacturerService) {
        this.productService = productService;
        this.manufacturerService = manufacturerService;
    }

    @ModelAttribute("manufacturers")
    public List<Manufacturer> manufacturers() {
        return manufacturerService.findAll();
    }

    @ModelAttribute("highPrice")
    public BigDecimal getHighestPrice() {
        return productService.getHigh();
    }

    @RequestMapping("/all")
    public String getAllProducts(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "products/allProducts";
    }

    // TODO change reqParam to List<Manufacturers> via Converter
    // TODO add search by category

    @RequestMapping("/search")
    public String getSearchResults(Model model, @RequestParam(required = false) String[] manufacturers, @RequestParam(required = false) String minPrice, @RequestParam(required = false) String maxPrice) {
        List<Product> response = new ArrayList<>();
        List<Product> tmp = productService.findByManufacturers(manufacturers);
        if (tmp != null) {
            response.addAll(tmp);
        }
        tmp = productService.filterByPriceBetween(minPrice, maxPrice);
        if (tmp != null & tmp.size() > 0) {
            response.retainAll(tmp);
        }

        model.addAttribute("products", response);
        return "products/allProducts";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getProductById(Model model, @PathVariable(name = "id") Long productId) {
        model.addAttribute("product", productService.findById(productId));
        return "products/product";
    }
}
