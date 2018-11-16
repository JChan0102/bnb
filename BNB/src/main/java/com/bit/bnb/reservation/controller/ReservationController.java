package com.bit.bnb.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.reservation.model.ReservationInfo;
import com.bit.bnb.reservation.service.ReservationDoService;
import com.bit.bnb.rooms.model.RoomsVO;
import com.bit.bnb.rooms.service.RoomViewService;


@Controller
public class ReservationController {
	@Autowired
	ReservationDoService service;
	@Autowired
	RoomViewService roomViewService;
	int check = 0;
	
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public ModelAndView getReservation(RoomsVO rv) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("selectedRoom", roomViewService.getViewRooms(rv));
		modelAndView.setViewName("reservation/reservationForm");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	public ModelAndView reservationDo(ReservationInfo info) {
		ModelAndView modelAndView = new ModelAndView();
		check = service.reservationDo(info);
		if(check == 1) {
			modelAndView.addObject("info", info);
		}
		modelAndView.setViewName("reservation/reservationCheck");

		return modelAndView;
	}
}