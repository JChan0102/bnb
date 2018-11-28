package com.bit.bnb.hostboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.hostboard.model.PostVO;
import com.bit.bnb.hostboard.service.PostingService;

@Controller
public class HostBoardController {

	@Autowired
	private PostingService postingService;
	
	@RequestMapping(value="/hostBoard/write", method=RequestMethod.GET)
	public ModelAndView getPostingForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hostBoard/writeForm");
		return modelAndView;
	}
	
	@RequestMapping(value="/hostBoard/write", method=RequestMethod.POST)
	public ModelAndView writePost(PostVO postVO) {
		System.out.println("postVO : "+postVO);
		int resultCnt = postingService.write(postVO);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/host");
		if(resultCnt != 1) {
			modelAndView.setViewName("hostBoard/error");
		}
		return modelAndView;
	}

}
