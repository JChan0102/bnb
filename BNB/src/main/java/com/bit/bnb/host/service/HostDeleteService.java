package com.bit.bnb.host.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.host.dao.HostInterfaceDao;

@Service
public class HostDeleteService {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private HostInterfaceDao hostInterfaceDao;
	
	public void deleteLink(int bId) {
		
		hostInterfaceDao = sessionTemplate.getMapper(HostInterfaceDao.class);
		hostInterfaceDao.deleteLink(bId);
		
	}
	
}    
