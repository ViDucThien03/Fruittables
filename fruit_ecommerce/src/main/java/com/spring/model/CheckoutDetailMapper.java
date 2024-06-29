package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckoutDetailMapper implements RowMapper<CheckoutDetail>
{
    public CheckoutDetail mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        CheckoutDetail checkoutDetail = new CheckoutDetail();

        checkoutDetail.setId(rs.getInt("id"));
        checkoutDetail.setTotal(rs.getDouble("total_piad"));
        checkoutDetail.setQuantity(rs.getInt("quantity"));
        checkoutDetail.setCheckoutID(rs.getInt("order_id"));
        return checkoutDetail;
    }
}
