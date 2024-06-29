package com.spring.controller;

import com.spring.Service.CategoriesServiceImpl;
import com.spring.Service.ProductsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ProductByCatePageController
{
    @Autowired
    public ProductsServiceImpl productsService;
    @Autowired
    public CategoriesServiceImpl categoriesService;

    @RequestMapping(value="/productbycatepage/{cateId}/{index}")
    public ModelAndView productByCatePage(@PathVariable int cateId, @PathVariable(required = false) Integer index, HttpServletRequest request)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/productbycatepage");
        mv.addObject("categories", categoriesService.getAllCategories());
        int count = productsService.countProductByCate(cateId);
        mv.addObject("count", count);
        mv.addObject("cateId", cateId);
        int endPage = count/9;
        if(count % 9 != 0){
            endPage = endPage + 1;
        }
        request.setAttribute("endPage", endPage);

        if(index !=null && index > 0){
            mv.addObject("paginationProductByCate", productsService.paginationProductByCatePage(cateId, index));
        }
        else {
            mv.addObject("paginationProductByCate", productsService.paginationProductByCatePage(cateId, 1));
        }

        return mv;
    }

}
