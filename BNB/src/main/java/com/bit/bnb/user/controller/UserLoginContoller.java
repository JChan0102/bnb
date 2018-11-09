package com.bit.bnb.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.user.service.UserLoginService;

@Controller
@RequestMapping("/login")
public class UserLoginContoller {

	@Autowired
	private UserLoginService userLoginService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getLoginForm() {
		return "user/userLoginForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView userLogin(@RequestParam(value = "userId", required = false) String userId,
								  @RequestParam(value = "userPw", required = false) String userPw,
								  HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("user/loginFail");
		
		if(userId != null && userPw != null) {
			if(userLoginService.userLogin(userId, userPw, session)) {
				modelAndView.setViewName("redirect:/");
			}
		}
		
		return modelAndView;
	}
}
