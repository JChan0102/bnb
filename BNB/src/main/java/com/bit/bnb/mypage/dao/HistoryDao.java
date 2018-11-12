package com.bit.bnb.mypage.dao;

import java.util.List;

import com.bit.bnb.mypage.model.HistoryVO;

public interface HistoryDao {
	
	public List<HistoryVO> historyList(String userId);

}
