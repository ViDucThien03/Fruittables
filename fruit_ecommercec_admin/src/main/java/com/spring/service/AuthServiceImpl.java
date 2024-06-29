package com.spring.service;

import com.spring.dao.AuthDao;
import com.spring.model.Users;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService{
    @Autowired
    private AuthDao authDao;
    @Override
    public Users login(Users user) {
        String password = user.getPassword();
        Users authenticatedUser = authDao.login(user);
        if (authenticatedUser != null && authenticatedUser.getRoleId() == 1) {
            if (BCrypt.checkpw(password, authenticatedUser.getPassword())) {
                return authenticatedUser;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    @Override
    public int findAccountbyUsername(String username) {
        return authDao.findAccountbyUsername(username);
    }

    @Override
    public int findAccountByEmail(String email) {
        return authDao.findAccountByEmail(email);
    }

    @Override
    public Integer findRoleIdByUsername(String username) {
        return authDao.findRoleIdByUsername(username);
    }
}
