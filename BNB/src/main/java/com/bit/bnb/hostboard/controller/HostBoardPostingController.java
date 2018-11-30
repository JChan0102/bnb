package com.bit.bnb.hostboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.hostboard.model.PostVO;
import com.bit.bnb.hostboard.service.PostingService;

@Controller
public class HostBoardPostingController {

	@Autowired
	private PostingService postingService;
	
	// 게시판 포스팅 폼 띄우기
	@RequestMapping(value="/hostBoard/write", method=RequestMethod.GET)
	public ModelAndView getPostingForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hostBoard/writeForm");
		return modelAndView;
	}
	
	// 작성한 게시물 DB 입력 처리
	@RequestMapping(value="/hostBoard/write", method=RequestMethod.POST)
	public ModelAndView writePost(PostVO postVO) {
		int resultCnt = postingService.write(postVO);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/host");
		if(resultCnt != 1) {
			modelAndView.setViewName("hostBoard/error");
		}
		return modelAndView;
	}
	
	// 게시물 삭제
	@RequestMapping("/hostBoard/deletePost")
	public String deletePost(@RequestParam("postNo") int postNo) {
		
		int resultCnt = postingService.deletePost(postNo);
		String result = "redirect:/hostBoard";
		
		if(resultCnt != 1) {
			result = "hostBoard/error";
		}
		
		return result;
	}

}
