package com.spring.controller;

import com.spring.Service.*;
import com.spring.model.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class ShopDetailController {
    @Autowired
    public CategoriesService categoriesService;
    @Autowired
    public ShopDetailService shopDetailService;
    @Autowired
    public FeedbackServices feedbackServices;
    @Autowired
    private CartServiceImpl cartService;

    @RequestMapping(value={ "/shop-detail/{id}"}, method = RequestMethod.GET)
    public ModelAndView shopDetail (@PathVariable int id, HttpSession session)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/shop-detail");
        mv.addObject("productSales",shopDetailService.getProductSales());
        mv.addObject("categories", categoriesService.getAllCategories());
        mv.addObject("productById", shopDetailService.getProductById(id));
        int idCategory = shopDetailService.getProductById(id).get(0).getCateId();
        mv.addObject("similarProducts",shopDetailService.getSimilarProductsByCate(idCategory));
        mv.addObject("feedbacks", feedbackServices.getListFeedback());

        return mv;
    }
    // TEST ADD CART

    @RequestMapping(value = "addCartDT/{id}/{quantity}")
    public String addCart(HttpServletRequest request, HttpSession session, @PathVariable int id, @PathVariable int quantity)
    {
        HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
        if(cart == null) cart = new HashMap<Integer, Cart>();
        cart = cartService.addCart(id, cart,quantity);
        session.setAttribute("cart", cart);
        session.setAttribute("totalPrice", cartService.totalPrice(cart));
        session.setAttribute("totalQuantity", cartService.totalQuantity(cart));
        return "redirect:" + request.getHeader("Referer");
    }
}
