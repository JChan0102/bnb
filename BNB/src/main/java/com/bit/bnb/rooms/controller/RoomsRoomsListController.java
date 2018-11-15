package com.bit.bnb.rooms.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.bit.bnb.rooms.model.RoomsVO;
import com.bit.bnb.rooms.service.RoomsLIstService;
import com.bit.bnb.rooms.util.Paging;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class RoomsRoomsListController {

	@Autowired
	RoomsLIstService roomsLIstService;

	@RequestMapping(value = "/rooms/getRoomsList", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getRoomsReviewList(RoomsVO rv,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPageNo)
			throws JsonProcessingException {
		// Paging paging = roomViewService.getPaging("review", currentPageNo, 4);
		Paging paging = roomsLIstService.getPaging("rooms", currentPageNo, 20);
		System.out.println(currentPageNo);

		// Object to JSON in String
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("roomsList", roomsLIstService.getRoomsList(rv, paging));
		map.put("paging", paging);
		map.put("reviewSummary", roomsLIstService.getReviewSummary());

		System.out.println(rv);
		System.out.println("------------------");
		System.out.println("룸리스트컨트롤러" + roomsLIstService.getRoomsList(rv, paging));
		System.out.println("룸리스트컨트롤러" + paging);
		System.out.println("룸리스트컨트롤러" + roomsLIstService.getReviewSummary());

		String jsonInString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
		return jsonInString;
	}


	@RequestMapping(value = "/rooms/getRoomsList", method = RequestMethod.GET)
	@ResponseBody
	public String getRoomsReviewList11(RoomsVO rv,
									 @RequestParam(value = "page", required = false, defaultValue = "1") int currentPageNo)
			throws JsonProcessingException {
		// Paging paging = roomViewService.getPaging("review", currentPageNo, 4);
		Paging paging = roomsLIstService.getPaging("rooms", currentPageNo, 20);
		System.out.println(currentPageNo);

		// Object to JSON in String
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("roomsList", roomsLIstService.getRoomsList(rv, paging));
		map.put("paging", paging);
		map.put("reviewSummary", roomsLIstService.getReviewSummary());

		System.out.println(rv);

		String jsonInString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
		return jsonInString;
	}
}
