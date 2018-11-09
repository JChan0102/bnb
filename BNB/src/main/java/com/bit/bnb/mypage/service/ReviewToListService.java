package com.bit.bnb.mypage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.mypage.dao.ReviewDao;
import com.bit.bnb.mypage.model.ReviewVO;

@Service
public class ReviewToListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private ReviewDao reviewDao;

	public List<ReviewVO> reviewToListView() {
		
		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		return reviewDao.reviewToList();
	}
	
	public List<ReviewVO> reviewWriteList(String userId) {
		
		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		return reviewDao.reviewWriteList(userId);
	}

}
