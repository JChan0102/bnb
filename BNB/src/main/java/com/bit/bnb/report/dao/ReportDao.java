package com.bit.bnb.report.dao;

import com.bit.bnb.report.model.ReportVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDao {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    private static String namespace="mappers.report.";

public void insert (ReportVO vo){

    sqlSessionTemplate.insert(namespace+"insert",vo);
}


}
