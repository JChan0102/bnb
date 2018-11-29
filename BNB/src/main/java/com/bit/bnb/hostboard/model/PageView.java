package com.bit.bnb.hostboard.model;

import java.util.List;

public class PageView {

	private int postTotalCount;
	private int currentPageNumber;
	private List<PostVO> postList;
	private int pageTotalCount;
	private int postCountPerPage;
	private int firstRow;

	public PageView(List<PostVO> postList, int postTotalCount, int currentPageNumber, int postCountPerPage,
			int firstRow) {
		this.postList = postList;
		this.postTotalCount = postTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.postCountPerPage = postCountPerPage;
		this.firstRow = firstRow;
		clacPageTotalCount();
	}

	private void clacPageTotalCount() {
		if (postTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = postTotalCount / postCountPerPage;
			if (postTotalCount % postCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getPostTotalCount() {
		return postTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<PostVO> getPostList() {
		return postList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getPostCountPerPage() {
		return postCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public boolean isEmpty() {
		return postTotalCount == 0;
	}

	@Override
	public String toString() {
		return "PageView [postTotalCount=" + postTotalCount + ", currentPageNumber=" + currentPageNumber + ", postList="
				+ postList + ", pageTotalCount=" + pageTotalCount + ", postCountPerPage=" + postCountPerPage
				+ ", firstRow=" + firstRow + "]";
	}
	
}
