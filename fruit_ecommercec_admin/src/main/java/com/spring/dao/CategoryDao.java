package com.spring.dao;

import com.spring.model.Categories;
import com.spring.model.CategoriesMapper;
import com.spring.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CategoryDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Categories> getCategories() {
        List<Categories> categoriesList = new ArrayList<Categories>();
        String sql = "select * from category";
        categoriesList = jdbcTemplate.query(sql, new CategoriesMapper());

        return categoriesList;

    }
    public int countCategory(){
        String sql = "select count(*) from category";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{}, Integer.class);
        return count;
    }
    public List<Categories> paginationCategory(int index){
        List<Categories> ategories = new ArrayList<Categories>();
        String sql = "SELECT * from category LIMIT 10 OFFSET ?";
        int page = (index-1) * 10;
        Object[] params = new Object[]{page};
        ategories = jdbcTemplate.query(sql,params, new CategoriesMapper());
        return  ategories;
    }
    public Categories getCategoryById(int id){
        Categories categories = new Categories();
        String sql = "SELECT p.*, c.cate_name FROM category p INNER JOIN category c ON p.cate_id = c.cate_id where cate_id=?";
        categories = jdbcTemplate.queryForObject(sql, new CategoriesMapper(), new Object[]{id});
        return categories;
    }
    public Categories getCategoryByID(int id){
        Categories categories = new Categories();
        String sql = "SELECT * FROM category where cate_id=?";
        categories = jdbcTemplate.queryForObject(sql, new CategoriesMapper(), new Object[]{id});
        return categories;
    }
    public void addCategory(Categories categories) {
        String sql = "INSERT INTO category (cate_name, cate_enable, cate_image) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, categories.getCateName(), categories.isEnable(), categories.getCateImg());
    }
    public void updateCategory(Categories categories) {
        String sql = "UPDATE category SET cate_name = ?, cate_enable = ?, cate_image = ? WHERE cate_id = ?";
        jdbcTemplate.update(sql,
                categories.getCateName(),
                categories.isEnable(),
                categories.getCateImg(),
                categories.getCateId());
    }

    // Delete a user by ID
    public void deleteCategory(int id) {
        String sql = "DELETE FROM category WHERE cate_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
