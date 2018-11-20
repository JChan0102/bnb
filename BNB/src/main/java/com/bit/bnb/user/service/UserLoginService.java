package com.bit.bnb.user.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.bnb.chatting.service.NewMessageCkServie;
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

	@Autowired
	private GetRandomStringService getRandomStringService;
	
	@Autowired
	private MailSendService mailSendService;

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
		} else if (userVO != null && (userVO.getUserPw().equals(ePw)) && userVO.getUserKey().equals("y")
				&& userVO.getDisabled() == 1) {

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
		} else if (userVO != null && (userVO.getUserPw().equals(ePw)) && !userVO.getUserKey().equals("g")
				&& userVO.getDisabled() == 1) {

			// 만약 loginUser라는 세션값이 이미 존재하고 있다면 지워준다
			if (session.getAttribute("loginUser") != null) {
				session.removeAttribute("loginUser");
			}

			result = "userKeyConfirm";
			// 인증키 확인 요망 처리 끝
			// =====================================================
			// 이미 탈퇴한 회원일 경우
		} else if (userVO != null && userVO.getDisabled() == 0) {

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

		// 구글아이디가 db에 있고 유저키가 g이면 로그인처리 : 구글계정으로 가입되어있는 경우
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

	
	// 
	@Transactional
	public String searchPw(String userId) {

		UserVO user = new UserVO();
		String result = "idNotFound";

		// 입력된 이메일의 계정있는지 확인
		user = userDao.selectUser(userId);

		// 계정이 존재하면 유저키를 확인 - y나 g인지
		if (user != null) {
			if (user.getUserKey().equals("y") || user.getUserKey().equals("g")) {

				// 우선 유저키를 난수로 바꾼다
				String userKey = getRandomStringService.getRandomString();
				HashMap<String, String> map = new HashMap<String, String>();
				map.put(userKey, userId);
				int resultCnt = userDao.updateUserKeySearchPw(map);
				
				// 그리고 메일발송
				if(resultCnt == 1) {
					mailSendService.mailSendSearchPw(userId, user.getUserName(), userKey);
					
					result = "mailSendForPw";
				} else { // 인증키 업데이트 실패시
					
					result = "mailSendForPwFail";
				}
			} else {
				// 인증되지 않은 회원이면 인증부터 진행해달라고 요청해야함
				result = "userConfirm";
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
