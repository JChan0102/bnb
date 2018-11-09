package com.bit.bnb.rooms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.rooms.model.AmenitiesVO;
import com.bit.bnb.rooms.model.RoomsVO;
import com.bit.bnb.rooms.service.RoomViewService;

@Controller
public class RoomsViewController {

	@Autowired
	RoomViewService roomViewService;

	@RequestMapping(value = "/rooms/viewRooms", method = RequestMethod.GET)
	public ModelAndView getRoomsHome(RoomsVO rv, AmenitiesVO av) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("amenities", roomViewService.getAmenities(av));
		modelAndView.addObject("selectedRoom", roomViewService.getViewRooms(rv));
		modelAndView.setViewName("rooms/viewRooms");
		return modelAndView;
	}

	@RequestMapping(value = "/rooms/viewRooms", method = RequestMethod.POST)
	public ModelAndView getSearchRoomsHome(RoomsVO rv) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("rooms/viewRooms");
		return modelAndView;
	}
}
