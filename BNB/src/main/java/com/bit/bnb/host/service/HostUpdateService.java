package com.bit.bnb.host.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.host.dao.HostInterfaceDao;
import com.bit.bnb.host.model.HostModel;

@Service
public class HostUpdateService {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private HostInterfaceDao hostInterfaceDao; 
	
	public HostModel updateLink(int bId) {
		
		hostInterfaceDao = sessionTemplate.getMapper(HostInterfaceDao.class);
		
		return hostInterfaceDao.selectViewLink(bId);
	}

	
	public void updateLink2(HostModel updateBoard2) {
		
		hostInterfaceDao = sessionTemplate.getMapper(HostInterfaceDao.class);
		hostInterfaceDao.update(updateBoard2);
		
	}
}
