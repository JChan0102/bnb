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
<table class="table table-hover text-center"> 
	<thead>
	<tr class="row" style="margin-right:0px;">
		<th class="col-1" >번호</th>
		<th class="col-2">작성자</th>
		<th class="col-6">제목</th>
		<th class="col-2">작성일</th>
		<th class="col-1">조회수</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="post" items="${postListData.postList}">
		<tr class="row" style="margin-right:0px;">
			<td class="col-1">${post.postNo}</td>
			<td class="col-2">${post.nickName}</td>
			<td class="col-6">${post.title}</td>
			<td class="col-2"><fmt:formatDate value="${post.date}" pattern="yyyy-MM-dd hh:mm" /></td>
			<td class="col-1">${post.viewCnt}</td>
		</tr>  
	</c:forEach>
	</tbody>
</table>
<hr/>

<a class="btn btn-secondary" href="${pageContext.request.contextPath}/hostBoard/write" role="button">글쓰기</a>

<div class="text-center">
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="hostBoard?page=1">&lt;&lt;</a></li>
		<li class="page-item"><a class="page-link" href="hostBoard?page=${postListData.currentPageNumber-1}">이전</a></li>
			<c:forEach var="num" begin="1" end="${postListData.pageTotalCount}">
				<li class="page-item"><a class="page-link" href="hostBoard?page=${num}">${num}</a></li>
			</c:forEach>
	    <li class="page-item"><a class="page-link" href="hostBoard?page=${postListData.currentPageNumber+1}">다음</a></li>
	    <li class="page-item"><a class="page-link" href="hostBoard?page=${postListData.pageTotalCount}">&gt;&gt;</a></li>
	</ul>
</div>
</div>
</div>
</body>
</html>