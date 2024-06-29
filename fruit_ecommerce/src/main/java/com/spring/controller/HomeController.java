package com.spring.controller;

import com.spring.Service.*;
import com.spring.model.Feedback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController
{
    @Autowired
    public CategoriesServiceImpl categoriesService;
    @Autowired
    public ProductsServiceImpl productsService;

    @Autowired
    public SupplierServicesImpl supplierServices;
    @Autowired
    public FeedbackServicesImpl feedbackServices;
    @RequestMapping(value={"/", "/home"}, method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/homepage");
        mv.addObject("categories", categoriesService.getAllCategories());
        mv.addObject("products", productsService.getAllProducts());
        mv.addObject("listvegetable", productsService.getFreshVegetable());
        mv.addObject("bestseller", productsService.getBestSeller());
        mv.addObject("availableProducts", productsService.countProduct());
        mv.addObject("quantityCertificate", supplierServices.countCertificates());
        mv.addObject("quantityService", supplierServices.quantityService());
        mv.addObject("satisfiedCustomers", supplierServices.satisfiedCustomers());
        List<Feedback> feedbackList = feedbackServices.getListFeedback();
        for (Feedback feedback : feedbackList) {
            String cusName = feedback.getCusName();
            if(cusName == null){
                feedback.setCusName("Ẩn danh");
            }
        }
        mv.addObject("feedback", feedbackList);
        return mv;
    }


}
