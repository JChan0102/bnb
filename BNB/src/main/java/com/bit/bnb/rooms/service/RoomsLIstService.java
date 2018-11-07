package com.bit.bnb.rooms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.rooms.dao.RoomsDAO;

@Service
public class RoomsLIstService {

	@Autowired
	RoomsDAO roomsDAO;
}
