package com.service;

import com.dao.RoleDao;
import com.dao.UserDao;
import com.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public Role getRoleByName(String name) {
        return roleDao.getRoleByName(name);
    }

    @Override
    public Role getRoleById(Long id) {
        return roleDao.getRoleByID(id);
    }

    @Override
    public void addRole(Role role) {
        roleDao.addRole(role);
    }
}
