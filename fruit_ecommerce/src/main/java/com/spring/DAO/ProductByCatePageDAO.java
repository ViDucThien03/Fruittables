package com.spring.DAO;

import com.spring.model.Products;
import com.spring.model.ProductsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductByCatePageDAO
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Products> paginationProductByCate(int cateId, int index){
        List<Products> products = new ArrayList<Products>();
        String sql = "SELECT p.*, c.cate_name FROM product p inner join category c on p.cate_id = c.cate_id WHERE c.cate_id = ? LIMIT 9 OFFSET ?";
        int page = (index-1) * 9;
        Object[] params = new Object[]{cateId, page};
        products = jdbcTemplate.query(sql,params, new ProductsMapper());
        return products;
    }
}
