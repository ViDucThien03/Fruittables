package com.spring.dao;

import com.spring.model.Supplier;
import com.spring.model.SupplierMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SupplierDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;


    public List<Supplier> getSuppliers() {
        String sql = "SELECT * FROM supplier";
        return jdbcTemplate.query(sql, new SupplierMapper());
    }


    public Supplier getSupplierById(int id) {
        String sql = "SELECT * FROM supplier WHERE supplier_id = ?";
        return jdbcTemplate.queryForObject(sql, new SupplierMapper(), id);
    }


    public void addSupplier(Supplier supplier) {
        String sql = "INSERT INTO supplier (sup_name, sup_address, awards, sup_img) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, supplier.getSupName(), supplier.getSupAddress(), supplier.getAwards(), supplier.getSupImg());
    }


    public void updateSupplier(Supplier supplier) {
        String sql = "UPDATE supplier SET sup_name = ?, sup_address = ?, awards = ?, sup_img = ? WHERE supplier_id = ?";
        jdbcTemplate.update(sql, supplier.getSupName(), supplier.getSupAddress(), supplier.getAwards(), supplier.getSupImg(), supplier.getId());
    }


    public void deleteSupplier(int id) {
        String sql = "DELETE FROM supplier WHERE supplier_id = ?";
        jdbcTemplate.update(sql, id);
    }
    public List<Supplier> paginationSupplier(int index) {
        String sql = "SELECT * FROM supplier LIMIT 10 OFFSET ?";
        int page = (index - 1) * 10;
        return jdbcTemplate.query(sql, new SupplierMapper(), page);
    }

    public int countSupplier() {
        String sql = "SELECT COUNT(*) FROM supplier";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
}
