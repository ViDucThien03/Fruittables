package com.spring.DAO;

import com.spring.model.Products;
import com.spring.model.ProductsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository
public class NewSaleDAO
{
    @Autowired
    JdbcTemplate jdbcTemplate;

    // getProduct By New and Sale
    public List<Products> getSellingProduct()
    {
        List<Products> productList = new ArrayList<Products>();
        String sql = "select *, cate_name from product inner join category on category.cate_id = product.cate_id where product.product_hot = 1";
        productList = jdbcTemplate.query(sql, new ProductsMapper());
        return productList;
    }
    public List<Products> getDiscountProduct()
    {
        List<Products> productList = new ArrayList<>();
        String sql = "select *, cate_name from product inner join category on category.cate_id = product.cate_id where product.product_sales IS NOT NULL";
        productList = jdbcTemplate.query(sql, new ProductsMapper());
        return productList;
    }
    public int countProduct()
    {
        String sql = "select count(*) from product";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
}
