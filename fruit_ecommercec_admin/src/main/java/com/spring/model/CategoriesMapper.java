package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoriesMapper implements RowMapper<Categories>
{
    @Override
    public Categories mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        Categories categories = new Categories();
        categories.setCateId(rs.getInt("cate_id"));
        categories.setCateName(rs.getString("cate_name"));
        categories.setCateImg(rs.getString("cate_image"));
        categories.setEnable(rs.getBoolean("cate_enable"));

        return categories;
    }
}
