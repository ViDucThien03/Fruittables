package com.spring.DAO;

import com.spring.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ShopDetailDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<Products> getSimilarProductsByCate (int cateId){
        List<Products> products = new ArrayList<Products>();
        String sql = "SELECT p.*, c.cate_name FROM product p inner join category c on p.cate_id = c.cate_id WHERE c.cate_id = ? ORDER BY RAND() LIMIT 5";
        Object[] params = new Object[]{cateId};
        products =   jdbcTemplate.query(sql,params, new ProductsMapper());
        return  products;
    }
//    public List<CategoryProductCount> getCategoryByProduct (){
//        List<CategoryProductCount> products = new ArrayList<CategoryProductCount>();
//        String sql = "SELECT cate_name, COUNT(id) AS product_count FROM product GROUP BY cate_name;";
//        products =   jdbcTemplate.query(sql, new CategoryProductCountMapper());
//        return  products;
//    }
    public List<Products> getProductSales(){
        List<Products> products = new ArrayList<>();
        String sql = "SELECT p.*, c.cate_name FROM product p inner join category c on p.cate_id = c.cate_id WHERE product_sales > 0 ORDER BY RAND() LIMIT 5;";
        products =   jdbcTemplate.query(sql, new ProductsMapper());
        return  products;

    }
    public List<Products> getProductById (int id){
        List<Products> products = new ArrayList<>();
        String sql = "SELECT p.*, c.cate_name FROM product p inner join category c on p.cate_id = c.cate_id WHERE id = ?";
        products =   jdbcTemplate.query(sql, new Object[]{id}, new ProductsMapper());
        return  products;
    }
}
