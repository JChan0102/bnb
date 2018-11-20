package com.bit.bnb.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.bnb.user.service.PasswordSearchService;

@Controller
public class PasswordSearchController {
	
	@Autowired
	private PasswordSearchService passwordSearchService;

	// 비밀번호 찾기용 유저키 재설정, 유저 아이디를 받아서 비밀번호 재설정 링크가 담긴 메일을 전송한다
	@RequestMapping(value="/user/searchPw", method=RequestMethod.POST)
	@ResponseBody
	public String searchPw(@RequestParam("userId") String userId) {
		
		System.out.println("컨트롤러진입");
		// 유저 아이디 받아서 서비스로 넘긴다
		String result = passwordSearchService.searchPw(userId);
		
		return result;
	}
	
	// 비밀번호 재설정 링크 전송하기 클릭해서 들어오는 부분
	@RequestMapping(value="/user/updatePw", method=RequestMethod.GET)
	@ResponseBody
	public String getUpdatePwForm(@RequestParam("userId") String userId,
									 @RequestParam("userKey") String userKey) {
				
		// 아이디 유저키 확인해서 입력한 비밀번호로 재설정하는 폼 띄워준다
		String result = passwordSearchService.getUpdateUserPwForm(userId, userKey);
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
		int resultCnt = passwordSearchService.updateUserPw(userId, userPw, session);
		
		if(resultCnt != 1) {
			result = "redirect:/user/mailConfirmError";
		}
			
		return result;
	}
}			
	


