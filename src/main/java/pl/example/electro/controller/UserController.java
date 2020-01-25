package pl.example.electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.example.electro.entity.Adres;
import pl.example.electro.entity.CurrentUser;
import pl.example.electro.entity.Order;
import pl.example.electro.entity.User;
import pl.example.electro.service.OrderService;
import pl.example.electro.service.UserService;
import pl.example.electro.validation.UserEditValidationGroup;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user/")
@Secured("ROLE_USER")
public class UserController {

    private UserService userService;
    private OrderService orderService;

    @Autowired
    public UserController(UserService userService, OrderService orderService) {
        this.userService = userService;
        this.orderService = orderService;
    }

    @ModelAttribute("user")
    public User getUser(@AuthenticationPrincipal CurrentUser currentUser) {
        return userService.findByEmail(currentUser.getUser().getEmail());
    }

    @ModelAttribute("user_orders")
    public List<Order> getUserOrders(@AuthenticationPrincipal CurrentUser currentUser) {
        return orderService.getAllUserOrders(currentUser.getUser());
    }

    // PANEL

    @RequestMapping("/")
    public String showUserPanel() {
        return "user/userPanel";
    }

    // DATA CHANGE

    @RequestMapping(value = "/edit/data", method = RequestMethod.GET)
    public String getEditUserDataForm() {
        return "user/editUserData";
    }

    @RequestMapping(value = "/edit/data", method = RequestMethod.POST)
    public String postEditUserDataForm(@Validated({UserEditValidationGroup.class}) User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "user/editUserData";
        }
        userService.editUser(user);
        return "redirect:/user/";
    }

    // PASSWORD CHANGE

    @RequestMapping(value = "/edit/password", method = RequestMethod.GET)
    public String getEditUserPasswordForm() {
        return "user/editUserPassword";
    }

    @PostMapping("/edit/password")
    public String postEditUserPasswordForm(@AuthenticationPrincipal CurrentUser currentUser,
                                           Model model,
                                           @RequestParam(name = "presentPassword") String oldPassword,
                                           @RequestParam(name = "newPassword0") String newPassword,
                                           @RequestParam(name = "newPassword1") String control) {

        Long userId = userService.findByEmail(currentUser.getUsername()).getId();
        try {
            userService.changeUserPassword(userId, oldPassword, newPassword, control);
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", "Passwords do not match");
            return "/user/editUserPassword";
        }
        return "redirect:/user/";
    }

    // ADRES CHANGE

    @RequestMapping(value = "/edit/adres", method = RequestMethod.GET)
    public String getEditUserAdresForm(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User user = userService.findByEmail(currentUser.getUsername());
        model.addAttribute("address", user.getAdres() == null ? new Adres() : user.getAdres());
        return "user/editUserAdres";
    }

    @RequestMapping(value = "/edit/adres", method = RequestMethod.POST)
    public String postEditUserAdresForm(@AuthenticationPrincipal CurrentUser currentUser, @Validated Adres adres, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "user/editUserAdres";
        }
        User user = getUser(currentUser);
        user.setAdres(adres);
        userService.editUser(user);
        return "redirect:/user/";
    }
}
