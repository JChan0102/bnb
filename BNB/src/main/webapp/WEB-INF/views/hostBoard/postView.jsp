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

<div class="container" style="margin-bottom:100px;">
	<h1>POST VIEW!</h1>
	<hr>
	<div class="table-responsive">
		<div style="height:40px; border-bottom:1px solid lightgrey;">
			<div style="float:left; margin-left:10px;"><h3>${post.title }</h3></div>
			<c:if test="${loginUser.userId eq post.userId }">
				<div style="float:right; margin-right:10px;"><a class="btn btn-outline-primary" role="button" onclick="return confirm('정말 삭제하시겠습니까?');" href="${pageContext.request.contextPath}/hostBoard/deletePost?postNo=${post.postNo}">삭제</a></div>
				<div style="float:right; margin-right:10px;"><a class="btn btn-outline-primary" role="button" href="${pageContext.request.contextPath}/hostBoard/modifyPost?postNo=${post.postNo}">수정</a></div>
			</c:if>
		
		</div>
		<div>
			<div style="float:left;">${post.nickName}</div>
			<div style="float:right;"><fmt:formatDate value="${post.date}" pattern="yyyy-MM-dd HH:mm" /></div>
		</div>
		

		<div style="padding:10px; margin-top:50px;">${post.content }</div>

		<hr>

		<div style="float:right; height: 50px; margin-right:10px;"><a class="btn btn-outline-primary" role="button" href="${pageContext.request.contextPath}/hostBoard">목록</a></div>

		<hr>
		<div> 
			<div style="border: 1px solid lightgrey"></div>
		</div>		
	</div>
</div>
</body>
</html>