package com.service;

import com.model.User;

import java.util.List;

public interface UserService {

    List<User> getAllUsers();
    User getUser(String name);

    void addUser(User user);
    void update(User user);
    void remove(Long id);
}
