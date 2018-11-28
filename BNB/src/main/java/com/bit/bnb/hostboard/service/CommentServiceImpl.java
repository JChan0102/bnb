package com.bit.bnb.hostboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.hostboard.dao.CommentDaoImpl;
import com.bit.bnb.hostboard.model.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDaoImpl dao;
	
	    

		@Override
		public int commentCount() throws Exception {
			return 0;
		}

		@Override
		public List<CommentVO> commentList(CommentVO commentModel) throws Exception {
			return dao.commentList(commentModel);
		}

		@Override
		public int commentInsert(CommentVO commentModel) throws Exception {
			System.out.println("서비스" + commentModel);
			return dao.commentInsert(commentModel);
		}

		@Override
		public int commentUpdate(CommentVO commentModel) throws Exception {
			return dao.commentUpdate(commentModel);
		}

		@Override
		public int commentDelete(int cno) throws Exception {
			return dao.commentDelete(cno);
		}

	

	}


	