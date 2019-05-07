package com.dao;

import com.container.UserContainer;
import com.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserDaoImpl implements UserDao {

    @Autowired
    private UserContainer userContainer;

    @Override
    public List<User> getAllUsers() {
        return userContainer.getAllUsers();
    }

    @Override
    public User getUser(String name) {
        return userContainer.getUser(name);
    }

    @Override
    public void addUser(User user) {
        userContainer.add(user);
    }

    @Override
    public void update(User user) {

    }

    @Override
    public void remove(Long id) {

    }
}
