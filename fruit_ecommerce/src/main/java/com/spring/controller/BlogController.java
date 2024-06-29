package com.spring.controller;

import com.spring.Service.BlogDetailService;
import com.spring.Service.CategoriesServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BlogController {
    @Autowired
    public BlogDetailService blogDetailService;
    @Autowired
    CategoriesServiceImpl categoriesService;
    @RequestMapping(value = "blog/{index}")
    public ModelAndView paginationProduct(@PathVariable(required = false) Integer index)
    {
        int count = blogDetailService.countBlog();
        int endPage = count / 6;
        if (count % 6 != 0) {
            endPage++;
        }
        ModelAndView mv = new ModelAndView();

        mv.setViewName("user/blog");

        mv.addObject("categories", categoriesService.getAllCategories());
        mv.addObject("blogdetails", blogDetailService.getAllBlogDetails());
        mv.addObject("blogdetailsnew", blogDetailService.getAllBlogDetailsNew());
        mv.addObject("blogTypes", blogDetailService.getAllBlogTypes());
        mv.addObject("endPage", endPage);
        if(index !=null && index > 0){
            mv.addObject("paginationBlog", blogDetailService.paginationBlog(index));
        }
        else {
            mv.addObject("paginationBlog", blogDetailService.paginationBlog(1));
        }

        return mv;
    }

    @RequestMapping(value = "blog-type/{id}/{index}")
    public ModelAndView getBlogByID(@PathVariable int id,@PathVariable Integer index) {
        int count = blogDetailService.countBlogByID(id);
        int endPage = count / 6;
        if (count % 6 != 0) {
            endPage++;
        }
        ModelAndView mv = new ModelAndView("user/blog-type");

        mv.addObject("categories", categoriesService.getAllCategories());
        mv.addObject("blogdetails", blogDetailService.getAllBlogDetails());
        mv.addObject("blogdetailsnew", blogDetailService.getAllBlogDetailsNew());
        mv.addObject("blogTypes", blogDetailService.getAllBlogTypes());
        mv.addObject("blogByID",blogDetailService.getBlogByID(id));
//        mv.addObject("blogDetailsType", blogDetailService.getBlogByID(id, index));
        mv.addObject("idBlog", id);
        mv.addObject("endPage", endPage);
        if(index !=null && index > 0){
            mv.addObject("blogDetailsType", blogDetailService.getBlogByID(id, index));
        }
        else {
            mv.addObject("blogDetailsType", blogDetailService.getBlogByID(id, 1));
        }

        return mv;
    }

}
