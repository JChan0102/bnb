package com.bit.bnb.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.reservation.service.ReservationDoService;


@Controller
public class ReservationController {
	@Autowired
	ReservationDoService service;
	int check = 0;
	
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String getReservation() {
		return "reservation/reservationForm";
	}
	
	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	public ModelAndView reservationDo() {
		ModelAndView modelAndView = new ModelAndView();
		check = service.reservationDo();

		return modelAndView;
	}
}