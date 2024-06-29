package com.spring.DAO;

import com.spring.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository
public class HomeDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<Categories> getCategories() {
        List<Categories> categoriesList = new ArrayList<Categories>();
        String sql = "select * from category";
        categoriesList = jdbcTemplate.query(sql, new CategoriesMapper());
        return categoriesList;
    }


    public List<Products> getAllProducts() {
        List<Products> productsList  = new ArrayList<Products>();
        String sql = "select *, cate_name from product inner join category on product.cate_id = category.cate_id";
        productsList = jdbcTemplate.query(sql, new ProductsMapper());

        return productsList;
    }
    public int countProductByCate(int cateId){
        String sql = "select count(*) from product where cate_id=?";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{cateId}, Integer.class);
        return count;
    }

    public List<Products> getProductByCate(int cateId, int index) {
        List<Products> products = new ArrayList<Products>();
        String sql = "select p.*, c.cate_name from product p inner join category c on p.cate_id = c.cate_id where c.cate_id= ? LIMIT 4 OFFSET ?";
        int page = (index-1) * 4;
        products =   jdbcTemplate.query(sql, new Object[]{cateId, page}, new ProductsMapper());
        return  products;
    }
    public int countProduct(){
        String sql = "select count(*) from product";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{}, Integer.class);
        return count;
    }
    //pagination product
    public List<Products> paginationProduct(int index){
        List<Products> products = new ArrayList<Products>();
        String sql = "SELECT p.*, c.cate_name FROM product p inner join category c on p.cate_id = c.cate_id LIMIT 4 OFFSET ?";
        int page = (index-1) * 4;
        Object[] params = new Object[]{page};
        products = jdbcTemplate.query(sql,params, new ProductsMapper());
        return  products;
    }
    public List<Products> getFreshVegetable(){
        List<Products> products = new ArrayList<Products>();
        String sql = "SELECT p.*, c.cate_name FROM product p INNER JOIN category c ON p.cate_id = c.cate_id WHERE p.cate_id IN (1, 2)";
        products = jdbcTemplate.query(sql, new ProductsMapper());
        return products;
    }
    public List<Products> getBestSeller(){
        List<Products> products = new ArrayList<Products>();
        String sql = "SELECT p.*, c.cate_name FROM product p INNER JOIN category c ON p.cate_id = c.cate_id order by sell_quantity desc limit 6";
        products = jdbcTemplate.query(sql, new ProductsMapper());
        return products;
    }
    public int countCertificates(){
        String sql = "SELECT count(awards) FROM supplier";
        return jdbcTemplate.queryForObject(sql,new Object[]{}, Integer.class );
    }

    public double quantityService(){
        String sql = "SELECT avg(rate)/5*100 FROM FEEDBACK";
        return jdbcTemplate.queryForObject(sql,new Object[]{}, Double.class );
    }
    public int satisfiedCustomers(){
        String sql = "select count(id) from feedback where rate >= 4";
        return jdbcTemplate.queryForObject(sql,new Object[]{}, Integer.class );
    }
    public List<Feedback> getListFeedback(){
        List<Feedback> list = new ArrayList<Feedback>();
        String sql = "select f.*, c.cus_name from feedback f inner join customer c on c.id = f.id";
        list = jdbcTemplate.query(sql, new FeedbackMapper());
        return list;
    }
}
