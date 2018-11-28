package com.bit.bnb.hostboard.model;

import java.util.Date;

public class PostVO {

	private int postNo;
	private String userId;
	private String title;
	private String content;
	private String date;
	private int viewCnt;

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "PostVO [postNo=" + postNo + ", userId=" + userId + ", title=" + title + ", content=" + content
				+ ", date=" + date + ", viewCnt=" + viewCnt + "]";
	}

}
