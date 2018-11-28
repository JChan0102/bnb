package com.bit.bnb.hostboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.hostboard.model.PostVO;
import com.bit.bnb.hostboard.service.HostBoardService;

@Controller
public class HostBoardListController {

	@Autowired
	private HostBoardService hostBoardService;
	
	@RequestMapping("/host")
	public ModelAndView getHostBoardList() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<PostVO> postList = hostBoardService.getPostList();

		modelAndView.addObject("postList", postList);
		modelAndView.setViewName("hostBoard/listTest");
		return modelAndView;
	}
}
