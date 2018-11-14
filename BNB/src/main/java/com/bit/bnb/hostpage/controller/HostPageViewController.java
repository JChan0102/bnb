package com.bit.bnb.hostpage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HostPageViewController {

    @RequestMapping(value = "/hostpage/main")
    public ModelAndView getPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("hostpage/main");
        return modelAndView;
    }
}
