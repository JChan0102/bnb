package com.bit.bnb.reservation.dao;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.bnb.reservation.model.ReservationInfo;

public interface ReservationDao {
	public List<ReservationInfo> getReservation(int roomsId) throws Exception;

	public int getDuration(@Param("checkInStr") String checkInStr, @Param("nowStr") String nowStr, @Param("roomsId") int roomsId) throws Exception;
	
}
