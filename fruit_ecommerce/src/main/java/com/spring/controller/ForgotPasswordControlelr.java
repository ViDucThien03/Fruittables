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

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
public class ForgotPasswordControlelr {
    @Autowired
    public AuthServiceImpl authService;

    @RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
    public String forgotPassword(){
        return "auth/forgotPassword";
    }

    @RequestMapping(value = "/sendCode", method = RequestMethod.POST)
    public String sendEmail(HttpServletRequest request, HttpSession session, @RequestParam String email, Model model){
        int min = 100000;
        int max = 999999;
        CodeVerify randomNumber = new CodeVerify((int) (Math.random() * (max - min + 1)) + min);
        String code = String.valueOf(randomNumber);
        session.setAttribute("randomNumber", randomNumber.getNumber());
        System.out.println(email);
        int checkAccount = authService.findAccountByEmail(email);
        System.out.println(checkAccount);
        if(checkAccount > 0) {
            session.setAttribute("checkEmail", email);
        }
        if(checkAccount <= 0) {
            model.addAttribute("message","Email không tồn tại!");
            return "auth/forgotPassword";
        }

        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring/application-config.xml");
        MailSender mailSender = (MailSender) context.getBean("mailSender2");
        System.out.println("Sending text...");
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("vithienym19@gmail.com");
        message.setTo(email);
        message.setSubject("Mã xác thực");
        message.setText("Hi "+email+"\n\nWe received your request for a single-use code to use with your Fruittables account."+"\n\nYour single-use code is: "+code);
        // sending message
        mailSender.send(message);
        System.out.println("Sending text done!");
        context.close();
        return "auth/forgotPassword";
    }
    @RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
    public String forgotPassword(@RequestParam("guessedNumber") int guessedNumber, HttpSession session, Model model, @RequestParam("email") String email, @RequestParam String newPassword,@RequestParam String rePassword) {
        int randomNumber = (int) session.getAttribute("randomNumber");
        if (guessedNumber == randomNumber ) {
            if(!Objects.equals(rePassword, newPassword)){
                model.addAttribute("message", "Mật khẩu nhập lại không đúng!");
                model.addAttribute("guessedNumber", guessedNumber);
                return "auth/forgotPassword";
            }
            authService.changePassword(email, newPassword);
            session.removeAttribute("checkEmail");
            session.removeAttribute("randomNumber");
            return "redirect:/login";
        } else {
            model.addAttribute("message","Mã xác minh không đúng!");
            return "auth/forgotPassword";
        }
    }
}
