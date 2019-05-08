package com.service;

import com.model.User;

import java.util.List;

public interface UserService {

    List<User> getAllUsers();
    User getUserByName(String name);
    User getUserById(Long id);

    void addUser(User user);
    void update(User user);
    void remove(Long id);
}
