package com.spring.dao;

import com.spring.model.Roles;
import com.spring.model.RolesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class RolesDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Roles> getAllRoles (){
        List<Roles> roles = new ArrayList<>();
        String sql = "SELECT * FROM roles";
        roles = jdbcTemplate.query(sql, new RolesMapper());
        return  roles;
    }
}
