package pl.example.electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.example.electro.entity.User;
import pl.example.electro.repository.AdresRepository;
import pl.example.electro.repository.RoleRepository;
import pl.example.electro.repository.UserRepository;

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
    public boolean isUserInDB(String mail) {
        return userRepository.findByMail(mail) == null;
    }

    @Override
    public User saveToDB(User user) {
        // TODO: send email with activation link through a mail service
        user.setActivated(true);
        userRepository.save(user);
        return user;
    }


    @Override
    public User findByMail(String mail) {
        return userRepository.findByMail(mail);
    }
}
