package com.bit.bnb.rooms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.rooms.model.RoomsImgVO;
import com.bit.bnb.rooms.model.RoomsVO;
import com.bit.bnb.rooms.service.RoomsDeleteService;

@Controller
public class RoomsDeleteController {

	@Autowired
	RoomsDeleteService roomsDeleteService;

	@RequestMapping(value = "/rooms/deleteRoom", method = RequestMethod.GET)
	public ModelAndView deleteRooms(RoomsVO rv, RoomsImgVO rimgv) {
		ModelAndView modelAndView = new ModelAndView();
		// FK문제로 사진부터 삭제
		roomsDeleteService.deleteRoomImage(rimgv);
		// 삭제에 성공하였으변
		if (roomsDeleteService.deleteRooms(rv) > 0) {
			modelAndView.setViewName("redirect:/rooms");
		} else {
			// 삭제에 실패하였으면
			modelAndView.addObject("msg", "삭제에 실패하였습니다.");
			modelAndView.setViewName("/rooms/modifyRooms");
		}
		return modelAndView;
	}

}
