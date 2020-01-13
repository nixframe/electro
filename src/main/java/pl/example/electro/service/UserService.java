package pl.example.electro.service;

import pl.example.electro.entity.User;

public interface UserService {

     User findByMail(String mail);
}
