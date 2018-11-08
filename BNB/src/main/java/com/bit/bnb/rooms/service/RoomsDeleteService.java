package com.bit.bnb.rooms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.rooms.dao.RoomsDAO;
import com.bit.bnb.rooms.model.RoomsVO;

@Service
public class RoomsDeleteService {

	@Autowired
	RoomsDAO roomsDAO;

	public int deleteRooms(RoomsVO rv) {
		return roomsDAO.deleteRooms(rv);
	}
}
