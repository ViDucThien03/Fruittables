package com.spring.controller;

import com.spring.service.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class DashboardController {

    @Autowired
    private DashboardService service;

    @GetMapping(value = "/")
    public String dashboard(Model model,
                            @RequestParam(required = false) Integer year_1,
                            @RequestParam(required = false) Integer month,
                            @RequestParam(required = false) Integer year_2,
                            @RequestParam(required = false)
                            @DateTimeFormat(pattern = "yyyy-MM-dd") Date day) {

        if (year_1 == null) {
            year_1 = Calendar.getInstance().get(Calendar.YEAR);
        }
        if (month == null) {
            month = Calendar.getInstance().get(Calendar.MONTH) + 1;
        }
        if (year_2 == null) {
            year_2 = Calendar.getInstance().get(Calendar.YEAR);
        }
        if (day == null) {
            day = Calendar.getInstance().getTime();
        }

        model.addAttribute("selectedYear_1", year_1);
        model.addAttribute("selectedMonth", month);
        model.addAttribute("selectedYear_2", year_2);
        model.addAttribute("selectedDay", day);
        List<Map<String, Object>> listRevenueDay = service.getRevenueByDay(year_1, month);
        List<Map<String, Object>> listRevenueMonth = service.getRevenueByMonth(year_2);
        List<Map<String, Object>> listRevenueYear = service.getRevenueByYear();
        Map<String, Object> revenueToday = service.getRevenueToday();

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDay = format.format(day);
        List<Map<String, Object>> productSellByDay = service.getProductSellByDay(formattedDay);
        List<Map<String, Object>> productSellByMonth = service.getProductSellByMonth(year_1, month);
        List<Map<String, Object>> productSellByYear = service.getProductsellByYear(year_2);

        model.addAttribute("productSellByDay", productSellByDay);
        model.addAttribute("productSellByMonth", productSellByMonth);
        model.addAttribute("productSellByYear", productSellByYear);
        model.addAttribute("listRevenueDay", listRevenueDay);
        model.addAttribute("listRevenueMonth", listRevenueMonth);
        model.addAttribute("listRevenueYear", listRevenueYear);
        model.addAttribute("revenueToday", revenueToday);

        if (productSellByDay == null || productSellByDay.isEmpty()) {
            model.addAttribute("status", "Không có sản phẩm nào bán được trong ngày đã chọn.");
        }

        return "admin/dashboard";
    }

}
