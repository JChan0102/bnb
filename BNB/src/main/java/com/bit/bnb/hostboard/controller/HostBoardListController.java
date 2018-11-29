package com.bit.bnb.hostboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.hostboard.model.PageView;
import com.bit.bnb.hostboard.service.HostBoardService;

@Controller
public class HostBoardListController {

	@Autowired
	private HostBoardService hostBoardService;
	
	/*@RequestMapping("/host")
	public ModelAndView getHostBoardList() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<PostVO> postList = hostBoardService.getPostList();

		modelAndView.addObject("postList", postList);
		modelAndView.setViewName("hostBoard/hostBoard");
		return modelAndView;
	}*/
	
	@RequestMapping("/host")
	public ModelAndView getHostBoardList(@RequestParam(value="page", defaultValue="1") int page) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("겟호스트보드리스트 컨트롤러 진입");
		System.out.println("page : "+ page);
		
		int pageNumber = 1;
		
		if(page != 0) {
			pageNumber = page;
		}
		
		PageView postListData = hostBoardService.getPostList(pageNumber);
		
		modelAndView.addObject("postListData", postListData);
		modelAndView.setViewName("hostBoard/hostBoard");
		
		return modelAndView;
	}
}
