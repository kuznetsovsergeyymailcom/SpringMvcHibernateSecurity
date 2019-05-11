package com.dao;

import com.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<User> getAllUsers() {
        List<User> users = entityManager.createQuery("from User", User.class).getResultList();
        return users;
    }

    @Override
    public User getUserById(Long id) {
        return entityManager.find(User.class, id);
    }

    @Override
    public User getUserByName(String name) {
        TypedQuery<User> query = entityManager.createQuery("from User u where u.username=:name", User.class);
        query.setParameter("name", name);
        User singleResult = query.getSingleResult();
        return singleResult;
    }

    @Override
    public void addUser(User user) {
        entityManager.persist(user);
    }

    @Override
    public void update(User user) {
        try{
            entityManager.merge(user);

        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void remove(Long id) {
        User user = entityManager.find(User.class, id);
        entityManager.remove(user);
    }
}
