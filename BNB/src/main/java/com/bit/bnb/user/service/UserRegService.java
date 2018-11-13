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
			
			System.out.println(dir);
			System.out.println(imgName);
		}
		
		String birth = userVO.getYear()+"-"+userVO.getMonth()+"-"+userVO.getDay();
		
		if(userVO.getUserId() != null && userVO.getUserPw() != null && 
		   userVO.getUserName() != null) {
			
			if(userVO.getYear().length() == 4 && 
			   0<userVO.getDay().length() && userVO.getDay().length()<3 && 
			   0<userVO.getMonth().length() && userVO.getMonth().length()<3) {
					
				userVO.setBirth(birth);
				resultCnt = userDao.insertUser(userVO);
			}
			
		} else {
			resultCnt = 0;
		}
		return resultCnt;
	}
	
	
	public String getUserIdChk(String userId) {
		UserVO user = new UserVO();
		user = userDao.selectUser(userId);
		
		String userIdChk = "no";
		
		if(user == null) {
			userIdChk = "yes";
		}
		
		return userIdChk;
	}
}
