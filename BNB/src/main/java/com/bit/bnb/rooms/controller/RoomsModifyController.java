package com.bit.bnb.rooms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.rooms.model.AmenitiesVO;
import com.bit.bnb.rooms.model.RoomsImgVO;
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
	public ModelAndView getModifyRoomsForm(RoomsVO rv, AmenitiesVO av, RoomsImgVO rimgv) {
		ModelAndView modelAndView = new ModelAndView();
		// 줄바꿈 처리
		rv = roomViewService.getViewRooms(rv);
		rv.setDetails(rv.getDetails().replaceAll("<br>", "\r\n"));
		// 줄바꿈 처리 끝
		modelAndView.addObject("amenities", roomsModifyService.getAmenities(av));
		modelAndView.addObject("selectedRoom", rv);
		modelAndView.setViewName("rooms/modifyRoomsForm");
		modelAndView.addObject("roomImages", roomViewService.getRoomImages(rimgv));
		return modelAndView;
	}

	// 숙소수정페이지
	@RequestMapping(value = "/rooms/modifyRooms", method = RequestMethod.POST)
	public ModelAndView modifyRooms(RoomsVO rv) {
		ModelAndView modelAndView = new ModelAndView();
		// 줄 바꿈 처리
		rv.setDetails(rv.getDetails().replaceAll("\r\n", "<br>"));
		// 숙소수정에 성공하면
		if (roomsModifyService.modifyRooms(rv) > 0) {
			modelAndView.setViewName("redirect:/rooms");
		} else {
			modelAndView.setViewName("redirect:/rooms/modifyRooms");
		}
		return modelAndView;
	}

}
