package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductsMapper implements RowMapper<Products> {
    @Override
    public Products mapRow(ResultSet rs, int rowNum) throws SQLException {
        Products products = new Products();
        products.setProductId(rs.getInt("id"));
        products.setProductName(rs.getNString("product_name"));
        products.setProductDesc(rs.getNString("product_desc"));
       // products.setShortDesc(rs.getNString("short_desc"));
        products.setproductPrice(rs.getDouble("product_price"));
        products.setQuantity(rs.getInt("quantity"));
        products.setSale(rs.getDouble("product_sales"));
        products.setHot(rs.getBoolean("product_hot"));
        products.setProductImg(rs.getString("product_img"));
        products.setExpDate(rs.getDate("exp_date"));
        products.setCreateDate(rs.getDate("create_date"));
        products.setCateId(rs.getInt("cate_id"));
        products.setCateName(rs.getNString("cate_name"));
        products.setSell_quantity(rs.getInt("sell_quantity"));
        return products;
    }
}
