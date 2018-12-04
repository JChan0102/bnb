<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물보기</title>
</head>
<body>
<%@ include file="/resources/common/includeHead.jsp"%>
<%@ include file="/resources/common/Navbar.jsp"%>

<div class="container">
	<h1>POST VIEW!</h1>
	<hr>
	<div class="table-responsive">
		<div style="height:40px; border-bottom:1px solid lightgrey;">
			<div style="float:left; margin-left:10px;"><h3>${post.title }</h3></div>
			<div style="float:right; margin-right:10px;"><a class="btn btn-primary" role="button" onclick="return confirm('정말 삭제하시겠습니까?');" href="${pageContext.request.contextPath}/hostBoard/deletePost?postNo=${post.postNo}">삭제</a></div>
			<%-- <h3 style="float:left;">${post.title}</h3>
			<button style="float:right;">삭제</button> --%>
		</div>
		<div>
			<div style="float:left;">${post.nickName}</div>
			<div style="float:right;"><fmt:formatDate value="${post.date}" pattern="yyyy-MM-dd HH:mm" /></div>
		</div>
		
		<div style="padding:10px; margin-top:50px;">${post.content }</div>
		<div> 
			<div style="border: 1px solid lightgrey"></div>
		</div>		
	</div>
</div>
</body>
</html>