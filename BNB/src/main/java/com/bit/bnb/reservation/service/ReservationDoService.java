package com.bit.bnb.reservation.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.bnb.reservation.dao.ReservationDao;
import com.bit.bnb.reservation.model.ReservationInfo;


@Service
public class ReservationDoService {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	ReservationDao dao;
	
	List<ReservationInfo> reservationInfo = null;
	
	@Transactional
	public List<ReservationInfo> reservationDo() {
		dao = sqlSessionTemplate.getMapper(ReservationDao.class);

		return reservationInfo;
	}
}