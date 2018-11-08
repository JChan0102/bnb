package com.bit.bnb.mypage.dao;

import java.util.List;

import com.bit.bnb.mypage.model.ReviewVO;

public interface ReviewDao {
	
	public List<ReviewVO> reviewToList(); // 내가쓴 리뷰 리스트
	public List<ReviewVO> reviewWrite(); // 써야할 리스트 찾아줌

}
