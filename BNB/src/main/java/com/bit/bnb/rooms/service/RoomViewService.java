package com.bit.bnb.rooms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.rooms.dao.RoomsDAO;
import com.bit.bnb.rooms.model.AmenitiesVO;
import com.bit.bnb.rooms.model.RoomsVO;

@Service
public class RoomViewService {

	@Autowired
	RoomsDAO roomsDAO;

	public RoomsVO getViewRooms(RoomsVO rv) {
		return roomsDAO.selectRooms(rv).get(0);
	}

	public List<AmenitiesVO> getAmenities(AmenitiesVO av) {
		return roomsDAO.selectAmenities(av);
	}
}
