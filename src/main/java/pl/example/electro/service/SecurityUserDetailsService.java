package pl.example.electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import pl.example.electro.entity.CurrentUser;
import pl.example.electro.entity.Role;
import pl.example.electro.entity.User;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;

public class SecurityUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession httpSession;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User test = userService.findByEmail(s);
        if (test == null) {
            throw new UsernameNotFoundException(s);
        }
        Set<GrantedAuthority> roles = new HashSet<>();
        for (Role role : test.getRoles()) {
            roles.add(new SimpleGrantedAuthority(role.getName()));
        }
        httpSession.setAttribute("name", test.getFullName());
        return new CurrentUser(test.getEmail(), test.getPassword(), roles, test);
    }
}
