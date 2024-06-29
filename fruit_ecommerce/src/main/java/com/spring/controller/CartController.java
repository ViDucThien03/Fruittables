package com.spring.controller;

import com.spring.Service.CartService;
import com.spring.Service.CartServiceImpl;
import com.spring.model.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class CartController
{
    @Autowired
    private CartServiceImpl cartService = new CartServiceImpl();

    @RequestMapping(value = "/cart")
    public ModelAndView cartDetail(){
        ModelAndView mv = new ModelAndView("user/cart");
        return mv;
    }

    // Add method = RequestMethod.POST, @ResponseBody
    @RequestMapping(value = "addCart/{id}/{quantity}")
    public String addCart(HttpServletRequest request, HttpSession session, @PathVariable int id, @PathVariable int quantity)
    {
        HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
        if(cart == null) cart = new HashMap<Integer, Cart>();
        cart = cartService.addCart(id, cart, quantity);
        session.setAttribute("cart", cart);
        session.setAttribute("totalPrice", cartService.totalPrice(cart));
        session.setAttribute("totalQuantity", cartService.totalQuantity(cart));
        return "redirect:" + request.getHeader("Referer");
    }

    @RequestMapping(value = "editCart/{id}/{quantity}")
    public String editCart(HttpServletRequest request, HttpSession session, @PathVariable int id, @PathVariable int quantity)
    {
        HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
        if(cart == null) cart = new HashMap<>();
        cart = cartService.editCart(id, quantity, cart);
        session.setAttribute("cart", cart);
        session.setAttribute("totalPrice", cartService.totalPrice(cart));
        session.setAttribute("totalQuantity", cartService.totalQuantity(cart));
        return "redirect:" + request.getHeader("Referer") ;
    }

    @RequestMapping(value = "deleteCart/{id}")
    public String deleteCart(HttpServletRequest request, HttpSession session, @PathVariable int id)
    {
        HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
        if(cart == null) cart = new HashMap<Integer, Cart>();
        cart = cartService.deleteCart(id, cart);
        session.setAttribute("cart", cart);
        session.setAttribute("totalPrice", cartService.totalPrice(cart));
        session.setAttribute("totalQuantity", cartService.totalQuantity(cart));
        return "redirect:" + request.getHeader("Referer") ;
    }
}
