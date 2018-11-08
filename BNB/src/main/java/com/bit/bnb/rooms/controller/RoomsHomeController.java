package com.bit.bnb.rooms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.rooms.model.RoomsVO;
import com.bit.bnb.rooms.service.RoomsLIstService;

@Controller
public class RoomsHomeController {

	@Autowired
	RoomsLIstService roomsLIstService;

	@RequestMapping(value = "/rooms", method = RequestMethod.GET)
	public ModelAndView getRoomsHome(RoomsVO rv) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("rooms", roomsLIstService.getRoomsList(rv));
		modelAndView.setViewName("rooms/home");
		return modelAndView;
	}

	@RequestMapping(value = "/rooms", method = RequestMethod.POST)
	public ModelAndView getSearchRoomsHome(RoomsVO rv) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("rooms", roomsLIstService.getRoomsList(rv));
		modelAndView.setViewName("rooms/home");
		return modelAndView;
	}
}
