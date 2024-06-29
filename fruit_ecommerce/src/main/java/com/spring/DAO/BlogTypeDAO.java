package com.spring.DAO;


import com.spring.model.BlogTypeMapper;
import com.spring.model.BlogTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class BlogTypeDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<BlogTypes> getBlogTypes()
    {
        List<BlogTypes> blogtTypesList = new ArrayList<BlogTypes>();
        String sql = "select * from blog_type";
        blogtTypesList = jdbcTemplate.query(sql, new BlogTypeMapper());
        return blogtTypesList;
    }
    public List<BlogTypes> getBlogTypesByID(int id)
    {
        List<BlogTypes> blogtTypesList = new ArrayList<BlogTypes>();
        String sql = "select * from blog_type WHERE id = ?";
        Object[] params = new Object[]{id};
        blogtTypesList = jdbcTemplate.query(sql,params, new BlogTypeMapper());
        return blogtTypesList;
    }


}
