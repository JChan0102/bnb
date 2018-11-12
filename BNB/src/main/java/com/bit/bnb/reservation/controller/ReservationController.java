package com.bit.bnb.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ReservationController {
	@Autowired
	
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String getReservation() {
		return "reservation/reservationForm";
	}
	
	
	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	public ModelAndView reservationDo() {
		ModelAndView modelAndView = new ModelAndView();
			

		return modelAndView;
	}
}