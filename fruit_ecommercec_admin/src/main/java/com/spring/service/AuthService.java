package com.spring.service;

import com.spring.model.Users;
import org.springframework.stereotype.Service;

@Service
public interface AuthService {
    public Users login(Users user);
    public int findAccountbyUsername(String username);
    public int findAccountByEmail(String email);
    public Integer findRoleIdByUsername(String username);
}
