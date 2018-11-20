package com.bit.bnb.user.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.bnb.user.dao.UserDao;
import com.bit.bnb.user.model.UserVO;

@Service
public class PasswordSearchService {

	@Autowired
	private GetRandomStringService getRandomStringService;
	
	@Autowired
	private MailSendService mailSendService;
	
	@Autowired
	private UserDao userDao;
	
	// 유저키 변경 + 메일보내기
	@Transactional
	public String searchPw(String userId) {

		System.out.println("서비스진입 - 유저아이디 : " + userId);
		
		UserVO user = new UserVO();
		String result = "idNotFound";

		user = userDao.selectUser(userId);
		// 입력된 이메일의 계정있는지 확인

		System.out.println("user : " + user);
		
		if (user != null) {
			
				String userKey = getRandomStringService.getRandomString();
				
				HashMap<String, String> map = new HashMap<String, String>();
				
				map.put("param1", userKey);
				map.put("param2", userId);
				
				System.out.println("유저로그인서비스 - 맵: " + map);
				
				int resultCnt = userDao.updateUserKeySearchPw(map);
				
				System.out.println("쿼리결과 : " + resultCnt);
				
				// 그리고 메일발송
				if(resultCnt == 1) {
					mailSendService.mailSendSearchPw(userId, user.getUserName(), userKey);
					
					result = "mailSendForPw";
				} else { // 인증키 업데이트 실패시
					
					result = "mailSendForPwFail";
				}
			}
		return result;
	}
	
	
	// 메일 링크 클릭 - 유저 아이디와 키를 비교해서 비밀번호 재설정하는 폼을 띄워준다
	@Transactional
	public String getUpdateUserPwForm(String userId, String userKey) {
		
		String result = "redirect:/user/mailConfirmError";
			UserVO user = new UserVO();
		user = userDao.selectUser(userId);
		
		if(user.getUserKey().equals(userKey)) {
			result = "user/updatePw";
		}
		
		return result;
	}
	
	
	// 비밀번호 재설정
	@Transactional
	public int updateUserPw(String userId, String userPw, HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put(userId, userPw);
		
		int resultCnt = userDao.updateUserPw(map);
		
		if(resultCnt == 1) {
			if (session.getAttribute("updatePw") != null) {
				session.removeAttribute("updatePw");
			}
			session.setAttribute("updatePw", "updatePw");
		}
		
		return resultCnt;
	}
}