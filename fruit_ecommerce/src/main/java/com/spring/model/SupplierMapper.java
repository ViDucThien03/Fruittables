package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SupplierMapper implements RowMapper<Supplier> {
    @Override
    public Supplier mapRow(ResultSet rs, int i) throws SQLException {
        Supplier sp = new Supplier();
        sp.setSupplierId(rs.getInt("supplier_id"));
        sp.setSupName(rs.getString("sup_name"));
        sp.setSupAddress(rs.getString("sup_address"));
        sp.setAwards(rs.getString("awards"));
        sp.setSupImg(rs.getString("sup_img"));
        return sp;
    }
}
