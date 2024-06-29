package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BlogTypeMapper implements RowMapper<BlogTypes> {
    @Override
    public BlogTypes mapRow(ResultSet rs, int rowNum) throws SQLException {
        BlogTypes blogType = new BlogTypes();
        blogType.setId(rs.getInt("id"));
        blogType.setTypeName(rs.getString("type_name"));
        return blogType;
    }
}
