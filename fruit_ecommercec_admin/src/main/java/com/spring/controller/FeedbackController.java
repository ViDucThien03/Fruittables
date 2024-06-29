package com.spring.controller;

import com.spring.model.Feedback;
import com.spring.model.Products;
import com.spring.service.FeedbackService;
import com.spring.service.FeedbackServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RequestMapping(value = "/feedback")
@Controller
public class FeedbackController {
    @Autowired
    private FeedbackServiceImpl feedbackService;
    @GetMapping(value = "/{index}")
    public ModelAndView feedback(@PathVariable(required = false) Integer index, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/feedback");
        int count = feedbackService.countFeedback();
        int endPage = count/10;
        if(count % 10 != 0) {
            endPage = endPage + 1;
        }
        request.setAttribute("endPage", endPage);
        if(index !=null && index > 0){
            mv.addObject("listFeedback", feedbackService.getListFeedback(index));
        }
        else {
            mv.addObject("listFeedback", feedbackService.getListFeedback(1));
        }
        return mv;
    }
    @GetMapping(value = "/delete/{id}")
    public ModelAndView deleteFeedBack(@PathVariable(required = false) Integer id){
        ModelAndView mv = new ModelAndView();
        feedbackService.deleteFeedback(id);
        mv.setViewName("redirect:/feedback/1");
        return mv;
    }
    @GetMapping(value = "/add")
    public ModelAndView addFeedback(){
        ModelAndView mv = new ModelAndView();
        mv.addObject("feedback", new Feedback());
        mv.setViewName("admin/addfeedback");
        return mv;
    }
    @PostMapping(value = "/add")
    public ModelAndView addFeedback(@ModelAttribute("feedback")Feedback feedback){
        ModelAndView mv = new ModelAndView();
        feedbackService.addFeedback(feedback);
        mv.setViewName("redirect:/feedback/1");
        return mv;
    }
    @GetMapping(value = "/update")
    public ModelAndView updateFeedback(@RequestParam("id") int id){
        ModelAndView mv = new ModelAndView();
        Feedback feedback = feedbackService.getFeedbackById(id);
        mv.addObject("feedback", feedback);
        mv.setViewName("admin/updatefeedback");
        return mv;
    }
    @PostMapping(value = "/update")
    public ModelAndView updateFeedback(@ModelAttribute("feedback")Feedback feedback){
        ModelAndView mv = new ModelAndView();
        feedbackService.update(feedback);
        mv.setViewName("redirect:/feedback/1");
        return mv;
    }
}
