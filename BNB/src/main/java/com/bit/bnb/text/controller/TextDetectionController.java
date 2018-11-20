package com.bit.bnb.text.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TextDetectionController {
	
	@RequestMapping(value="/hostapplication", method =RequestMethod.GET)
	public String text() {
		return "textDetection/detection";
	}
	
	@RequestMapping("/textDetection")
	public ModelAndView text(String userId) {
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
}
