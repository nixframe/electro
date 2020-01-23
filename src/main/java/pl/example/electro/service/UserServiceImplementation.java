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
    private final AdresRepository addressRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImplementation(UserRepository userRepository, RoleRepository roleRepository, AdresRepository addressRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.addressRepository = addressRepository;
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

}
