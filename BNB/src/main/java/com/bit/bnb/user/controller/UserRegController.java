package com.bit.bnb.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.user.model.UserVO;
import com.bit.bnb.user.service.UserRegService;

@Controller
@RequestMapping("/userReg")
public class UserRegController {

	@Autowired
	private UserRegService userRegService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getUserRegForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("user/userRegForm");
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView userReg(UserVO userVO, String fail, HttpServletRequest request,
								HttpSession session) throws IllegalStateException, IOException {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/");
		int resultCnt = 0;
		
		if(fail == null) {
			resultCnt = userRegService.userReg(userVO, request);
		}
		
		System.out.println(resultCnt);
		
		if(resultCnt != 1) {
			session.setAttribute("regFail", true);
			modelAndView.setViewName("redirect:/userReg");
		} else {
			session.removeAttribute("regFail");
		}
		return modelAndView;
	}
}
