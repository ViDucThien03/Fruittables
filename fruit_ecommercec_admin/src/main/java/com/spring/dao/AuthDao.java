package com.spring.dao;

import com.spring.model.Users;
import com.spring.model.UsersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AuthDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public Users login(Users user) {
        String sql = "select * from customer where username=?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{user.getUsername()}, new UsersMapper());
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
    public int findAccountbyUsername(String username) {
        String sql = "SELECT COUNT(*) FROM customer WHERE username=?";
        int result = jdbcTemplate.queryForObject(sql, Integer.class, username);
        return result;
    }
    public int findAccountByEmail(String email){
        String sql = "SELECT COUNT(*) FROM customer WHERE cus_email=?";
        int result = jdbcTemplate.queryForObject(sql, Integer.class, email);
        return result;
    }
    public Integer findRoleIdByUsername(String username) {
        String sql = "SELECT role_id FROM customer WHERE username=?";
        try {
            return jdbcTemplate.queryForObject(sql, Integer.class, username);
        } catch (Exception e) {
            return null;
        }
    }
}
