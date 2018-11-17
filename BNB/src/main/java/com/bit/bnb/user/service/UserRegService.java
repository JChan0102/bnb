package com.bit.bnb.user.service;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.bnb.user.dao.UserDao;
import com.bit.bnb.user.model.UserVO;

@Service
public class UserRegService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private EncryptSha256Service sha256Service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	private UserVO user;
	
	@Transactional
	public int userReg(UserVO userVO, HttpServletRequest request) throws IllegalStateException, IOException {
		
		int resultCnt = 0;

		// DB 저장용 파일 이름, 물리적 저장할때의 이름
		String imgName = "";
				
		// 물리적 저장 경로
		String uploadUri = "/resources/images/userphoto";
				
		// uploadUri 경로의 시스템 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
				
		if(!userVO.getPhotoFile().isEmpty()) {
				
			imgName = userVO.getUserId()+"_"+userVO.getPhotoFile().getOriginalFilename();
					
			// 물리적 저장
			userVO.getPhotoFile().transferTo(new File(dir, imgName));
					
			// DB에 저정할 이름 SET
			userVO.setUserPhoto(imgName);
			
			// System.out.println(dir);
			// System.out.println(imgName);
		}
		
		// 빠짐없이 가입항목을 다 입력했는지 확인
		if(userVO.getUserId() != null && userVO.getUserPw() != null && 
		   userVO.getUserName() != null && userVO.getYear() != null && 
		   userVO.getMonth() !=null &&  userVO.getDay() != null) {
			
			// 아이디 중복검사
			user = userDao.selectUser(userVO.getUserId());
			
			// 아이디 중복이 아니면 가입시도
			if(user == null) {
				
				// 비밀번호 암호화해서 다시 넣어준다
				String ePw = sha256Service.encrypt(userVO.getUserPw());
				userVO.setUserPw(ePw);
			
				// 생년월일을 합쳐서 객체에 넣어줌
				String birth = userVO.getYear()+"-"+userVO.getMonth()+"-"+userVO.getDay();
				userVO.setBirth(birth);
				
				// 메일인증을 위한 인증키 생성하기
				Random random = new Random(System.currentTimeMillis());
				StringBuffer keyBuffer = new StringBuffer();
				
				// 20자리의 난수를 발생한다
				for(int i=0; i<20; i++) {
					if(random.nextBoolean()) {
						keyBuffer.append((char)((int)(random.nextInt(26))+97));
					}else {
						keyBuffer.append((random.nextInt(10)));
					}
				}
				
				String userKey = keyBuffer.toString();
				
				System.out.println("userKey : " + userKey);
				
				userVO.setUserKey(userKey);
				
				// 인서트 시도
				resultCnt = userDao.insertUser(userVO);
				
				mailSendWithUserKey(userVO.getUserId(), userVO.getUserName(), userVO.getUserKey());
				
			// 아이디 중복이면 가입실패
			} else {
				resultCnt = 0;
			}
		// 입력시 빠진 항목이 있으면 가입실패
		} else {
			resultCnt = 0;
		}
		return resultCnt;
	}
	
	
	@Transactional
	public String getUserIdChk(String userId) {
		user = userDao.selectUser(userId);
		
		String userIdChk = "n";
		
		if(user == null) {
			userIdChk = "y";
		}
		
		return userIdChk;
	}
	

	
	// 이메일 계정 인증메일 보내기 메서드
	@Transactional
	public void mailSendWithUserKey(String email, String name, String userKey) {
		
		MimeMessage mail = mailSender.createMimeMessage();
		
		String htmlStr = "<h2>안녕하세요, " + name + "님!<h2>"
					   + "이메일 계정을 인증받으시려면 아래의 링크를 클릭해주세요!"
					   + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다) <br><br>"
					   + "<a href=\"http://localhost/bnb/userKeyConfirm?"
					   + "userId=" + email + "&userKey=" + userKey + "\">BITBNB 가기</a>";
		
		try {
			mail.setSubject("[본인인증] BITBNB 회원가입 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
	// 메일 확인된 유저 인증 서비스
	@Transactional
	public int userConfirm(String userId, String userKey) {
		
		int result = 0;
		UserVO user = new UserVO();
		
		user = userDao.selectUser(userId);
		
		if(user != null && user.getUserKey().equals(userKey)) {
				// 인증키 업데이트 쿼리
				result = userDao.updateUserKey(userId);
		}
		
		return result;
	}
	
	
	
	@Transactional
	public int googleReg(UserVO userVO, HttpServletRequest request) throws IllegalStateException, IOException {
		int resultCnt = 0;

		// DB 저장용 파일 이름, 물리적 저장할때의 이름
		String imgName = "";
				
		// 물리적 저장 경로
		String uploadUri = "/resources/images/userphoto";
				
		// uploadUri 경로의 시스템 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
				
		if(!userVO.getPhotoFile().isEmpty()) {
				
			imgName = userVO.getUserId()+"_"+userVO.getPhotoFile().getOriginalFilename();
					
			// 물리적 저장
			userVO.getPhotoFile().transferTo(new File(dir, imgName));
					
			// DB에 저정할 이름 SET
			userVO.setUserPhoto(imgName);
			
			// System.out.println(dir);
			// System.out.println(imgName);
		}
		
		// 빠짐없이 가입항목을 다 입력했는지 확인
		if(userVO.getUserId() != null && userVO.getUserPw() != null && 
		   userVO.getUserName() != null && userVO.getYear() != null && 
		   userVO.getMonth() !=null &&  userVO.getDay() != null) {
			
			// 아이디 중복검사
			user = userDao.selectUser(userVO.getUserId());
			
			// 아이디 중복이 아니면 가입시도
			if(user == null) {
				
				// 비밀번호 암호화해서 다시 넣어준다
				String ePw = sha256Service.encrypt(userVO.getUserPw());
				userVO.setUserPw(ePw);
			
				// 생년월일을 합쳐서 객체에 넣어줌
				String birth = userVO.getYear()+"-"+userVO.getMonth()+"-"+userVO.getDay();
				userVO.setBirth(birth);

				// 구글 계정이므로 유저키에는 g를 삽입한다
				userVO.setUserKey("g");
				
				// 인서트 시도
				resultCnt = userDao.insertUser(userVO);
				
			// 아이디 중복이면 가입실패
			} else {
				resultCnt = 0;
			}
		// 입력시 빠진 항목이 있으면 가입실패
		} else {
			resultCnt = 0;
		}
		return resultCnt;
	}
	
}
