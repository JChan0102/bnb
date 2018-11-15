package com.bit.bnb.rooms.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.bnb.rooms.model.RoomsVO;
import com.bit.bnb.rooms.service.RoomsLIstService;
import com.bit.bnb.rooms.util.Paging;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class RoomsRoomsListController {

	@Autowired
	RoomsLIstService roomsLIstService;

	@RequestMapping(value = "/rooms/getRoomsList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getRoomsReviewList(RoomsVO rv,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPageNo)
			throws JsonProcessingException {
		// Paging paging = roomViewService.getPaging("review", currentPageNo, 4);
		Paging paging = roomsLIstService.getPaging("rooms", currentPageNo, 20);

		// Object to JSON in String
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("roomsList", roomsLIstService.getRoomsList(rv, paging));
		map.put("paging", paging);
		map.put("review", roomsLIstService.getReviewSummary());

		System.out.println("룸리스트컨트롤러" + roomsLIstService.getRoomsList(rv, paging));
		System.out.println("룸리스트컨트롤러" + paging);
		System.out.println("룸리스트컨트롤러" + roomsLIstService.getReviewSummary());

		String jsonInString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
		return jsonInString;
	}
}
