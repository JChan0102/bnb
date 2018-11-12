package com.bit.bnb.host.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.host.dao.HostInterfaceDao;
import com.bit.bnb.host.model.HostModel;

@Service
public class HostWriteService {

	@Autowired
	private SqlSessionTemplate sessionTemplate; //스프링객체에 빈이 할당되어 주입 메소드 호출 위해 선언
 	
	private HostInterfaceDao hostInterfaceDao;// 인터페이스 dao선언
	
	public void hostWrite(HostModel hostModel) {
		
		hostInterfaceDao=sessionTemplate.getMapper(HostInterfaceDao.class);//쿼리문 선언(mybatis 사용시)
		//HostInterfaceDao의 sql문을 실행하기위해  
		
		hostInterfaceDao.inserthost(hostModel);
	}
}
