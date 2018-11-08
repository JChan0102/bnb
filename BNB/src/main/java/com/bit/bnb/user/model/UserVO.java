package com.bit.bnb.user.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userPhoto;
	private int host;
	private int admin;
	private String userKey;
	private int userCheck;
	private int point;
	private int disabled;
	private Date birth;
	private String userInfo;
	private MultipartFile photoFile;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public int getHost() {
		return host;
	}

	public void setHost(int host) {
		this.host = host;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getUserKey() {
		return userKey;
	}

	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}

	public int getUserCheck() {
		return userCheck;
	}

	public void setUserCheck(int userCheck) {
		this.userCheck = userCheck;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getDisabled() {
		return disabled;
	}

	public void setDisabled(int disabled) {
		this.disabled = disabled;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}
	
	public MultipartFile getPhotoFile() {
		return photoFile;
	}

	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userPhoto=" + userPhoto
				+ ", host=" + host + ", admin=" + admin + ", userKey=" + userKey + ", userCheck=" + userCheck
				+ ", point=" + point + ", disabled=" + disabled + ", birth=" + birth + ", userInfo=" + userInfo
				+ ", photoFile=" + photoFile + "]";
	}
}
