package com.dao;

import com.model.User;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;

public interface UserDao {
    List<User> getAllUsers();
    User getUserByName(String name);
    User getUserById(Long id);

    void addUser(User user);
    void update(User user);
    void remove(Long id);
}
