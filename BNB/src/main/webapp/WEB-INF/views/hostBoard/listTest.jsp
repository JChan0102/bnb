<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<%@ include file="/resources/common/includeHead.jsp"%>
<%@ include file="/resources/common/Navbar.jsp"%>


<div class="container">
<h2>HOST BOARD</h2>
<div class="table-responsive">
<table class="table table-hover">
	<thead>
	<tr>
		<th>번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성시간</th>
		<th>조회수</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="post" items="${postList}">
		<tr>
			<td>${post.postNo}</td>
			<td>${post.userId}</td>
			<td>${post.title}</td>
			<td>${post.date}</td>
			<td>${post.viewCnt}</td>
		</tr>  
	</c:forEach>
	</tbody>
</table>
<hr/>

<a class="btn btn-default" href="${pageContext.request.contextPath}/hostBoard/write" role="button">글쓰기</a>

<div class="text-center">
	<ul class="pagination">
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
	</ul>
</div>
</div>
</div>
</body>
</html>