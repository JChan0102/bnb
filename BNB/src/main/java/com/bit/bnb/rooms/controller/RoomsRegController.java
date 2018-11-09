package com.bit.bnb.rooms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.rooms.model.AmenitiesVO;
import com.bit.bnb.rooms.model.RoomsVO;
import com.bit.bnb.rooms.service.RoomsRegService;

@Controller
public class RoomsRegController {

	@Autowired
	RoomsRegService roomsRegService;

	// 숙소등록폼페이지
	@RequestMapping(value = "/rooms/registerRooms", method = RequestMethod.GET)
	public ModelAndView getRegRoomsForm(AmenitiesVO av) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("amenities", roomsRegService.getAmenities(av));
		modelAndView.setViewName("rooms/regRoomsForm");
		return modelAndView;
	}

	// 숙소등록페이지
	@RequestMapping(value = "/rooms/registerRooms", method = RequestMethod.POST)
	public ModelAndView regRooms(RoomsVO rv) {
		ModelAndView modelAndView = new ModelAndView();
		// 숙소등록에 성공하였을 경우
		if (roomsRegService.regRooms(rv) > 0) {
			modelAndView.setViewName("redirect:/rooms");
		} else {
			modelAndView.addObject("msg", "등록에 실패하였습니다.");
			modelAndView.setViewName("rooms/regRoomsForm");
		}
		return modelAndView;
	}

}
