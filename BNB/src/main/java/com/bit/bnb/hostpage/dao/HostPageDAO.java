package com.bit.bnb.hostpage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HostPageDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    private static String namespace="mappers.chatMapper.";


}
