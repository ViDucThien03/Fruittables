package com.spring.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ContactMapper implements RowMapper<Contacts> {
    @Override
    public Contacts mapRow(ResultSet rs, int rowNum) throws SQLException {
        Contacts contracts = new Contacts();
        contracts.setId(rs.getInt("id"));
        contracts.setContactAddress(rs.getString("contact_address"));
        contracts.setContactEmail(rs.getString("contact_email"));
        contracts.setContactPhone(rs.getString("contact_phone"));
        return contracts;
    }
}
