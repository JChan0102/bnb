package com.bit.bnb.text.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.text.dao.TextDetectionDao;
import com.bit.bnb.user.model.UserVO;

@Service
public class TextDetectionService {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	TextDetectionDao dao;
	UserVO user = null;
	
	public UserVO textDetection() {
		dao = sqlSessionTemplate.getMapper(TextDetectionDao.class);
		
		return user;
	}
}
