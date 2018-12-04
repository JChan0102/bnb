package com.bit.bnb.hostboard.controller;

import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.hostboard.model.PageView;
import com.bit.bnb.hostboard.model.PostVO;
import com.bit.bnb.hostboard.service.HostBoardService;

@Controller
public class HostBoardController {

	@Autowired
	private HostBoardService hostBoardService;

	// 호스트보드 페이지 보여주기
	@RequestMapping("/hostBoard")
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
	
	
	// 게시물 내용 보여주기
	@RequestMapping("/hostBoard/postView")
	public ModelAndView getPostView(@RequestParam("postNo") int postNo) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hostBoard/postView");
		PostVO post = new PostVO();
		post = hostBoardService.getPost(postNo);
		modelAndView.addObject("post", post);
		
		return modelAndView;
		
	}
	
	
	
}
