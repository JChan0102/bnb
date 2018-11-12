package com.bit.bnb.rooms.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.mypage.model.ReviewVO;
import com.bit.bnb.rooms.dao.RoomsDAO;
import com.bit.bnb.rooms.model.AmenitiesVO;
import com.bit.bnb.rooms.model.RoomsVO;
import com.bit.bnb.rooms.util.Paging;

@Service
public class RoomViewService {

	@Autowired
	RoomsDAO roomsDAO;

	public RoomsVO getViewRooms(RoomsVO rv) {
		// return roomsDAO.selectRooms(rv).get(0);
		HashMap<String, Object> map = new HashMap<>();
		map.put("rv", rv);
		return roomsDAO.selectRoomsList(map).get(0);
	}

	public List<AmenitiesVO> getAmenities(AmenitiesVO av) {
		return roomsDAO.selectAmenities(av);
	}

	public List<ReviewVO> getReviewList(Paging paging, int roomsId) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("roomsId", roomsId);

		return roomsDAO.selectRoomsReview(map);
	}

	public Paging getPaging(String tableName, int currentPageNo, int dataPerPage) {
		Paging paging = new Paging(roomsDAO.totalCount(tableName), currentPageNo, dataPerPage);
		paging.makePageing();
		System.out.println(paging);
		return paging;
	}
}
