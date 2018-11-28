/*
package com.bit.bnb.hostboard.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bit.bnb.hostboard.dao.HostBoardDao;
import com.bit.bnb.hostboard.model.PostVO;

@Service
public class HostServiceImplX implements HostServiceX {

	//dao호출
	
	@Inject
	private HostBoardDao dao;
	
	@Override
	public void create(PostVO hostModel) throws Exception {
		dao.create(hostModel);
	}

	@Override
	public List<PostVO> listAll() throws Exception {
		System.out.println("서비스진입");
		List<PostVO> list = new ArrayList<PostVO>();
		list = dao.listAll();
		System.out.println("호스트서비스-리스트 : " + list);
		return dao.listAll();
		
	}

	@Override
	public PostVO read(int bId) throws Exception {
		return dao.read(bId);
	}

	@Override
	public void delete(int bId) throws Exception {
		dao.delete(bId);

	}

	@Override
	public void update(PostVO hostModel) throws Exception {
		dao.update(hostModel);

	
	}

	@Override
	public PostVO getContentbId(int bId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
*/