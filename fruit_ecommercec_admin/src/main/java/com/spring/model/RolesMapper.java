package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RolesMapper implements RowMapper<Roles> {

    @Override
    public Roles mapRow(ResultSet rs, int rowNum) throws SQLException {
        Roles roles = new Roles();
        roles.setId(rs.getInt("id"));
        roles.setRoles(rs.getString("roles"));
        return roles;
    }
}
