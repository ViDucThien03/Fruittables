package com.spring.service;

import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public interface DashboardService {
    public List<Map<String, Object>> getRevenueByDay(int year, int month);
    public List<Map<String, Object>> getRevenueByMonth(int year);
    public List<Map<String, Object>> getRevenueByYear();
    public Map<String, Object> getRevenueToday();
    public List<Map<String, Object>> getProductSellByDay(String day);
    public List<Map<String, Object>> getProductSellByMonth(int year, int month);
    public List<Map<String, Object>> getProductsellByYear(int year);
}
