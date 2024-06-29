package com.spring.DAO;

import com.spring.model.Products;
import com.spring.model.ProductsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDetailDAO
{
    @Autowired
    JdbcTemplate jdbcTemplate;

//    public Product FindProductByID(int id)
//    {
//        String sql = ("SELECT * FROM product WHERE id = " + id);
//        return jdbcTemplate.queryForObject(sql, new ProductMapper());
//    }

    public Products FindProductByID(int id) {
        //String sql = "SELECT * FROM product WHERE id = ?";
        String sql = "select *, cate_name from product inner join category on category.cate_id = product.cate_id WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new ProductsMapper());
    }
}
