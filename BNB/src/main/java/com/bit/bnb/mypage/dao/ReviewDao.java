package com.bit.bnb.mypage.dao;

import java.util.List;

import com.bit.bnb.mypage.model.ReviewVO;

public interface ReviewDao {
	
	public List<ReviewVO> reviewToList(String userId); // 내가쓴 리뷰 리스트
	public List<ReviewVO> reviewWriteList(String userId); // 써야할 리스트 찾아줌
	public ReviewVO reviewPick(int reservationNum); // 수정해야할 리뷰 찾기
	public int reviewWrite(ReviewVO review); // 후기쓰기
	public int reviewDelete(int reservationNum); // 삭제하기
	public int reviewEdit(ReviewVO review); // 리뷰 수정

}
