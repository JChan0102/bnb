package com.bit.bnb.rooms.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.rooms.dao.RoomsDAO;
import com.bit.bnb.rooms.model.RoomsReviewSummaryVO;
import com.bit.bnb.rooms.model.RoomsVO;
import com.bit.bnb.rooms.util.Paging;

@Service
public class RoomsLIstService {

	@Autowired
	RoomsDAO roomsDAO;

	public List<RoomsVO> getRoomsList(RoomsVO rv, Paging paging) {

		HashMap<String, Object> map = new HashMap<>();

		map.put("paging", paging);
		map.put("rv", rv);

		return roomsDAO.selectRoomsList(map);
	}

	public Paging getPaging(String tableName, int currentPageNo, int dataPerPage) {
		Paging paging = new Paging(roomsDAO.totalCount(tableName), currentPageNo, dataPerPage);
		paging.makePageing();
		return paging;
	}

	public List<RoomsReviewSummaryVO> getReviewSummary() {
		return roomsDAO.selectRoomsReviewSummary();
	}
}
