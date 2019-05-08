package com.service;

import com.model.Role;

public interface RoleService {

    Role getRoleByName(String name);
    void addRole(Role role);
}
