package com.spring.dao;

import com.spring.model.Products;
import com.spring.model.ProductsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class ProductsDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int countProduct(){
        String sql = "select count(*) from product";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{}, Integer.class);
        return count;
    }
    public List<Products> paginationProduct(int index){
        List<Products> products = new ArrayList<Products>();
        String sql = "SELECT p.*, c.cate_name FROM product p INNER JOIN category c ON p.cate_id = c.cate_id ORDER BY p.id LIMIT 10 OFFSET ?";
        int page = (index-1) * 10;
        Object[] params = new Object[]{page};
        products = jdbcTemplate.query(sql,params, new ProductsMapper());
        return  products;
    }
    public Products getProductById(int id){
        Products product = new Products();
        String sql = "SELECT p.*, c.cate_name FROM product p INNER JOIN category c ON p.cate_id = c.cate_id where id=?";
        product = jdbcTemplate.queryForObject(sql, new ProductsMapper(), new Object[]{id});
        return product;
    }
    public void addProduct(Products product) {
        String sql = "INSERT INTO product (product_name, product_desc, product_price, quantity, product_sales, product_hot, exp_date, create_date, product_img,sell_quantity, cate_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql, product.getProductName(),
                product.getProductDesc(),
                product.getProductPrice(),
                product.getQuantity(),
                product.getSale(),
                product.isHot(),
                product.getExpDate(),
                product.getCreateDate(),
                product.getProductImg(),
                product.getSell_quantity(),

                product.getCateId());
    }

    public void updateProduct(Products product) {
        String sql = "UPDATE product SET product_name = ?, product_desc = ?, product_price = ?, quantity = ?, product_sales = ?,product_hot = ?,exp_date = ?,create_date = ?,product_img = ?,sell_quantity = ?, cate_id = ? WHERE id = ?";
        jdbcTemplate.update(sql,
                product.getProductName(),
                product.getProductDesc(),
                product.getProductPrice(),
                product.getQuantity(),
                product.getSale(),
                product.isHot(),
                product.getExpDate(),
                product.getCreateDate(),
                product.getProductImg(),
                product.getSell_quantity(),
                product.getCateId(),
                product.getProductId());
    }
    public void deleteProduct(int id){
        String sql = "delete from product where id=?";
        jdbcTemplate.update(sql,id);
    }
    public List<Products> showBestSellerProduct(){
        List<Products> list = new ArrayList<Products>();
        String sql = "SELECT p.*, c.cate_name FROM product p INNER JOIN category c ON p.cate_id = c.cate_id ORDER BY sell_quantity DESC LIMIT 10";
        list = jdbcTemplate.query(sql,new Object[]{}, new ProductsMapper());
        return list;
    }
    public List<Products> showPoorlyProduct(){
        List<Products> list = new ArrayList<Products>();
        String sql = "SELECT p.*, c.cate_name FROM product p INNER JOIN category c ON p.cate_id = c.cate_id ORDER BY sell_quantity ASC LIMIT 10";
        list = jdbcTemplate.query(sql,new Object[]{}, new ProductsMapper());
        return list;
    }
    public void updateSale(int productId, double sale){
        String sql = "Update product set product_sales=? where id=?";
        jdbcTemplate.update(sql,sale ,productId);
    }
}
