package com.bit.bnb.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.mypage.service.reviewToListService;

@Controller
public class reviewToListController {
	
	@Autowired
	private reviewToListService service;
	
	@RequestMapping("/review")
	public ModelAndView reviewToList() {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("mypage/review");
		modelAndView.addObject("reviewTo", service.reviewToListView());
		modelAndView.addObject("reviewWrite", service.reviewWriteList());
		
		return modelAndView;
	}

}
