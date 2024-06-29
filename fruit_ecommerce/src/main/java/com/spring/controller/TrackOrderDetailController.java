package com.spring.controller;

import com.spring.Service.CheckoutServiceImpl;
import com.spring.model.Checkout;
import com.spring.model.OrderDetail;
import com.spring.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TrackOrderDetailController
{
    @Autowired
    private CheckoutServiceImpl checkoutService;
    private User loginInfo;
    @RequestMapping(value="/trackorderdetail", method = RequestMethod.GET)
    public ModelAndView trackorderdetail(HttpSession session, @RequestParam("orderId") int orderId)
    {
        ModelAndView mv = new ModelAndView("user/trackorderdetail");
        List<OrderDetail> listProductOrder = checkoutService.getOrderDetailByOrder(orderId);
        Checkout orders = checkoutService.orderById(orderId);
        mv.addObject("listProductOrder",listProductOrder);
        mv.addObject("orders",orders);
        return mv;
    }
}
