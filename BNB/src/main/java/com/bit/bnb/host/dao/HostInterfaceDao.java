package com.bit.bnb.host.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.bnb.host.model.HostModel;

@Repository
public interface HostInterfaceDao {
	
	public int inserthost(HostModel hostModel);
	
	public List <HostModel> selecthost();
	
	public HostModel selectViewLink (int bId);
	
	public void deleteLink (int bId);
	
	public void update(HostModel hostModel);
	
	

}
