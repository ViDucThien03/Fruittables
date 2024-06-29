package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setUserName(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setCusPhone(rs.getString("cus_phone"));
        user.setCusName(rs.getString("cus_name"));
        user.setGender(rs.getBoolean("gender"));
        user.setCusAddress(rs.getString("cus_address"));
        user.setRoleId(rs.getInt("role_id"));
        user.setCusEmail(rs.getString("cus_email"));
        user.setCusEnable(rs.getString("cus_enable"));
        return user;
    }
}
