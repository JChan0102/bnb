package com.bit.bnb.rooms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RoomsRegController {

	// 숙소등록폼페이지
	@RequestMapping(value = "/rooms/registerRooms", method = RequestMethod.GET)
	public ModelAndView getRegRoomsForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("rooms/regRoomsForm");
		return modelAndView;
	}

	// 숙소등록페이지
	@RequestMapping(value = "/rooms/registerRooms", method = RequestMethod.POST)
	public ModelAndView regRooms() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("rooms/regRoomsForm");
		return modelAndView;
	}

}
