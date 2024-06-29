package com.spring.controller;

import com.spring.Service.AuthServiceImpl;
import com.spring.model.CodeVerify;
import com.spring.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class RegisterController {
    @Autowired
    public AuthServiceImpl authService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("auth/register");
        mv.addObject("user", new User());
        return mv;
    }
    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    public String sendEmail(HttpServletRequest request, HttpSession session,@ModelAttribute("user") User user, Model model){
        String rePassword = request.getParameter("rePassword");
        CodeVerify randomNumber = new CodeVerify((int) (Math.random() * 10000));
        String code = String.valueOf(randomNumber);
        session.setAttribute("randomNumber", randomNumber.getNumber());
        session.setAttribute("userdata", user);
        String cusEmail = user.getCusEmail();
        String username = user.getUserName();
        int checkUsername = authService.findAccountbyUsername(username);
        int checkEmail = authService.findAccountByEmail(cusEmail);
        if(checkUsername > 0) {
            model.addAttribute("message","Tên tài khoản đã tồn tại!");
            return "auth/register";
        }
        if(checkEmail > 0){
            model.addAttribute("message", "Email đã tồn tại!");
            return "auth/register";
        }
//        if(!password.equals(rePassword)){
//            model.addAttribute("message", "Mật khẩu nhập lại không đúng!");
//            return "auth/register";
//        }
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring/application-config.xml");
        MailSender mailSender = (MailSender) context.getBean("mailSender2");
        System.out.println("Sending text...");
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("vithienym19@gmail.com");
        message.setTo(cusEmail);
        message.setSubject("Mã xác thực");
        message.setText("Hi "+cusEmail+"\n\nWe received your request for a single-use code to use with your Fruittables account."+"\n\nYour single-use code is: "+code);
        mailSender.send(message);
        System.out.println("Sending text done!");
        context.close();
        return "auth/verifyAccount";
    }
    @RequestMapping(value = "/verifyAccount", method = RequestMethod.GET)
    public ModelAndView verifyAccount(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("auth/verifyAccount");
        return mv;
    }
    @RequestMapping(value = "/verifyAccount", method = RequestMethod.POST)
    public String verifyAccount(int guessedNumber, HttpSession session, HttpServletRequest request, Model model){
        int randomNumber = (int) session.getAttribute("randomNumber");
        User user = (User) session.getAttribute("userdata");
        System.out.println(user);
        if (guessedNumber == randomNumber) {
            int count = authService.register(user);
                if(count > 0){
                    request.setAttribute("message","Đăng kí tài khoản thành công, vui lòng đăng nhập!");
                    session.removeAttribute("randomNumber");
                    return "redirect:/login";
                }
                else {

                    model.addAttribute("message","Đăng kí tài khoản Thất bại");
                    return "auth/register";
                }
       } else {
            model.addAttribute("message","Mã xác minh không đúng!");
            return "auth/verifyAccount";
        }
    }
}
