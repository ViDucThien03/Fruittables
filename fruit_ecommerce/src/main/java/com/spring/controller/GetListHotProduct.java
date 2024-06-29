package com.spring.controller;

import com.spring.Service.ProductsServiceImpl;
import com.spring.model.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class GetListHotProduct {
    @Autowired
    public ProductsServiceImpl productsService;
    @RequestMapping(value = "/hot-products/{limit}", method = RequestMethod.GET)
    public ModelAndView showHotProducts(@PathVariable(required = false) Integer limit,HttpServletRequest request ) {
        ModelAndView mv = new ModelAndView();
        boolean ajaxRequest = isAjaxRequest(request);
        request.setAttribute("ajaxRequest", ajaxRequest);
        int count = productsService.countHotProduct();
        mv.addObject("count", count);
         if(limit != null){
             mv.addObject("hotProducts", productsService.hotProduct(limit));
         } else {
             mv.addObject("hotProducts", productsService.hotProduct(3));
         }
        mv.addObject("limit", limit);
        mv.setViewName("user/listhotproduct");
        return mv;
    }
    private boolean isAjaxRequest(HttpServletRequest request) {
        return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }
}
