package com.bit.bnb.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.user.model.UserVO;
import com.bit.bnb.user.service.UserRegService;

@Controller
public class UserRegController {

	@Autowired
	private UserRegService userRegService;
	
	@RequestMapping(value="/userReg", method = RequestMethod.GET)
	public ModelAndView getUserRegForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("user/userRegForm");
		return modelAndView;
	}
	
	@RequestMapping(value="/userReg", method = RequestMethod.POST)
	public ModelAndView userReg(UserVO userVO, 
								@RequestParam("fail-pw-1") String fail1,
								@RequestParam("fail-pw-2") String fail2, 
								HttpServletRequest request,
								HttpSession session) throws IllegalStateException, IOException {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/");
		int resultCnt = 0;
		
		System.out.println(fail1 +" : " + fail2);

		if(fail1.equals("ok") && fail2.equals("ok")) {
			resultCnt = userRegService.userReg(userVO, request);
		} else {
			resultCnt = 0;
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
	
	@RequestMapping("/userIdChk")
	@ResponseBody
	public String userIdChk(@RequestParam("userId") String userId) {
		System.out.println("체크컨트롤러진입");
		String userIdChk = userRegService.getUserIdChk(userId);
		System.out.println(userIdChk);
		return userIdChk;
	}
}
