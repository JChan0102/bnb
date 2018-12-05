package com.bit.bnb.hostboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.bnb.hostboard.dao.CommentDao;
import com.bit.bnb.hostboard.model.CommentVO;

@Service
public class CommentService {

	@Autowired
	private CommentDao commentDao;
	
	//댓글작성
	@Transactional
	public int writeComment(CommentVO comment) {
		return commentDao.insertComment(comment);
	}
	
	// 해당 포스트의 댓글 리스트 불러오기
	@Transactional
	public List<CommentVO> getCommentList(int postNo){
		return commentDao.getCommentList(postNo);
	}
	
	// 코멘트 삭제
	@Transactional
	public int deleteComment(int commentNo) {
		return commentDao.deleteComment(commentNo);
	}
	
}
