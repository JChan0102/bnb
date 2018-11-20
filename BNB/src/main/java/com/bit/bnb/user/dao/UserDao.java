package com.bit.bnb.user.dao;

import java.util.HashMap;
import java.util.List;

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
	
	public int updateUserKey(String userId) {
		return sqlSessionTemplate.update(userMapperPath+".updateUserKey", userId);
	}
	
	public int updateUserKeySearchPw(HashMap<String, String> map) {
		return sqlSessionTemplate.update(userMapperPath+".updateUserKeySearchPw", map);
	}
	
	public int updateUserPw(HashMap<String, String> map) {
		return sqlSessionTemplate.update(userMapperPath+".updateUserPw", map);
	}

}
