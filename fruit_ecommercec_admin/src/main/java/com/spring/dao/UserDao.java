package com.spring.dao;

import com.spring.model.Users;
import com.spring.model.UsersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Retrieve all users
    public List<Users> getUsers() {
        String sql = "SELECT * FROM customer"; // Assuming your table name is 'users'
        return jdbcTemplate.query(sql, new UsersMapper());
    }

    // Count the number of users
    public int countUsers() {
        String sql = "SELECT COUNT(*) FROM customer"; // Assuming your table name is 'users'
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    // Paginate users
    public List<Users> paginationUsers(int index) {
        String sql = "SELECT * FROM customer LIMIT 10 OFFSET ?";
        int offset = (index - 1) * 10;
        return jdbcTemplate.query(sql, new Object[]{offset}, new UsersMapper());
    }

    // Retrieve a user by ID
    public Users getUserById(int id) {
        String sql = "SELECT * FROM customer WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new UsersMapper(), id);
    }

    public List<Users> getAllUsers(){
        String sql = "SELECT * FROM customer";
        return jdbcTemplate.query(sql,new UsersMapper());
    }

    // Add a new user
    public void addUser(Users user) {
        String sql = "INSERT INTO customer (cus_name, usename, password, cus_phone, cus_email, cus_address, gender, role_id, cus_enable) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                user.getCusName(),
                user.getUsername(),
                user.getPassword(),
                user.getCusPhone(),
                user.getCusEmail(),
                user.getCusAddress(),
                user.isGender(),
                user.getRoleId(),
                user.getCusEnable());
    }

    // Update an existing user
    public void updateUser(int id, String cusEnable) {
        String sql = "UPDATE customer SET cus_enable = ? WHERE id = ?";
        jdbcTemplate.update(sql, cusEnable, id);
    }
    public void updateRole(int id, String roleId) {
        String sql = "UPDATE customer SET role_id = ? WHERE id = ?";
        jdbcTemplate.update(sql, roleId, id);
    }

    // Delete a user by ID
    public void deleteUser(int id) {
        String sql = "DELETE FROM customer WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
