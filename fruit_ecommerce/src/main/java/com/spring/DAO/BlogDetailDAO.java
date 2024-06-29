package com.spring.DAO;

import com.spring.model.BlogDetailMapper;
import com.spring.model.BlogDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class BlogDetailDAO {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<BlogDetails> getBlogDetails()
    {
        List<BlogDetails> blogDetailsList = new ArrayList<BlogDetails>();
        String sql = "SELECT * FROM blog_detail";
        blogDetailsList = jdbcTemplate.query(sql, new BlogDetailMapper());
        return blogDetailsList;
    }

    public List<BlogDetails> getBlogDetailsNew (){
        List<BlogDetails> blogDetailsList = new ArrayList<BlogDetails>();
        String sql = "SELECT * FROM blog_detail ORDER BY create_at DESC LIMIT 5";
        blogDetailsList = jdbcTemplate.query(sql, new BlogDetailMapper());
        return blogDetailsList;
    }
    public int countBlog(){
        String sql = "select count(*) from blog_detail";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{}, Integer.class);
        return count;
    }
    public int countBlogByID(int id){
        String sql = "select count(*) from blog_detail where blog_id = ?";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{id}, Integer.class);
        return count;
    }
    //pagination product
    public List<BlogDetails> paginationBlog(int index){
        List<BlogDetails> blogDetails = new ArrayList<BlogDetails>();
        String sql = "SELECT id, title, SUBSTRING(content, 1, 255) AS content,description, blog_img, create_at, blog_id, customer_id FROM blog_detail LIMIT 6 OFFSET ?";
        int page = (index-1) * 6 ;
        Object[] params = new Object[]{page};
        blogDetails = jdbcTemplate.query(sql,params, new BlogDetailMapper());
        return  blogDetails;
    }

    public List<BlogDetails> getBlogDetailsByID(int id, int index){
        List<BlogDetails> blogDetailsList = new ArrayList<BlogDetails>();
        String sql = "SELECT * FROM blog_detail WHERE blog_id = ? LIMIT 6 OFFSET ?";
        int page = (index-1) * 6 ;
        Object[] params = new Object[]{id, page};
        blogDetailsList = jdbcTemplate.query(sql,params, new BlogDetailMapper());
        return blogDetailsList;
    }
    public List<BlogDetails> getBlogByID(int id){
        List<BlogDetails> blogDetailsList = new ArrayList<BlogDetails>();
        String sql = "SELECT * FROM blog_detail WHERE id = ?";
        Object[] params = new Object[]{id};
        blogDetailsList = jdbcTemplate.query(sql,params, new BlogDetailMapper());
        return blogDetailsList;
    }
    public List<BlogDetails> getBlogDetailsByBlogTypeID(int id){
        List<BlogDetails> blogDetailsList = new ArrayList<BlogDetails>();
        String sql = "SELECT * FROM blog_detail WHERE blog_id = ? ORDER BY RAND() LIMIT 3";
        Object[] params = new Object[]{id};
        blogDetailsList = jdbcTemplate.query(sql,params, new BlogDetailMapper());
        return blogDetailsList;
    }


}
