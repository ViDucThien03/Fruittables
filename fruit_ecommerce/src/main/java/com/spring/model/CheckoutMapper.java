package com.spring.model;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckoutMapper implements RowMapper<Checkout>
{
    @Override
    public Checkout mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        Checkout checkout = new Checkout();
        checkout.setCheckoutid(rs.getInt("id"));
        checkout.setFullName(rs.getString("fullname"));
        checkout.setTotal(rs.getDouble("total_price"));
        checkout.setQuantity(rs.getInt("total_product"));
        checkout.setAddress(rs.getString("address"));
        checkout.setDesc_order(rs.getString("desc_order"));
        checkout.setPhone(rs.getString("phone"));
        checkout.setEmail(rs.getString("email"));
        checkout.setUserid(rs.getInt("customer_id"));
        checkout.setStatus(rs.getString("status"));
        checkout.setCreateDay(rs.getDate("createDay"));
        checkout.setPaymentMethod(rs.getString("payment_method"));
        checkout.setStatusPayment(rs.getString("status_payment"));
        return checkout;
    }
}
