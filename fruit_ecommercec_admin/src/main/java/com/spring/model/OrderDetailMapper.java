package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDetailMapper implements RowMapper<OrderDetail> {
    @Override
    public OrderDetail mapRow(ResultSet rs, int i) throws SQLException {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setId(rs.getInt("id"));
        orderDetail.setTotalPiad(rs.getDouble("total_piad"));
        orderDetail.setOrderID(rs.getInt("order_id"));
        orderDetail.setQuantityProduct(rs.getInt("quantity"));
        orderDetail.setProductName(rs.getString("product_name"));
        orderDetail.setProductPrice(rs.getDouble("product_price"));
//        OrderMapper ordersMapper = new OrderMapper();
//        Orders order = ordersMapper.mapRow(rs, i);
//        orderDetail.setOrder(order);
        orderDetail.setProductId(rs.getInt("product_id"));
        return orderDetail;
    }
}
