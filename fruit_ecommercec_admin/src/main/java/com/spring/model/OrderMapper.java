package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderMapper implements RowMapper<Orders> {

    @Override
    public Orders mapRow(ResultSet rs, int i) throws SQLException {
        Orders orders = new Orders();
// <<<<<<< buihuuduy
//         orders.setId(rs.getInt("id"));
//         orders.setOrderDate(rs.getDate("createDay "));
//         orders.setTotalPrice(rs.getDouble("total_price"));
//         orders.setTotalProduct(rs.getDouble("total_product"));
// =======
        orders.setOrderId(rs.getInt("id"));
        orders.setFullName(rs.getString("fullname"));
        orders.setTotal(rs.getDouble("total_price"));
        orders.setQuantity(rs.getInt("total_product"));
        orders.setCreateDay(rs.getDate("createDay"));
        orders.setAddress(rs.getString("address"));
        orders.setDesc_order(rs.getString("desc_order"));
        orders.setPhone(rs.getString("phone"));
        orders.setEmail(rs.getString("email"));
        orders.setUserid(rs.getInt("customer_id"));
        orders.setStatus(rs.getString("status"));
        orders.setCreateDay(rs.getDate("createDay"));
        orders.setPaymentMethod(rs.getString("payment_method"));
        orders.setStatusPayment(rs.getString("status_payment"));
        return orders;
    }
}
