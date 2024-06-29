package com.spring.controller;

import com.spring.Service.CategoriesServiceImpl;
import com.spring.Service.ProductsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ShopController {
    @Autowired
    public ProductsServiceImpl productsService;
    @Autowired
    public CategoriesServiceImpl categoriesService;
    @RequestMapping(value = "/shop/{index}")
    public ModelAndView paginationProduct(@PathVariable(required = false) Integer index, HttpServletRequest request ) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/shop");
        mv.addObject("categories", categoriesService.getAllCategories());
        int count = productsService.countProduct();
        mv.addObject("count", count);
        int endPage = count/9;
        if(count % 9 != 0){
            endPage = endPage + 1;
        }
        request.setAttribute("endPage", endPage);
        if(index !=null && index > 0){
            mv.addObject("paginationProduct", productsService.paginationProductShop(index));
        }
        else {
            mv.addObject("paginationProduct", productsService.paginationProductShop(1));
        }

        return mv;
    }

}
