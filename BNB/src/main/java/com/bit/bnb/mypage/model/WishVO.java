package com.bit.bnb.mypage.model;

public class WishVO {

	private String userId; // 유저아이디
	private int roomsId; // 룸아이디
	private String address; // 주소
	private String hostId; // 호스트아이디
	private String details; // 룸 소개
	private int price_weekdays; // 평일가격
	private int price_weekend; // 주말가격

	public String getUserId() {
		return userId;
	}

	public int getRoomsId() {
		return roomsId;
	}

	public String getAddress() {
		return address;
	}

	public String getHostId() {
		return hostId;
	}

	public String getDetails() {
		return details;
	}

	public int getPrice_weekdays() {
		return price_weekdays;
	}

	public int getPrice_weekend() {
		return price_weekend;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setRoomsId(int roomsId) {
		this.roomsId = roomsId;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setHostId(String hostId) {
		this.hostId = hostId;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public void setPrice_weekdays(int price_weekdays) {
		this.price_weekdays = price_weekdays;
	}

	public void setPrice_weekend(int price_weekend) {
		this.price_weekend = price_weekend;
	}

	@Override
	public String toString() {
		return "WishVO [userId=" + userId + ", roomsId=" + roomsId + ", address=" + address + ", hostId=" + hostId
				+ ", details=" + details + ", price_weekdays=" + price_weekdays + ", price_weekend=" + price_weekend
				+ "]";
	}

}