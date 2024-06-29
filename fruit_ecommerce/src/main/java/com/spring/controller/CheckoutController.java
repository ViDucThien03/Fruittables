package com.spring.controller;

import com.spring.Service.CheckoutServiceImpl;
import com.spring.model.Cart;
import com.spring.model.Checkout;
import com.spring.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class CheckoutController
{
    @Autowired
    private CheckoutServiceImpl checkoutService;

    private User loginInfo;

    @RequestMapping(value = "/checkout",  method = RequestMethod.GET)
    public ModelAndView checkout(HttpServletRequest request, HttpSession session)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/checkout");
        Checkout checkout = new Checkout();
        loginInfo = (User) session.getAttribute("loginInfo");
        if(loginInfo != null)
        {
            checkout.setAddress(loginInfo.getCusAddress());
            checkout.setFullName(loginInfo.getCusName());
            checkout.setPhone(loginInfo.getCusPhone());
            checkout.setEmail(loginInfo.getCusEmail());
            checkout.setUserid(loginInfo.getId());

        }
        mv.addObject("checkout", checkout);

        return mv;
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public String checkoutBill(HttpServletRequest request, HttpSession session, @ModelAttribute("checkout") Checkout checkout, RedirectAttributes redirectAttributes)
    {
        loginInfo = (User) session.getAttribute("loginInfo");

        checkout.setQuantity((Integer) session.getAttribute("totalQuantity"));
        checkout.setTotal((Double) session.getAttribute("totalPrice"));
        String paymentMethod = checkout.getPaymentMethod();
        System.out.println("paymentMethod: "+ paymentMethod);
        if(checkoutService.addCheckout(checkout) > 0 && paymentMethod.equals("COD"))
        {
            HashMap<Integer, Cart> carts = (HashMap<Integer, Cart>) session.getAttribute("cart");
            checkoutService.addCheckoutDetail(carts);
            session.removeAttribute("cart");
        }
        return "redirect:/shop/1";
    }
    @RequestMapping(value = "/saveData", method = RequestMethod.POST)
    public String saveData(HttpServletRequest request, HttpSession session, @ModelAttribute("checkout") Checkout checkout, RedirectAttributes redirectAttributes)
    {
        loginInfo = (User) session.getAttribute("loginInfo");

        checkout.setQuantity((Integer) session.getAttribute("totalQuantity"));
        checkout.setTotal((Double) session.getAttribute("totalPrice"));
        session.setAttribute("checkoutdata", checkout);
        return "redirect:https://meet.google.com/qzm-vadg-qae?fbclid=IwZXh0bgNhZW0CMTAAAR2p41jbqu-U9pKdVGNyP6_4ub4HD4yB6M6cgcbHhtPVAFO2JTJnb2lTxWc_aem_aMwkMnOhf2dxmK2u58PHow";
    }
}
