package com.spring.Service;

import com.spring.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public interface AuthService {
    public User login(User user);
    public int register(User user);
    public int setupUser(int id, User user);
    public int findAccountbyUsername(String username);
    public int findAccountByEmail(String email);
    public void changePassword(String email, String newPassword);
    public Optional<String> checkEnable(String username);
}
