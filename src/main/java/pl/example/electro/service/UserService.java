package pl.example.electro.service;

import pl.example.electro.entity.User;

public interface UserService {

     User getNewEmptyUser();

     User isUserInDB(String mail);

     User saveToDB(User user);

     User findByEmail(String mail);

     User changeUserPassword(Long id, String oldPassword, String newPassword1, String newPassword2);

     User editUser(User user);

}
