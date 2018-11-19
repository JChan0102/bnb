package com.bit.bnb.mypage.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.bnb.mypage.dao.MypageUserDao;
import com.bit.bnb.mypage.model.MemberVO;

@Service
public class ProfileEditService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MypageUserDao mypageUserDao;
	
	public int myUserUpdate(MemberVO member, HttpServletRequest request) throws IllegalStateException, IOException {
		
		mypageUserDao = sqlSessionTemplate.getMapper(MypageUserDao.class);
		/*
		String uploadUri = "/resources/images/userphoto";

		// uploadUri 경로의 시스템 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);

		// DB 저장용 파일 이름, 물리적 저장할때의 이름
		String imgName = "";

		if (!member.getUserPhotoFile().isEmpty()) {

			imgName = member.getUserId()+"_" + member.getUserPhotoFile().getOriginalFilename();

			// 물리적 저장
			member.getUserPhotoFile().transferTo(new File(dir, imgName));

			// DB 에 저장할 이름 SET
			member.setUserPhoto(imgName);
		} else {
			imgName = request.getParameter("before");
			member.setUserPhoto(imgName);
		}*/
		System.out.println(member.getUserPhoto().equals(""));
		if(member.getUserPhoto().equals("")){
			member.setUserPhoto(request.getParameter("before"));
		}
		System.out.println(member.toString());
		return mypageUserDao.userUpdate(member);
	}
	
	public MemberVO myUserPick(String userId) {
		
		mypageUserDao = sqlSessionTemplate.getMapper(MypageUserDao.class);
		
		return mypageUserDao.userPick(userId);
	}

}
