<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/common/includeHead.jsp"%>

<h1>공지사항</h1>

<table width="100%"
	style="border-top: 2px solid #547980; border-bottom: 2px solid #547980;">
	<tr>
		<th width="80">번호</th>
		<td>${viewLink.bId}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${viewLink.bUserId}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${viewLink.bTitle}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${viewLink.bContent}</td>
	</tr>
</table>
<br>
<a href="${pageContext.request.contextPath}/host"><button
		type="button" class="btn btn-dark">목록보기</button></a>
&nbsp;&nbsp;
<a
	href="${pageContext.request.contextPath}/host/update?bId=${viewLink.bId}"><button
		type="button" class="btn btn-dark">수정</button></a>
&nbsp;&nbsp;
<a
	href="${pageContext.request.contextPath}/host/delete?bId=${viewLink.bId}"><button
		type="button" class="btn btn-dark">삭제</button></a>
