package com.dao;

import com.container.UserContainer;
import com.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private UserContainer userContainer;

    @Override
    public List<User> getAllUsers() {
        List<User> users = entityManager.createQuery("from User", User.class).getResultList();
        return users;
//        return userContainer.getAllUsers();
    }

    @Override
    public User getUser(String name) {

        return entityManager.createQuery("from User u where u.name=:name", User.class).getSingleResult();
    }

    @Override
    public void addUser(User user) {

        entityManager.persist(user);
    }

    @Override
    public void update(User user) {
        entityManager.merge(user);
    }

    @Override
    public void remove(Long id) {
        User user = entityManager.find(User.class, id);
        entityManager.remove(user);
    }
}
