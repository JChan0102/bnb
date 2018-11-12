package com.bit.bnb.rooms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.rooms.model.AmenitiesVO;
import com.bit.bnb.rooms.model.RoomsVO;
import com.bit.bnb.rooms.service.RoomViewService;
import com.bit.bnb.rooms.service.RoomsModifyService;

@Controller
public class RoomsModifyController {

	@Autowired
	RoomViewService roomViewService;

	@Autowired
	RoomsModifyService roomsModifyService;

	// 숙소수정폼페이지
	@RequestMapping(value = "/rooms/modifyRooms", method = RequestMethod.GET)
	public ModelAndView getModifyRoomsForm(RoomsVO rv, AmenitiesVO av) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("amenities", roomsModifyService.getAmenities(av));
		modelAndView.addObject("selectedRoom", roomViewService.getViewRooms(rv));
		modelAndView.setViewName("rooms/modifyRoomsForm");
		return modelAndView;
	}

	// 숙소수정페이지
	@RequestMapping(value = "/rooms/modifyRooms", method = RequestMethod.POST)
	public ModelAndView modifyRooms(RoomsVO rv) {
		ModelAndView modelAndView = new ModelAndView();

		// 숙소수정에 성공하면
		if (roomsModifyService.modifyRooms(rv) > 0) {
			modelAndView.setViewName("redirect:/rooms");
		} else {
			modelAndView.setViewName("redirect:/rooms/modifyRooms");
		}
		return modelAndView;
	}

}
