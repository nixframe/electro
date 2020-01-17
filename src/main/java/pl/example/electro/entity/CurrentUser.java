package pl.example.electro.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CurrentUser extends User {
    private final pl.example.electro.entity.User user;

    public CurrentUser(String mail, String password, Collection<? extends GrantedAuthority> roles, pl.example.electro.entity.User user) {
        super(mail, password, roles);
        this.user = user;
    }

    public pl.example.electro.entity.User getUser() {
        return user;
    }
}
