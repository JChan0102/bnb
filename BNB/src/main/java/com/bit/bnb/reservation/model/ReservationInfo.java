package com.bit.bnb.reservation.model;

public class ReservationInfo {
	private int reservationNum;
	private String hostId;
	private String userId;
	private String checkIn;
	private String checkOut;
	private int roomsId;
	private int price;
	private int people;
	private int payCheck;
	public int getReservationNum() {
		return reservationNum;
	}
	public void setReservationNum(int reservationNum) {
		this.reservationNum = reservationNum;
	}
	public String getHostId() {
		return hostId;
	}
	public void setHostId(String hostId) {
		this.hostId = hostId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public int getRoomsId() {
		return roomsId;
	}
	public void setRoomsId(int roomsId) {
		this.roomsId = roomsId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getPayCheck() {
		return payCheck;
	}
	public void setPayCheck(int payCheck) {
		this.payCheck = payCheck;
	}
	@Override
	public String toString() {
		return "ReservationInfo [reservationNum=" + reservationNum + ", hostId=" + hostId + ", userId=" + userId
				+ ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", roomsId=" + roomsId + ", price=" + price
				+ ", people=" + people + ", payCheck=" + payCheck + "]";
	}
	
	
	
}
