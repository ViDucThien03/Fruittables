package com.spring.service;

import com.spring.model.Roles;
import com.spring.model.Users;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    public List<Users> getUsers();
    public int countUsers();
    public List<Users> paginationUsers(int index);
    public Users getUserById(int id);
    public List<Users> getAllUsers();
    public void addUser(Users user);
    public void updateUser(int id, String cusEnable);
    public void deleteUser(int id);
    public List<Roles> getAllRoles ();
    public void updateRole(int id, String roleId);
}
