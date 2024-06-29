package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UsersMapper implements RowMapper<Users> {
    @Override
    public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
        Users user = new Users();
        user.setId(rs.getInt("id"));
        user.setCusName(rs.getString("cus_name"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setCusPhone(rs.getString("cus_phone"));
        user.setCusEmail(rs.getString("cus_email"));
        user.setCusAddress(rs.getString("cus_address"));
        user.setGender(rs.getBoolean("gender"));
        user.setRoleId(rs.getInt("role_id"));
        user.setCusEnable(rs.getString("cus_enable"));

        return user;
    }
}
