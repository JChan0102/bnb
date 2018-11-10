package com.bit.bnb.user.service;

import javax.servlet.http.HttpSession;

import com.bit.bnb.chatting.service.NewMessageCkServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.user.dao.UserDao;
import com.bit.bnb.user.model.UserVO;

@Service
public class UserLoginService {
	
	@Autowired
	private UserDao userDao;

	@Autowired
	private NewMessageCkServie messageCkServie;
	
	public boolean userLogin(String userId, String userPw, HttpSession session) {
		
		boolean result = false;
		
		UserVO userVO = userDao.selectUser(userId);
		
		// 해당 아이디의 인스턴스가 null이 아니고 패스워드가 일치하면 로그인 처리한다
		if(userVO != null && (userVO.getUserPw().equals(userPw))) {
			
			// 세션에 사용자 데이터를 저장한다 - 보안을 위해서 패스워드는 비워줌
			userVO.setUserPw("");
			
			// 만약 loginUser라는 세션값이 이미 존재하고 있다면 지워준다
			if(session.getAttribute("loginUser") != null) {
				session.removeAttribute("loginUser");
			}
			
			// 세션에 loginUser라는 이름으로 유저 인스턴스를 저장
			session.setAttribute("loginUser", userVO);

			session.setAttribute("NewmessageCk",messageCkServie.getList(userVO.getUserId()));

			result = true;
		}
		
		return result;
	}
}
