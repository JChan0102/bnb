package com.bit.bnb.rooms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RoomsHomeController {

	@RequestMapping(value = "/rooms", method = RequestMethod.GET)
	public ModelAndView getRoomsHome() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("rooms/home");
		return modelAndView;
	}

}
