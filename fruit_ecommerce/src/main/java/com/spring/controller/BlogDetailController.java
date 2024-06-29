package com.spring.controller;

import com.spring.Service.BlogDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BlogDetailController {
    @Autowired
    public BlogDetailService blogDetailService;

    @RequestMapping(value={ "/blog-detail/{id}"}, method = RequestMethod.GET)
    public ModelAndView blogDetails(@PathVariable int id) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/blog-detail");
        mv.addObject("blogdetails", blogDetailService.getAllBlogDetails());
        mv.addObject("blogdetailsnew", blogDetailService.getAllBlogDetailsNew());
        mv.addObject("blogTypes", blogDetailService.getAllBlogTypes());
        mv.addObject("blogByID",blogDetailService.getBlogByID(id));
        int idBlogType = blogDetailService.getBlogByID(id).get(0).getBlogId();
        mv.addObject("blogTypesByID",blogDetailService.getBlogTypesByID(idBlogType));
        mv.addObject("blogDetailsByBlogTypeID",blogDetailService.getBlogDetailsByBlogTypeID(idBlogType));
        return mv;
    }
}
