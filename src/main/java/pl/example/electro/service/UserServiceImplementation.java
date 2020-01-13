package pl.example.electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.example.electro.entity.User;
import pl.example.electro.repository.UserRepository;

@Service
public class UserServiceImplementation implements UserService {
    private UserRepository userRepository;

    @Autowired
    public UserServiceImplementation(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @Override
    public User findByMail(String mail) {
        return userRepository.findByMail(mail);
    }
}
