package com.bit.bnb.rooms.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.bnb.rooms.model.RoomsVO;

@Repository
public class RoomsDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private String mapperPath = "mappers.RoomsMapper.";

	public int insertRooms(RoomsVO rv) {
		return sqlSessionTemplate.update(mapperPath + "insertRooms", rv);
	}

	public List<RoomsVO> selectRooms(RoomsVO rv) {
		return sqlSessionTemplate.selectList(mapperPath + "selectRooms", rv);
	}

	public int updateRooms(RoomsVO rv) {
		return sqlSessionTemplate.update(mapperPath + "updateRooms", rv);
	}

	public int deleteRooms(RoomsVO rv) {
		return sqlSessionTemplate.delete(mapperPath + "deleteRooms", rv);
	}

}
