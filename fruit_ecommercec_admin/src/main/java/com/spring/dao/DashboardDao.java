package com.spring.dao;

import com.spring.model.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.*;

@Repository
public class DashboardDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> getRevenueByDay(int year, int month ){
        String sql = "Select createDay, count(id) as SoLuongDonHang, SUM(total_price) as DoanhThu from orders where YEAR(createDay) = ? and MONTH(createDay) = ? GROUP BY createDay ORDER BY createDay";

        return jdbcTemplate.queryForList(sql, year, month);
    }
    public List<Map<String, Object>> getRevenueByMonth(int year){
        String sql = "Select YEAR(createDay) as Nam, MONTH(createDay) Thang, count(id) as SoLuongDonHang, SUM(total_price) as DoanhThu from orders where YEAR(createDay) = ? GROUP BY YEAR(createDay), MONTH(createDay) ORDER BY Nam, Thang";
        return jdbcTemplate.queryForList(sql, year);
    }
    public List<Map<String, Object>> getRevenueByYear(){
        String sql = "Select YEAR(createDay) as Nam, count(id) as SoLuongDonHang, SUM(total_price) as DoanhThu from orders GROUP BY YEAR(createDay) ORDER BY Nam";
        return jdbcTemplate.queryForList(sql);
    }
    public Map<String, Object> getRevenueToday(){
        String sql = "Select createDay, count(id) as SoLuongDonHang, COALESCE(SUM(total_price), 0) as DoanhThu from orders WHERE createDay = CURRENT_DATE() GROUP BY createDay";
        List<Map<String, Object>> results = jdbcTemplate.queryForList(sql);

        if (results.isEmpty()) {
            Map<String, Object> emptyResult = new HashMap<>();
            emptyResult.put("createDay", LocalDate.now());
            emptyResult.put("SoLuongDonHang", 0);
            emptyResult.put("DoanhThu", 0);
            return emptyResult;
        } else {
            return results.get(0);
        }
    }
    public List<Map<String, Object>> getProductSellByDay(String day) {
        String sql = "SELECT p.product_name as Name, p.product_price as Price, SUM(od.quantity) AS SoLuongSanPhamBanDuoc FROM orders o JOIN order_detail od ON o.id = od.order_id JOIN product p ON od.product_id = p.id WHERE DATE(o.createDay) = ? GROUP BY p.product_name";
        return jdbcTemplate.queryForList(sql,day);
    }

    public List<Map<String, Object>> getProductSellByMonth(int year, int month) {
        String sql = "SELECT p.product_name as Name, p.product_price as Price, SUM(od.quantity) AS SoLuongSanPhamBanDuoc FROM orders o JOIN order_detail od ON o.id = od.order_id JOIN product p ON od.product_id = p.id WHERE YEAR(o.createDay) = ? AND MONTH(o.createDay) = ? GROUP BY p.product_name";
        return jdbcTemplate.queryForList(sql, year, month);
    }

    public List<Map<String, Object>> getProductsellByYear(int year) {
        String sql = "SELECT p.product_name as Name, p.product_price as Price, SUM(od.quantity) AS SoLuongSanPhamBanDuoc FROM orders o JOIN order_detail od ON o.id = od.order_id JOIN product p ON od.product_id = p.id WHERE YEAR(o.createDay) = ? GROUP BY p.product_name";
        return jdbcTemplate.queryForList(sql, year);
    }
}
