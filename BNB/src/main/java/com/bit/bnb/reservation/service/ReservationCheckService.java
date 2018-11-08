package com.bit.bnb.reservation.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.reservation.dao.ReservationDao;
import com.bit.bnb.reservation.model.ReservationInfo;


@Service
public class ReservationCheckService {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	ReservationDao dao;
	
	List<ReservationInfo> reservationInfo = null;
	
	public List<ReservationInfo> getDay() {
		dao = sqlSessionTemplate.getMapper(ReservationDao.class);
		
		try {
			reservationInfo = dao.getReservation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reservationInfo;
	}
}