package com.bit.bnb.mypage.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class memberVO {

	private String userId; // 유저아이디
	private String userPassword; // 유저비밀번호
	private String userName; // 유저이름
	private String userPhoto; // DB에 저장될 사진 이름
	private MultipartFile userPhotoFile; // 실제파일
	private int host; // 호스트여부
	private int admin; // 관리자 여부
	private int userCheck; // 본인확인여부
	private int point; // 정산금액
	private Date birth; // 생일
	private String userInfo; // 자기소개

	public String getUserId() {
		return userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public MultipartFile getUserPhotoFile() {
		return userPhotoFile;
	}

	public int getHost() {
		return host;
	}

	public int getAdmin() {
		return admin;
	}

	public int getUserCheck() {
		return userCheck;
	}

	public int getPoint() {
		return point;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public void setUserPhotoFile(MultipartFile userPhotoFile) {
		this.userPhotoFile = userPhotoFile;
	}

	public void setHost(int host) {
		this.host = host;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public void setUserCheck(int userCheck) {
		this.userCheck = userCheck;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getBirth() {
		return birth;
	}

	public String getUserInfo() {
		return userInfo;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String toString() {
		return "member [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName + ", userPhoto="
				+ userPhoto + ", userPhotoFile=" + userPhotoFile + ", host=" + host + ", admin=" + admin
				+ ", userCheck=" + userCheck + ", point=" + point + ", birth=" + birth + ", userInfo=" + userInfo + "]";
	}


}
