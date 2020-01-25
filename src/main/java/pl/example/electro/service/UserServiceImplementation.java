package pl.example.electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.example.electro.entity.Role;
import pl.example.electro.entity.User;
import pl.example.electro.repository.AdresRepository;
import pl.example.electro.repository.RoleRepository;
import pl.example.electro.repository.UserRepository;

import java.util.Collections;
import java.util.HashSet;

@Service
public class UserServiceImplementation implements UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final AdresRepository adresRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImplementation(UserRepository userRepository, RoleRepository roleRepository, AdresRepository adresRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.adresRepository = adresRepository;
        this.passwordEncoder = passwordEncoder;
    }


    @Override
    public User getNewEmptyUser() {
        return new User();
    }

    @Override
    public User isUserInDB(String mail) {
        if (userRepository.findByEmail(mail) == null) {
            return null;
        }
        return userRepository.findByEmail(mail);
    }

    @Override
    public User saveToDB(User user) {
        // TODO: send email with activation link through a mail service
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(true);
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<>(Collections.singletonList(userRole)));
        userRepository.save(user);
        return user;
    }

    @Override
    public User findByEmail(String mail) {
        return userRepository.findByEmail(mail);
    }

    @Override
    public User changeUserPassword(Long userId, String oldPassword, String newPassword1, String newPassword2) throws IllegalArgumentException {
        User user = userRepository.findFirstById(userId);
        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
//            throw new BadCredentialsException();
//            throw new SecurityException();
            throw new IllegalArgumentException();
        }
        if (!newPassword1.equals(newPassword2)) {
            throw new IllegalArgumentException();
        }
        user.setPassword(passwordEncoder.encode(newPassword1));
        return userRepository.save(user);
    }

    @Override
    public User editUser(User user) {
        return userRepository.save(user);
    }


}
