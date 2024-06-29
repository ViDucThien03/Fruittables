package com.spring.controller;

import com.spring.Service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactController
{
    @Autowired
    public ContactService contactService;

    @RequestMapping(value={ "/contact"}, method = RequestMethod.GET)
    public ModelAndView contact() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/contact");
        mv.addObject("contacts", contactService.getContact());
        return mv;
    }
}
