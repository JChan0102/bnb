package com.bit.bnb.mypage.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.mypage.dao.MypageUserDao;
import com.bit.bnb.user.model.UserVO;

@Service
public class MypageMainService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MypageUserDao mypageUserDao;
	
	public UserVO mypageView(String userId) {
		
		mypageUserDao = sqlSessionTemplate.getMapper(MypageUserDao.class);
		
		return mypageUserDao.userPick(userId);
	}

}
