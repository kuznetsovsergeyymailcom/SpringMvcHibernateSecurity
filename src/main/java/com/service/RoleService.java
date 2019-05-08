package com.service;

import com.model.Role;

public interface RoleService {

    Role getRoleByName(String name);
    Role getRoleById(Long id);
    void addRole(Role role);
}
