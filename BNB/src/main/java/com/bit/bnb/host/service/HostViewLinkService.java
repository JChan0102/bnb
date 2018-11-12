package com.bit.bnb.host.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.host.dao.HostInterfaceDao;
import com.bit.bnb.host.model.HostModel;
@Service
public class HostViewLinkService {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private HostInterfaceDao hostInterfaceDao;
	
	public HostModel hostList(int bId) {
		
		hostInterfaceDao = sessionTemplate.getMapper(HostInterfaceDao.class);
		HostModel hostModel = hostInterfaceDao.selectViewLink(bId);
		
		return hostModel;
		
	}
	
}
