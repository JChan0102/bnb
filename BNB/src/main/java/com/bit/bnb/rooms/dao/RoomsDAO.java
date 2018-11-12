package com.bit.bnb.rooms.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.bnb.mypage.model.ReviewVO;
import com.bit.bnb.rooms.model.AmenitiesVO;
import com.bit.bnb.rooms.model.ReviewSummaryVO;
import com.bit.bnb.rooms.model.RoomsVO;

@Repository
public class RoomsDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private String mapperPath = "mappers.RoomsMapper.";

	public int insertRooms(RoomsVO rv) {
		return sqlSessionTemplate.update(mapperPath + "insertRooms", rv);
	}

//	public List<RoomsVO> selectRooms(RoomsVO rv) {
//		return sqlSessionTemplate.selectList(mapperPath + "selectRooms", rv);
//	}

	public int updateRooms(RoomsVO rv) {
		return sqlSessionTemplate.update(mapperPath + "updateRooms", rv);
	}

	public int deleteRooms(RoomsVO rv) {
		return sqlSessionTemplate.delete(mapperPath + "deleteRooms", rv);
	}

	public List<AmenitiesVO> selectAmenities(AmenitiesVO av) {
		return sqlSessionTemplate.selectList(mapperPath + "selectAmenities", av);
	}

	// 페이징 테스트
	public List<RoomsVO> selectRoomsList(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(mapperPath + "selectRoomsList", map);
	}

	public int totalCount(String tableName) {
		return sqlSessionTemplate.selectOne(mapperPath + "totalCount", tableName);
	}

	public List<ReviewVO> selectRoomsReview(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(mapperPath + "selectRoomsReview", map);
	}

	public List<ReviewSummaryVO> selectRoomsReviewSummary() {
		return sqlSessionTemplate.selectList(mapperPath + "selectRoomsReviewSummary");
	}
}
