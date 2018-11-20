package com.bit.bnb.text.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.text.service.TextDetectionService;
import com.bit.bnb.user.model.UserVO;

@Controller
public class TextDetectionController {
	@Autowired
	TextDetectionService service;
	
	@RequestMapping(value="/hostapplication", method =RequestMethod.GET)
	public String text() {
		return "textDetection/detection";
	}
	
	@RequestMapping(value="/textDetection", method =RequestMethod.GET)
	@ResponseBody
	public UserVO text(String userId) {
		ModelAndView modelAndView = new ModelAndView();
		
		UserVO user = service.checkInfo(userId);
		
		
		return user;
	}
}
