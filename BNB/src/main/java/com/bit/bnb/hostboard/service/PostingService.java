package com.bit.bnb.hostboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.bnb.hostboard.dao.HostBoardDao;
import com.bit.bnb.hostboard.model.PostVO;

@Service
public class PostingService {

	@Autowired
	private HostBoardDao hostBoardDao;
	
	@Transactional
	public int write(PostVO postVO) {
		int resultCnt = hostBoardDao.insertPost(postVO);
		
		if(resultCnt == 1) {
			hostBoardDao.upPostTotalCount();
		}
		return resultCnt;
	}
	
}
