package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BlogDetailMapper implements RowMapper<BlogDetail> {
    @Override
    public BlogDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
        BlogDetail blogDetail = new BlogDetail();
        blogDetail.setId(rs.getInt("id"));
        blogDetail.setTitle(rs.getString("title"));
        blogDetail.setContent(rs.getString("content"));
        blogDetail.setDescription(rs.getString("description"));
        blogDetail.setBlogImg(rs.getString("blog_img"));
        blogDetail.setCreateAt(rs.getDate("create_at"));
        blogDetail.setBlogId(rs.getInt("blog_id"));
        blogDetail.setCustomerId(rs.getInt("customer_id"));
        return blogDetail;
    }
}
