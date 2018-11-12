package com.bit.bnb.host.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.host.dao.HostInterfaceDao;
import com.bit.bnb.host.model.HostModel;

@Service
public class HostListService {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private HostInterfaceDao hostInterfaceDao;
	
	public List<HostModel> hostList(){
		
		hostInterfaceDao = sessionTemplate.getMapper(HostInterfaceDao.class);
		
		List<HostModel>list = hostInterfaceDao.selecthost();
		
		return list;
	}

}
