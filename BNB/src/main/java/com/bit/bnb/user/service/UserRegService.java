package com.bit.bnb.user.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.bnb.user.dao.UserDao;
import com.bit.bnb.user.model.UserVO;

@Service
public class UserRegService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private UserDao userDao;
	
	@Transactional
	public int userReg(UserVO userVO, HttpServletRequest request) throws IllegalStateException, IOException {
		
		int resultCnt = 0;

		// DB 저장용 파일 이름, 물리적 저장할때의 이름
		String imgName = "";
				
		// 물리적 저장 경로
		String uploadUri = "/uploadfile/userphoto";
				
		// uploadUri 경로의 시스템 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
				
		if(!userVO.getPhotoFile().isEmpty()) {
				
			imgName = userVO.getUserId()+"_"+userVO.getPhotoFile().getOriginalFilename();
					
			// 물리적 저장
			userVO.getPhotoFile().transferTo(new File(dir, imgName));
					
			// DB에 저정할 이름 SET
			userVO.setUserPhoto(imgName);
		}
		
		resultCnt = userDao.insertUser(userVO);
		
		return resultCnt;
	}
}
