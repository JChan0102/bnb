package com.bit.bnb.hostboard.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.bnb.hostboard.model.ModifyVO;
import com.bit.bnb.hostboard.model.PostVO;

@Repository
public class HostBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private String hostBoardMapper = "mappers.HostBoardMapper";
	
	public int insertPost(PostVO postVO) {
		return sqlSessionTemplate.update(hostBoardMapper+".insertPost", postVO);
	}
	
	public PostVO selectPost(int postNo) {
		return sqlSessionTemplate.selectOne(hostBoardMapper+".selectPost", postNo);
	}
	
	public List<PostVO> selectPostList(){
		return sqlSessionTemplate.selectList(hostBoardMapper+".selectPostList");
	}
	
	public List<PostVO> getPostList(HashMap<String, Integer> map){
		return sqlSessionTemplate.selectList(hostBoardMapper+".getPostList", map);
	}
	
	public int getPostTotalCount() {
		return sqlSessionTemplate.selectOne(hostBoardMapper+".getPostTotalCount");
	}
	
	public void upPostTotalCount() {
		sqlSessionTemplate.selectOne(hostBoardMapper+".upPostTotalCount");
	}
	
	public void downPostTotalCount() {
		sqlSessionTemplate.selectOne(hostBoardMapper+".downPostTotalCount");
	}
	
	public int deletePost(int postNo) {
		return sqlSessionTemplate.delete(hostBoardMapper+".deletePost", postNo);
	}
	
	public int modifyPost(ModifyVO modifyVO) {
		return sqlSessionTemplate.update(hostBoardMapper+".modifyPost", modifyVO);
	}
	
	/*public void create(PostVO hostModel) throws Exception;
	
	public List<PostVO> listAll() throws Exception;
	
	public PostVO read(int bId) throws Exception;
	
	public void delete(int bId)throws Exception;
	
	public void update(PostVO hostModel)throws Exception;*/

}
