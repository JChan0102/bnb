package com.bit.bnb.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.bnb.user.model.UserVO;

public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String userMapperPath = "mappers.UserMapper";
	
	public int insertUser(UserVO userVO) {
		return sqlSessionTemplate.update(userMapperPath+".insertUser", userVO);
	}
	
	public UserVO selectUser(String userId) {
		return sqlSessionTemplate.selectOne(userMapperPath+".selectUser", userId);
	}

}
