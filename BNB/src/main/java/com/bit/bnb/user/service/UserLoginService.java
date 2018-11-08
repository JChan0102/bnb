package com.bit.bnb.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.user.dao.UserDao;
import com.bit.bnb.user.model.UserVO;

@Service
public class UserLoginService {
	
	@Autowired
	private UserDao userDao;

	public boolean userLogin(String userId, String userPw, HttpSession session) {
		
		boolean result = false;
		
		UserVO userVO = userDao.selectUser(userId);
		
		// 해당 아이디의 인스턴스가 null이 아니고 패스워드가 일치하면 로그인 처리한다
		if(userVO != null && (userVO.getUserPw().equals(userPw))) {
			// 세션에 사용자 데이터를 저장한다 - 보안을 위해서 패스워드는 비워줌
			userVO.setUserPw("");
			
			session.setAttribute("loginUser", userVO);
			
			result = true;
		}
		
		return result;
	}
}
