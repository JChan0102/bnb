package com.bit.bnb.report.dao;

import com.bit.bnb.report.model.ReportVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReportDao {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    private static String namespace="mappers.report.";

public void insert (ReportVO vo){

    sqlSessionTemplate.insert(namespace+"insert",vo);
}

public List<ReportVO> notckreportList (int firstRow){

    return sqlSessionTemplate.selectList(namespace+"notckreportList",firstRow);
}
public int totalCount(){
    return sqlSessionTemplate.selectOne(namespace+"totalCount");
}
}
