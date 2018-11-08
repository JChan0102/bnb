package com.bit.bnb.reservation.dao;


import java.util.List;

import com.bit.bnb.reservation.model.ReservationInfo;

public interface ReservationDao {
	public List<ReservationInfo> getReservation() throws Exception;
	
}
