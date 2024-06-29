package com.spring.controller;

import com.spring.Service.CheckoutServiceImpl;
import com.spring.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;

@Controller
public class TrackOrderController
{
    @Autowired
    private CheckoutServiceImpl checkoutService;

    @RequestMapping(value = "/trackorder", method = RequestMethod.GET)
    public ModelAndView trackOrder(HttpSession session)
    {
        ModelAndView mv = new ModelAndView("user/trackorder");
        User loginInfo = (User) session.getAttribute("loginInfo");
        mv.addObject("trackorder", checkoutService.getOrder(loginInfo.getId()));
        return mv;
    }

    @RequestMapping(value = "/cancelorder", method = RequestMethod.POST)
    public String cancelOrder(@RequestParam("checkoutid") int checkoutid)
    {
        checkoutService.cancelOrder(checkoutid);
        return "redirect:/trackorder";
    }

}

//    @RequestMapping(value = "/orderdetail",method = RequestMethod.GET)
//    public ModelAndView oderDertail() {
//        ModelAndView mv = new ModelAndView("user/orderdetail");
//        //mv.addObject("userInfo", new User());
//        return mv;
//    }