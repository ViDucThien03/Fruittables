package com.spring.dao;

import com.spring.model.BlogDetail;
import com.spring.model.BlogDetailMapper;
import com.spring.model.BlogTypeMapper;
import com.spring.model.BlogTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BlogDetailDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<BlogDetail> paginationBlogDetails(int index) {
        String sql = "SELECT * FROM blog_detail LIMIT 10 OFFSET ?";
        int offset = (index - 1) * 10;
        return jdbcTemplate.query(sql, new BlogDetailMapper(), offset);
    }
    public int countBlog(){
        String sql = "select count(*) from blog_detail";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{}, Integer.class);
        return count;
    }
    public List<BlogDetail> getAllBlogDetails() {
        String sql = "SELECT * FROM blog_detail";
        return jdbcTemplate.query(sql, new BlogDetailMapper());
    }
    public List<BlogTypes> getAllBlogTypes(){
        String sql = "SELECT * FROM blog_type";
        return jdbcTemplate.query(sql,new BlogTypeMapper());
    }

    public BlogDetail getBlogDetailById(int id) {
        String sql = "SELECT * FROM blog_detail WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BlogDetailMapper());
    }

    public void addBlogDetail(BlogDetail blogDetail) {
        String sql = "INSERT INTO blog_detail (title, content, description, blog_img, create_at, blog_id, customer_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, blogDetail.getTitle(), blogDetail.getContent(), blogDetail.getDescription(), blogDetail.getBlogImg(), blogDetail.getCreateAt(), blogDetail.getBlogId(), blogDetail.getCustomerId());
    }

    public void updateBlogDetail(BlogDetail blogDetail) {
        String sql = "UPDATE blog_detail SET title = ?, content = ?, description = ?, blog_img = ? WHERE id = ?";
        jdbcTemplate.update(sql, blogDetail.getTitle(), blogDetail.getContent(), blogDetail.getDescription(), blogDetail.getBlogImg(), blogDetail.getId());
    }

    public void deleteBlogDetail(int id) {
        String sql = "DELETE FROM blog_detail WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
