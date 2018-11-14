package com.bit.bnb.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.bnb.chatting.service.NewMessageCkServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.user.service.UserLoginService;

@Controller
@RequestMapping("/login")
public class UserLoginContoller {

	@Autowired
	private UserLoginService userLoginService;



	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getLoginForm(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("user/userLoginForm");
		
		// 쿠키 가져오기
		Cookie[] cookies = request.getCookies();

		// 이름이 loginUser인 쿠키가 있으면 값을 가져와서 모델앤뷰에 cookieUserId라는 이름으로 저장
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cookieUserId")) {
					modelAndView.addObject("cookieUserId", cookies[i].getValue());
					modelAndView.addObject("rememberChk", "checked");
				}
			}
		}
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public String userLogin(@RequestParam(value = "userId", required = false) String userId,
								  @RequestParam(value = "userPw", required = false) String userPw,
								  String rememberMe, HttpSession session,
								  HttpServletResponse response) {
		
		System.out.println("로그인 컨트롤러 진입");
		String result = "loginFail";
		
		/*ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("user/userLoginFail");*/
		
		/*// 로그인폼에서 쿠키생성여부 묻는 체크박스에 체크되어있으면 on, 아니면 off
		if(rememberMe != null) {
			rememberMe = "on";
		}else {
			rememberMe = "off";
		}
		*/
		
		if(userId != null && userPw != null) {
			if(userLoginService.userLogin(userId, userPw, session).equals("loginSuccess")) {
				/*modelAndView.setViewName("redirect:/");*/
				
				// result = "redirect:/";
				result = "loginSuccess";
				
				System.out.println("rememberMe : " + rememberMe);
				
				// 쿠키 처리
				// rememberMe가 true 면 쿠키 생성
				if(rememberMe.equals("true")) {
					Cookie cookie = new Cookie("cookieUserId", userId);
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
					System.out.println("생성된 쿠키 : " + cookie.getName() +" : "+ cookie.getValue());
					
				} else {
					// rememberMe가 false면 쿠키 삭제
					System.out.println("쿠키삭제");
					Cookie cookie = new Cookie("cookieUserId", null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			} else if(userLoginService.userLogin(userId, userPw, session).equals("userKeyConfirm")) {
				result = "userKeyConfirm";
			}
		}
		System.out.println("login result : " + result);
		
		return result;
	}
}
