package com.spring.controller;

import com.spring.Service.ProductsService;
import com.spring.Service.ProductsServiceImpl;
import com.spring.model.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "productbycate")
public class GetProductbyCateController {
    @Autowired
    private ProductsServiceImpl productsService;

    @RequestMapping(value = "/{cateId}/{index}", method = RequestMethod.GET)
    public ModelAndView getProductsByCategory(@PathVariable int cateId, @PathVariable(required = false) Integer index, HttpServletRequest request, HttpSession session) {

        ModelAndView mv = new ModelAndView();
        boolean ajaxRequest = isAjaxRequest(request);
        request.setAttribute("ajaxRequest", ajaxRequest);
        mv.addObject("cateId", cateId);
        System.out.println("cateId: "+cateId);
        System.out.println("index: "+index);
        int count = productsService.countProductByCate(cateId);
        mv.addObject("count", count);
        int endPage = count/4;
        if(count % 4 != 0){
            endPage = endPage + 1;
        }
        request.setAttribute("endPagebyCate", endPage);
        if(index !=null && index > 0){
            mv.addObject("probycate", productsService.getProductByCate(cateId, index));
        }
        else {
            mv.addObject("probycate", productsService.getProductByCate(cateId, 1));
        }
        mv.setViewName("user/productbycategory");

        return mv;
    }
    private boolean isAjaxRequest(HttpServletRequest request) {
        return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }

}
