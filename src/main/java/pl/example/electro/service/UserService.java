package pl.example.electro.service;

import pl.example.electro.entity.User;

public interface UserService {

     User getNewEmptyUser();

     boolean isUserInDB(String mail);

     User saveToDB(User user);

     User findByMail(String mail);
}
