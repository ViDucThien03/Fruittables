package com.spring.controller;

import com.spring.Service.ProductsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;

@Controller
@RequestMapping(value = "products")
public class ListProductController {
    @Autowired
    public ProductsServiceImpl productsService;
    @RequestMapping(value = "/{index}")
    public ModelAndView paginationProduct(@PathVariable(required = false) Integer index, HttpServletRequest request ) {

        ModelAndView mv = new ModelAndView();
        boolean ajaxRequest = isAjaxRequest(request);
        request.setAttribute("ajaxRequest", ajaxRequest);
        mv.setViewName("user/listproduct");
        int count = productsService.countProduct();
        mv.addObject("count", count);
        int endPage = count/4;
        if(count % 4 != 0){
            endPage = endPage + 1;
        }
        request.setAttribute("endPage", endPage);
        if(index !=null && index > 0){
            mv.addObject("paginationProduct", productsService.paginationProduct(index));
        }
        else {
            mv.addObject("paginationProduct", productsService.paginationProduct(1));
        }
        return mv;
    }
    private boolean isAjaxRequest(HttpServletRequest request) {
        return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }
}
