//package com.spring.model;
//
//import org.springframework.jdbc.core.RowMapper;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//public class ProductMapper implements RowMapper<Product>
//{
//    @Override
//    public Product mapRow(ResultSet rs, int rowNum) throws SQLException
//    {
//        Product product = new Product();
//        product.setId(rs.getInt("id"));
//        product.setProductName(rs.getString("product_name"));
//        product.setProductDesc(rs.getString("product_desc"));
//        product.setProductPrice(rs.getDouble("product_price"));
//        product.setQuantity(rs.getInt("quantity"));
//        product.setProductSale(rs.getInt("product_sales"));
//        product.setProductHot(rs.getBoolean("product_hot"));
//        product.setExpDate(rs.getDate("exp_date"));
//        product.setCreateDate(rs.getDate("create_date"));
//        product.setProductImage(rs.getString("product_img"));
//        product.setSupplierId(rs.getInt("supplier_id"));
//        product.setCateId(rs.getInt("cate_id"));
//        product.setCateName(rs.getNString("cate_name"));
//        return product;
//    }
//}
