package com.config.initdatabase;

import com.model.Role;
import com.model.User;
import com.service.RoleService;
import com.service.UserService;

import java.util.HashSet;
import java.util.Set;

public class DatabaseInitializer {
    private UserService userService;
    private RoleService roleService;

    public DatabaseInitializer(UserService userService, RoleService roleService) {
        this.userService = userService;
        this.roleService = roleService;
    }

    private void init() {
        Role adminRole = new Role("ADMIN");
        Role userRole = new Role("USER");

        roleService.addRole(adminRole);
        roleService.addRole(userRole);

        User admin = new User();
        admin.setUsername("admin");
        admin.setPassword("admin");
        Set<Role> roles = new HashSet<>();
        roles.add(adminRole);
        roles.add(userRole);
        admin.setRoles(roles);

        userService.addUser(admin);

        User user = new User();
        user.setUsername("user");
        user.setPassword("user");
        Set<Role> roles2 = new HashSet<>();
        roles2.add(userRole);
        user.setRoles(roles2);

        userService.addUser(user);

    }
}
