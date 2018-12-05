package com.bit.bnb.hostboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.bnb.hostboard.model.CommentVO;

@Repository
public class CommentDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String commentMapper = "mappers.CommentMapper";
	
	public int insertComment(CommentVO comment) {
		return sqlSessionTemplate.insert(commentMapper+".insertComment", comment);
	}
	
	public List<CommentVO> getCommentList(int postNo) {
		return sqlSessionTemplate.selectList(commentMapper+".getCommentList", postNo);
	}
	
	public int modifyComment(CommentVO comment) {
		return sqlSessionTemplate.update(commentMapper+".modifyComment", comment);
	}
	
	public int deleteComment(int commentNo) {
		return sqlSessionTemplate.delete(commentMapper+".deleteComment", commentNo);
	}
	
	
}
