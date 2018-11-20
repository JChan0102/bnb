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
public class UserLoginContoller {

	@Autowired
	private UserLoginService userLoginService;

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView getLoginForm(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("user/userLoginForm");

		// 쿠키 가져오기
		Cookie[] cookies = request.getCookies();

		// 이름이 loginUser인 쿠키가 있으면 값을 가져와서 모델앤뷰에 cookieUserId라는 이름으로 저장
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("cookieUserId")) {
					modelAndView.addObject("cookieUserId", cookies[i].getValue());
					modelAndView.addObject("rememberChk", "checked");
				}
			}
		}
		return modelAndView;
	}

	@RequestMapping(value="/login", method = RequestMethod.POST)
	@ResponseBody
	public String userLogin(@RequestParam(value = "userId", required = false) String userId,
			@RequestParam(value = "userPw", required = false) String userPw, String rememberMe, HttpSession session,
			HttpServletResponse response) {

		String result = "";

		if (userId != null && userPw != null) {

			// 로그인서비스의 로그인 처리 결과를 담는다.
			result = userLoginService.userLogin(userId, userPw, session);
			System.out.println("로그인 result : " + result);

			// 로그인 처리 경우의 수 :
			// 1. 구글계정인경우 - 구글계정으로 로그인 요청(메인에 얼럿띄우기) : google
			// 2. 아이디와 패스워드가 일치하고 메일인증 완료된 경우 - 로그인 처리(+쿠키생성) : loginSuccess
			// 3. 아이디와 패스워드는 일치하지만 메일인증이 안된경우 - 메일인증요청 : userKeyConfirm
			// 4. 아이디로 셀렉되는 로우가 없거나 패스워드가 일치하지 않는 경우 - 아이디와 패스워드 확인요청 : loginFail
			// 5. 이미 탈퇴한 회원의 아이디 - disabled가 0인경우 : disabled

			if (result.equals("loginSuccess")) {

				if (rememberMe.equals("true")) {
					Cookie cookie = new Cookie("cookieUserId", userId);
					cookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(cookie);
					System.out.println("생성된 쿠키 : " + cookie.getName() + " : " + cookie.getValue());

				} else {
					// rememberMe가 false면 쿠키 삭제
					System.out.println("쿠키삭제");
					Cookie cookie = new Cookie("cookieUserId", null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}

		}
		return result;
	}
	
	
	@RequestMapping(value="/googleLogin", method=RequestMethod.POST)
	@ResponseBody
	public String googleLogin(@RequestParam(value = "gId", required = false) String gId,
							  HttpSession session) {
		
		System.out.println("구글 로그인 컨트롤러 진입");
		
		String result = userLoginService.googleLogin(gId, session);
		
		System.out.println("result : " + result);
	
		return result;
	}

	
	// 비밀번호 찾기용 유저키 재설정, 유저 아이디를 받아서 비밀번호 재설정 링크가 담긴 메일을 전송한다
	@RequestMapping(value="/user/searchPw", method=RequestMethod.POST)
	@ResponseBody
	public String searchPw(@RequestParam("userId") String userId) {
		// 유저 아이디 받아서 서비스로 넘긴다
		String result = userLoginService.searchPw(userId);
		
		return result;
	}
	
	// 비밀번호 재설정 링크 전송하기 클릭해서 들어오는 부분
	@RequestMapping(value="/user/updatePw", method=RequestMethod.GET)
	@ResponseBody
	public String getUpdatePwForm(@RequestParam("userId") String userId,
									 @RequestParam("userKey") String userKey) {
				
		// 아이디 유저키 확인해서 입력한 비밀번호로 재설정하는 폼 띄워준다
		String result = userLoginService.getUpdateUserPwForm(userId, userKey);
		return result;
	}
	
	// 비밀번호 재설정 버튼 클릭
	@RequestMapping(value="/user/updatePw", method=RequestMethod.POST)
	@ResponseBody
	public String updatePw(@RequestParam("userId") String userId,
						   @RequestParam("userPw") String userPw,
						   HttpSession session) {

		String result = "redirect:/";
		
		// 입력한 비밀번호로 바꿔주기
		int resultCnt = userLoginService.updateUserPw(userId, userPw, session);
		
		if(resultCnt != 1) {
			result = "redirect:/user/mailConfirmError";
		}
			
		return result;
	}
			
	
}
