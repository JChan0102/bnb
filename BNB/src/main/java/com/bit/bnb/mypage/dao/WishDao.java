package com.bit.bnb.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.bnb.mypage.model.WishVO;

public interface WishDao {
	
	public int wishInsert(String userId, int roomsId); // 즐겨찾기 넣어주기
	public List<WishVO> wishList(@Param("userId") String userId, @Param("address") String address); // 즐겨찾기 목록
	public int wishDelete(String userId, int roomsId); // 즐겨찾기 삭제
	public List<WishVO> wishDivList(String userId); // div생성용 즐겨찾기 목록
	public int wishDivCnt(@Param("userId") String userId, @Param("address") String address); // 지역별 몇개있는지!

}
