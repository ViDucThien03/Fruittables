package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SupplierMapper implements RowMapper<Supplier> {
    @Override
    public Supplier mapRow(ResultSet rs, int rowNum) throws SQLException {
        Supplier supplier = new Supplier();
        supplier.setId(rs.getInt("supplier_id"));
        supplier.setSupName(rs.getString("sup_name"));
        supplier.setSupAddress(rs.getString("sup_address"));
        supplier.setAwards(rs.getString("awards"));
        supplier.setSupImg(rs.getString("sup_img"));
        return supplier;
    }
}
