package com.spring.controller;

import com.spring.Service.CategoriesServiceImpl;
import com.spring.Service.New_Sale_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewSaleController
{
    @Autowired
    public New_Sale_Service new_sale_Service;
    @Autowired
    public CategoriesServiceImpl categoriesService;
    @RequestMapping(value={"/newsale"}, method = RequestMethod.GET)
    public ModelAndView newSale() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/newsale");
        mv.addObject("sellingProduct", new_sale_Service.getSellingProduct());
        mv.addObject("discountProduct", new_sale_Service.getDiscountProduct());
        int count = new_sale_Service.countProduct();
        mv.addObject("count", count);
        mv.addObject("categories", categoriesService.getAllCategories());
        return mv;
    }
}
