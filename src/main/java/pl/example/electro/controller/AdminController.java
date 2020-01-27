package pl.example.electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.example.electro.entity.Manufacturer;
import pl.example.electro.entity.Product;
import pl.example.electro.entity.User;
import pl.example.electro.service.ManufacturerService;
import pl.example.electro.service.OrderService;
import pl.example.electro.service.ProductService;
import pl.example.electro.service.UserService;

import javax.validation.Valid;

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

    @GetMapping("")
    public String showAdminPanel() {
        return "admin/adminPanel";
    }

    // USERS

    @GetMapping("/user")
    public String getUserList(Model model) {
        model.addAttribute("userList", userService.getAllUsers());
        return "admin/users/userList";
    }

    @GetMapping("/user/adres")
    public String getUserAdresDetails(@RequestParam Long id, Model model) {
        model.addAttribute("adres", userService.findById(id).getAdres());
        return "admin/users/userAdres";
    }

    @GetMapping("/user/deactivate")
    public String getDeactivateUser(@RequestParam Long id) {
        User user = userService.findById(id);
        user.setEnabled(false);
        userService.editUser(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/user/activate")
    public String getActivateUser(@RequestParam Long id) {
        User user = userService.findById(id);
        user.setEnabled(true);
        userService.editUser(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/user/delete")
    public String getDeleteUser(@RequestParam Long id) {
        userService.deleteUser(id);
        return "redirect:/admin/users";
    }

    @Secured("ROLE_SUPER")
    @GetMapping("/user/role")
    public String getUserRoles(@RequestParam Long userId, Model model) {
        model.addAttribute("user", userService.findById(userId));
        return "admin/users/userRoles";
    }

    @Secured("ROLE_SUPER")
    @GetMapping(value = "/user/role/remove", params = {"userId", "roleId"})
    public String getRemoveUserRole(@RequestParam Long userId, @RequestParam Long roleId, Model model) {
        User user = userService.findById(userId);
        user.getRoles().remove(userService.getRole(roleId));
        userService.editUser(user);
        model.addAttribute("user", user);
        return "admin/users/userRoles";
    }

    @Secured("ROLE_SUPER")
    @GetMapping(value = "/user/role/add", params = {"userId"})
    public String getManageUserRole(@RequestParam Long userId, Model model) {
        model.addAttribute("user", userService.findById(userId));
        model.addAttribute("roles", userService.getAllRoles());
        return "admin/users/addUserRole";
    }

    @Secured("ROLE_SUPER")
    @GetMapping(value = "/user/role/add", params = {"userId", "roleId"})
    public String getAddUserRole(@RequestParam Long userId, @RequestParam Long roleId, Model model, RedirectAttributes redirectAttributes) {
        User user = userService.findById(userId);
        user.getRoles().add(userService.getRole(roleId));
        userService.editUser(user);
        redirectAttributes.addAttribute("userId", userId);
        return "redirect:/admin/user/role";
    }

    // PRODUCTS

    @GetMapping("/product")
    public String getProductList(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "admin/products/productList";
    }

    @GetMapping("/product/edit")
    public String getEditProduct(@RequestParam("prodId") Long productId, Model model) {
        model.addAttribute("manufacturers", manufacturerService.findAll());
        model.addAttribute("product", productService.findById(productId));
        return "admin/products/editProduct";
    }

    @PostMapping("/product/edit")
    public String postEditProduct(@Valid Product product, BindingResult bindingResult, @RequestParam("prodId") Long productId, Model model) {
        if (!bindingResult.hasErrors()) {
            model.addAttribute("manufacturers", manufacturerService.findAll());
            return "admin/products/editProduct";
        }
        productService.editProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/product/add")
    public String getAddProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("manufacturers", manufacturerService.findAll());
        return "admin/products/addProduct";
    }

    @PostMapping("/product/add")
    public String postAddProduct(@Validated Product product, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("manufacturers", manufacturerService.findAll());
            return "admin/products/addProduct";
        }
        productService.save(productService.initializeProduct(product));
        return "admin/products/addProduct";
    }

    // MANUFACTURER

    @GetMapping("/product/manufacturer")
    public String addManufacturer(Model model) {
        model.addAttribute("manufacturer", new Manufacturer());
        return "admin/products/addManufacturer";
    }

    @PostMapping("/manufacturer/add")
    public String saveManufacturer(@Valid Manufacturer manufacturer, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/products/addManufacturer";
        }
        manufacturerService.save(manufacturer);
        return "redirect:/admin/product";
    }

    // ORDERS

    @GetMapping("/orders")
    public String getOrderSelect() {
        return "admin/orders/orderSelect";
    }

    @GetMapping("/orders/completed")
    public String getCompletedOrders(Model model) {
        model.addAttribute("title", "Completed orders");
        model.addAttribute("orders", orderService.getCompleted());
        return "admin/orders/orderList";
    }

    @GetMapping("/orders/pending")
    public String getPendingOrders(Model model) {
        model.addAttribute("title", "Pending orders");
        model.addAttribute("orders", orderService.getPending());
        model.addAttribute("action", "send");
        return "admin/orders/orderList";
    }

    @GetMapping("/orders/notpaid")
    public String getNotPaidOrders(Model model) {
        model.addAttribute("title", "Not paid orders");
        model.addAttribute("orders", orderService.getNotPaid());
        model.addAttribute("action", "del");
        return "admin/orders/orderList";
    }

    @GetMapping("/orders/complete")
    public String getCompleteOrder(@RequestParam Long id) {
        orderService.completeOrder(id);
        return "redirect:/admin/orders";
    }

    @GetMapping("/orders/del")
    public String getDeleteOrder(@RequestParam Long id) {
        orderService.cancelOrder(id);
        return "redirect:/admin/orders";
    }
}
