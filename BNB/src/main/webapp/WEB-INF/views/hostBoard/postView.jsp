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
		<div style="padding-left:10px; border-bottom:1px solid lightgrey;"><h3>${post.title}</h3></div>
		<div>
			<div style="float:left; padding:10px;">${post.nickName}</div>
			<div style="float:right; padding:10px;">${post.date}</div>
		</div>
		
		<div style="padding:10px; margin-top:50px;">${post.content }</div>		
	</div>
</div>
</body>
</html>