package com.bit.bnb.rooms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.rooms.dao.RoomsDAO;
import com.bit.bnb.rooms.model.AmenitiesVO;
import com.bit.bnb.rooms.model.RoomsVO;

@Service
public class RoomsModifyService {

	@Autowired
	RoomsDAO roomsDAO;

	public int modifyRooms(RoomsVO rv) {
		return roomsDAO.updateRooms(rv);
	}

	public List<AmenitiesVO> getAmenities(AmenitiesVO av) {
		return roomsDAO.selectAmenities(av);
	}
}
