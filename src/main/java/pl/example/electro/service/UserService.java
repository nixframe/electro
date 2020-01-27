package pl.example.electro.service;

import pl.example.electro.entity.Role;
import pl.example.electro.entity.User;

import java.util.List;

public interface UserService {

     User getNewEmptyUser();

     User isUserInDB(String mail);

     User saveToDB(User user);

     User findByEmail(String mail);

     User changeUserPassword(Long userId, String oldPassword, String newPassword1, String newPassword2);

     User editUser(User user);

    List<User> getAllUsers();

    User findById(Long id);

    void deleteUser(Long id);

    List<Role> getAllRoles();

    Role getRole(Long id);
}
