package com.dao;

import com.model.Role;

public interface RoleDao {
    Role getRoleByName(String name);
    Role getRoleByID(Long id);
    void addRole(Role role);
}
