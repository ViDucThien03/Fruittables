package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class FeedbackMapper implements RowMapper<Feedback> {

    @Override
    public Feedback mapRow(ResultSet rs, int i) throws SQLException {
        Feedback fb = new Feedback();
        fb.setId(rs.getInt("fb_id"));
        fb.setContent(rs.getString("content"));
        fb.setRate(rs.getInt("rate"));
        fb.setCustomer_id(rs.getInt("id"));
        fb.setProduct_id(rs.getInt("product_id"));
//        fb.setCusName(rs.getNString("cus_name"));
        return fb;
    }
}
