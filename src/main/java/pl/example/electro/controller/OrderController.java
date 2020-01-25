package pl.example.electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.example.electro.entity.*;
import pl.example.electro.service.OrderService;
import pl.example.electro.service.UserService;

@Controller
@RequestMapping("/order")
@Secured("ROLE_USER")
public class OrderController {
    private OrderService orderService;
    private UserService userService;

    @Autowired
    public OrderController(OrderService orderService, UserService userService) {
        this.orderService = orderService;
        this.userService = userService;
    }

    @GetMapping("/details")
    public String showOrderDetails(Model model, @RequestParam Long orderId) {
        Order order = orderService.findById(orderId);
        model.addAttribute("order", order);
        return "order/orderDetails";
    }

    //  CREATE ORDER
    @GetMapping("/create")
    public String getCreateOrder(@AuthenticationPrincipal CurrentUser currentUser, Model model) {
        User user = userService.findByEmail(currentUser.getUsername());
        if (user.getAdres() == null) {
            model.addAttribute("adress", new Adres());
            return "user/requestUserAdress";
        }
        model.addAttribute("order", orderService.createOrder(user));
        return "order/createOrder";
    }

    @PostMapping("/create")
    public String postCreateOrder(@RequestParam Long orderId, RedirectAttributes redirectAttributes) {
        redirectAttributes.addAttribute("orderId", orderId);
        return "redirect:/order/pay";
    }

    @PostMapping("/resign")
    public String postResignOrder(@RequestParam Long orderId) {
        orderService.cancelOrder(orderId);
        return "redirect:/user/";
    }

    @GetMapping("/pay")
    public String getPayForm(@RequestParam Long orderId, Model model) {
        model.addAttribute("orderId", orderId);
        return "order/paymentSelect";
    }

    @PostMapping("/pay")
    public String postPayForm(@RequestParam Long orderId, @RequestParam String payment) {
        Order order = orderService.findById(orderId);
        switch (payment) {
            case "wire":
                order.setPaymentType(Payment.WIRE_TRANSFER);
                break;
            default:
            case "cod":
                order.setPaymentType(Payment.CASH_ON_DELIVERY);
                break;
        }
        orderService.payOrder(order);
        return "order/confirmOrder";
    }
}
