package com.spring.controller;

import com.spring.model.Users;
import com.spring.service.AuthServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    public AuthServiceImpl authService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView("auth/login");
        Users user = new Users();
        mv.addObject("user", user);
        return mv;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(HttpSession session, @ModelAttribute("user") Users user){
        ModelAndView mv = new ModelAndView();
        Users authenticatedUser = authService.login(user);
        String username = user.getUsername();
        int check = authService.findAccountbyUsername(username);
        Integer roleId = authService.findRoleIdByUsername(username);
        if(authenticatedUser != null) {

            if(roleId != null && roleId == 1 ){
                mv.setViewName("redirect:/");
                session.setAttribute("loginInfo", authenticatedUser);
            } else {
                mv.setViewName("auth/login");
                mv.addObject("statuslogin", "Bạn không có quyền truy cập!");
            }
        } else {
            mv.setViewName("auth/login");
            if(check == 0){
                mv.addObject("statuslogin", "Tài khoản không tồn tại");
            } else {
                mv.addObject("statuslogin", "Tài khoản hoặc mật khẩu không đúng");
            }

        }
        mv.addObject("user", user);
        return mv;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session, HttpServletRequest request) {
        session.removeAttribute("loginInfo");
        return "redirect:/login";
    }
}

