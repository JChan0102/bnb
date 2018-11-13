package com.bit.bnb.user.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.bnb.user.dao.UserDao;
import com.bit.bnb.user.model.UserVO;

@Service
public class UserRegService {
	
	@Autowired
	private UserDao userDao;
	
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
					
				// 생년월일을 합쳐서 객체에 넣어줌
				String birth = userVO.getYear()+"-"+userVO.getMonth()+"-"+userVO.getDay();

				userVO.setBirth(birth);
				// 가입시도
				resultCnt = userDao.insertUser(userVO);

			// 아이디 중복이면 가입실패
			} else {
				resultCnt = 0;
			}
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
}
