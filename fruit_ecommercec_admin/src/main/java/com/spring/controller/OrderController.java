package com.spring.controller;

import com.spring.model.OrderDetail;
import com.spring.model.Orders;
import com.spring.service.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequestMapping(value = "/order")
@Controller
public class OrderController {
    @Autowired
    private OrderServiceImpl orderService;

    @GetMapping(value = "/{index}")
    public ModelAndView order(@PathVariable(required = false) Integer index, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/order");
        int count = orderService.countOrder();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage = endPage + 1;
        }
        request.setAttribute("endPage", endPage);
        if (index != null && index > 0) {
            mv.addObject("listOrder", orderService.getAllOrder(index));
        } else {
            mv.addObject("listOrder", orderService.getAllOrder(1));
        }
        return mv;
    }

    @PostMapping("/updateDeliveryStatus")
    public ModelAndView updateDeliveryStatus(@RequestParam("orderId") int orderId, @RequestParam("status") String status, HttpServletRequest request) {
        orderService.updateDeliveryStatus(orderId, status);
        String currentUrl = request.getRequestURL().toString();
        return new ModelAndView("redirect:/order/1");
    }
    @GetMapping("/orderDetail")
    public ModelAndView orderDetail(@RequestParam("orderId") int orderId){
        ModelAndView mv = new ModelAndView("admin/orderdetail");
        List<OrderDetail> listProductOrder = orderService.getOrderDetailByOrder(orderId);
        Orders orders = orderService.orderById(orderId);
        mv.addObject("listProductOrder",listProductOrder);
        mv.addObject("orders",orders);
        return mv;
    }

}
