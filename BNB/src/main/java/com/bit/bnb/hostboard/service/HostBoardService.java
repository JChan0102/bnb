package com.bit.bnb.hostboard.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.bnb.hostboard.dao.HostBoardDao;
import com.bit.bnb.hostboard.model.PageView;
import com.bit.bnb.hostboard.model.PostVO;

@Service
public class HostBoardService {

	@Autowired
	private HostBoardDao hostBoardDao;
	
	// 게시물 목록 가져오기
	@Transactional
	public PageView getPostList(int pageNumber){
		
		System.out.println("겟포스트리스트 서비스 진입");

		int postCountPerPage = 10;
		int currentPageNumber = pageNumber;
		int postTotalCount = hostBoardDao.getPostTotalCount();
		
		System.out.println("postTotalCount: "+postTotalCount);
		
		List<PostVO> postList = null;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int firstRow = 0;

		if(postTotalCount > 0) {
			firstRow = (pageNumber - 1) * postCountPerPage + 1;
			map.put("firstRow", firstRow);
			map.put("postCountPerPage", postCountPerPage);
			System.out.println("map: "+map);
			postList = hostBoardDao.getPostList(map);
			System.out.println("postList : "+ postList);
		}else {
			currentPageNumber = 0;
			postList = Collections.emptyList();
		}
		
		PageView pageView = new PageView(postList, postTotalCount, currentPageNumber, postCountPerPage, firstRow);
		System.out.println(pageView);
		return pageView;
	
	}
	
	// 전체 게시물 개수
	public int getPostTotalCount() {
		int totalCount = hostBoardDao.getPostTotalCount();
		return totalCount;
	}
	
	
}
