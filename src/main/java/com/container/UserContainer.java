package com.container;

import com.model.Role;
import com.model.User;

import java.util.*;

public class UserContainer {

    private HashMap<String, User> users = new HashMap<>();

    public void init(){

        Role role_user = new Role();
        role_user.setName("ROLE_USER");

        Role role_admin = new Role();
        role_admin.setName("ROLE_ADMIN");

        Set<Role> role_users = new HashSet<>();
        Set<Role> role_admins = new HashSet<>();

        role_users.add(role_user);
        role_admins.add(role_user);
        role_admins.add(role_admin);

        users.put("user", new User("user", "user", role_users));
        users.put("admin", new User("admin", "admin", role_admins));
    }

    public void add(User user){
        users.put(user.getUsername(), user);

    }
    public User getUser(String name){
        return users.get(name);
    }
    public List<User> getAllUsers(){
        List<User> list = new ArrayList<>();

        for(Map.Entry<String, User> e : users.entrySet()){
            list.add(e.getValue());
        }
        return list;
    }
}
