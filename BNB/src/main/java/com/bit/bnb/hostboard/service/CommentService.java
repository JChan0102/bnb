package com.bit.bnb.hostboard.service;

import java.util.List;

import com.bit.bnb.hostboard.model.CommentVO;

	public interface CommentService {
	    // 댓글 개수
	    public int commentCount() throws Exception;
	 
	    // 댓글 목록
	    public List<CommentVO> commentList(CommentVO commentModel) throws Exception;
	 
	    // 댓글 작성
	    public int commentInsert(CommentVO commentModel) throws Exception;
	    
	    // 댓글 수정
	    public int commentUpdate(CommentVO commentModel) throws Exception;
	 
	    // 댓글 삭제
	    public int commentDelete(int cno) throws Exception;
	 
	}


	