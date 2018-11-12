package com.bit.bnb.mypage.dao;

import javax.servlet.http.HttpServletRequest;

import com.bit.bnb.mypage.model.MemberVO;

public interface MypageUserDao {
	
	public int userUpdate(MemberVO member, HttpServletRequest request); // 유저정보 수정
	public MemberVO userPick(String userId); // 유저찾기
	public int userDelete(String userId);

}
