package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BlogDetailMapper implements RowMapper<BlogDetails> {
    @Override
    public BlogDetails mapRow(ResultSet rs, int rowNum) throws SQLException {

        BlogDetails blogDetails = new BlogDetails();
        blogDetails.setBlogId(rs.getInt("blog_id"));
        blogDetails.setTitle(rs.getString("title"));
        blogDetails.setContent(rs.getString("content"));
        blogDetails.setDescription(rs.getString("description"));
        blogDetails.setBlogImg(rs.getString("blog_img"));
        blogDetails.setCreatedAt(rs.getTimestamp("create_at"));
        blogDetails.setId(rs.getInt("id"));
        blogDetails.setCustomerId(rs.getInt("customer_id"));

        return blogDetails;
    }
}
