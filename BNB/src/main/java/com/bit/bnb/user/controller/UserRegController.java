package com.bit.bnb.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.user.model.UserVO;
import com.bit.bnb.user.service.UserRegService;

@Controller
@RequestMapping("/userReg")
public class UserRegController {

	@Autowired
	private UserRegService userRegService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getUserRegForm() {
		return "hyeon/userRegForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView userReg(UserVO userVO, HttpServletRequest request) throws IllegalStateException, IOException {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("hyeon/userRegOK");
		
		int resultCnt = userRegService.userReg(userVO, request);
			
		if(resultCnt != 1) {
			modelAndView.setViewName("hyeon/userRegFail");
		}
		return modelAndView;
	}
}
