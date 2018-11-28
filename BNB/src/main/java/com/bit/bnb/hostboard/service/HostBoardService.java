package com.bit.bnb.hostboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.hostboard.dao.HostBoardDao;
import com.bit.bnb.hostboard.model.PostVO;

@Service
public class HostBoardService {

	@Autowired
	private HostBoardDao hostBoardDao;
	
	public List<PostVO> getPostList(){
		List<PostVO> postList = new ArrayList<PostVO>();
		postList = hostBoardDao.selectPostList();
		return postList;
	}
	
}
