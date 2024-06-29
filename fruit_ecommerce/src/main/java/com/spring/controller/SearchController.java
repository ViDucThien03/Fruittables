package com.spring.controller;

import com.spring.Service.SearchServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SearchController
{
    @Autowired
    private SearchServiceImpl searchService = new SearchServiceImpl();

    @RequestMapping(value = "/search/{freeText}", method = RequestMethod.GET)
//    public ModelAndView search(@PathVariable String freeText) {
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("freeText", freeText);
//        mv.setViewName("user/search");
//        mv.addObject("searchResult", searchService.findAllProducts(freeText));
//        return mv;
//    }

    public ModelAndView search(@PathVariable String freeText, HttpSession session, Model model) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("freeText", freeText);
        mv.setViewName("user/search");
        mv.addObject("searchResult", searchService.findAllProducts(freeText));
        return mv;
    }
}
