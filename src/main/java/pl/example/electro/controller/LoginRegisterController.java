package pl.example.electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.example.electro.entity.User;
import pl.example.electro.service.UserService;
import pl.example.electro.validation.UserRegisterValidationGroup;

@Controller
public class LoginRegisterController {
    private UserService userService;

    @Autowired
    public LoginRegisterController(UserService userService) {
        this.userService = userService;
    }


    // LOGIN

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String postLoginPage(Model model) {
        model.addAttribute("error", "Wrong credentials");
        return "login";
    }

    // REGISTER

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", userService.getNewEmptyUser());
        return "register";
    }

    @PostMapping("/register")
    public String showRegistrationForm(@Validated(UserRegisterValidationGroup.class) @ModelAttribute("user") User user, BindingResult bindingResult, @RequestParam("password2") String password2) {
        if (bindingResult.hasErrors()) {
            return "register";
        }
        if (userService.isUserInDB(user.getEmail()) != null) {
            bindingResult.addError(new FieldError("user", "email", "Email is already in use"));
            return "register";
        }
        if (!user.getPassword().equals(password2)) {
            bindingResult.addError(new FieldError("user", "password", "Passwords do not match"));
            return "register";
        }

        userService.saveToDB(user);
        return "redirect:/login";
    }

    // LOGOUT AND ACCESS ERROR

    @PostMapping("/logout")
    public String logout() {
        return "redirect:/";
    }

    @GetMapping("/403")
    public String forbidden() {
        return "403";
    }

}
