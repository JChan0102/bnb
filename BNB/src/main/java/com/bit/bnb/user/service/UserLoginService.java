package com.bit.bnb.user.service;

import javax.servlet.http.HttpSession;

import com.bit.bnb.chatting.service.NewMessageCkServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.bnb.user.dao.UserDao;
import com.bit.bnb.user.model.UserVO;

@Service
public class UserLoginService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private EncryptSha256Service sha256Service;

	@Autowired
	private NewMessageCkServie messageCkServie;

	@Transactional
	public String userLogin(String userId, String userPw, HttpSession session) {

		String result = "loginFail";

		UserVO userVO = userDao.selectUser(userId);

		String ePw = sha256Service.encrypt(userPw);

		// 해당 아이디의 회원이 존재하고 유저키가 g라면 -> 구글회원
		if (userVO != null && userVO.getUserKey().equals("g") && userVO.getDisabled() == 1) {
			result = "google";

			// ====================================================
			// 해당 아이디의 인스턴스가 null이 아니고 패스워드가 일치하면 로그인 처리한다 + 유저키가 y면 로그인처리(메일인증된상태)
		} else if (userVO != null && (userVO.getUserPw().equals(ePw)) && userVO.getUserKey().equals("y") && userVO.getDisabled() == 1) {

			// 세션에 사용자 데이터를 저장한다 - 보안을 위해서 패스워드는 비워줌
			userVO.setUserPw("");

			// 만약 loginUser라는 세션값이 이미 존재하고 있다면 지워준다
			if (session.getAttribute("loginUser") != null) {
				session.removeAttribute("loginUser");
			}

			// 세션에 loginUser라는 이름으로 유저 인스턴스를 저장
			session.setAttribute("loginUser", userVO);

			messageCkServie.getList(userVO.getUserId(), session);

			result = "loginSuccess";
			// 로그인 처리 끝
			// =====================================================

			// 아이디와 비밀번호는 일치하지만 이메일이 인증되지 않았을 경우 + 구글계정이 아닌경우
		} else if (userVO != null && (userVO.getUserPw().equals(ePw)) && !userVO.getUserKey().equals("g") && userVO.getDisabled() == 1) {

			// 만약 loginUser라는 세션값이 이미 존재하고 있다면 지워준다
			if (session.getAttribute("loginUser") != null) {
				session.removeAttribute("loginUser");
			}

			result = "userKeyConfirm";
			// 인증키 확인 요망 처리 끝
			// =====================================================
			// 이미 탈퇴한 회원일 경우
		}  else if (userVO != null && userVO.getDisabled() == 0) {

			// 만약 loginUser라는 세션값이 이미 존재하고 있다면 지워준다
			if (session.getAttribute("loginUser") != null) {
				session.removeAttribute("loginUser");
			}

			result = "disabled";
			// =====================================================
		}

		return result;
	}

	@Transactional
	public String googleLogin(String gId, HttpSession session) {

		UserVO userVO = userDao.selectUser(gId);

		String result = "";
		
		// 구글아이디가  db에 있고 유저키가 g이면 로그인처리 : 구글계정으로 가입되어있는 경우
		if (userVO != null && userVO.getUserKey().equals("g") && userVO.getDisabled() == 1) {
			
			// 세션에 사용자 데이터를 저장한다 - 보안을 위해서 패스워드는 비워줌
			userVO.setUserPw("");

			// 만약 loginUser라는 세션값이 이미 존재하고 있다면 지워준다
			if (session.getAttribute("loginUser") != null) {
				session.removeAttribute("loginUser");
			}

			// 세션에 유저VO 저장
			session.setAttribute("loginUser", userVO);

			messageCkServie.getList(userVO.getUserId(), session);
			
			result = "googleLoginSuccess";

		} else if (userVO != null && !userVO.getUserKey().equals("g") && userVO.getDisabled() == 1) {
			
			if (session.getAttribute("loginUser") != null) {
				session.removeAttribute("loginUser");
			}
			
			result = "notGoogleUser";
			
		} else if (userVO != null && userVO.getDisabled() == 0) {

			if (session.getAttribute("loginUser") != null) {
				session.removeAttribute("loginUser");
			}

			result = "disabled";
			
		} else {
			
			result = "googleUserReg";
		}
		return result;
	}
}
