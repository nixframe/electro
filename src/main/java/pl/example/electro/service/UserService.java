package pl.example.electro.service;

import pl.example.electro.entity.User;

public interface UserService {

     User getNewEmptyUser();

     User isUserInDB(String mail);

     User saveToDB(User user);

     User findByEmail(String mail);

}
