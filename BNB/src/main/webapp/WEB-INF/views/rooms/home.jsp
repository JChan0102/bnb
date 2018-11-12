<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body>

	<%@ include file="/resources/common/Navbar.jsp"%>
	<!-- Begin page content -->

	<main role="main" class="container">
	<h1>방리스트</h1>
	<form method="post">
		<input type="text" id="avail_adults" name="avail_adults"
			class="form-control"><input type="submit"
			class="btn btn-danger" value="검색">
	</form>
	<c:if test="${1 eq loginUser.host}">
		<a href="${pageContext.request.contextPath}/rooms/registerRooms"><button
				class="btn btn-danger">방입력</button></a>
	</c:if> <br>

	<div class="row">
		<c:forEach items="${rooms}" var="item" varStatus="status">
			<div class="col-md-4">
				<div class="card mb-4 box-shadow">
					<img class="card-img-top">
					<div class="card-body">
						<p class="card-text">
							${item.roomsId}번/${item.hostId}<br>${item.address}<br>
							<fmt:formatNumber value="${item.price_weekdays}"
								pattern="\###,###,###" />
							-
							<fmt:formatNumber value="${item.price_weekend}"
								pattern="\###,###,###" />
							/박<br>
						</p>
						<div class="d-flex justify-content-between align-items-center">
							<small class="text-muted"> <c:forEach
									items="${reviewSummary}" var="reviewSummary">
									<c:if test="${item.roomsId eq reviewSummary.roomsId}">
										<c:forEach begin="1" end="${reviewSummary.avgScope}" step="1">★</c:forEach>
										<fmt:formatNumber value="${reviewSummary.avgScope}"
											pattern="0.0" />
										(${reviewSummary.reviewCount})
								</c:if>
								</c:forEach>
							</small>
							<div class="btn-group">
								<a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${item.roomsId}"><button
										type="button" class="btn btn-sm btn-outline-secondary ml-1">View</button></a>
								<c:if test="${item.hostId eq loginUser.userId}">
									<a
										href="${pageContext.request.contextPath}/rooms/modifyRooms?roomsId=${item.roomsId}&_hostId=${item.hostId}"><button
											type="button" class="btn btn-sm btn-outline-secondary ml-1">Edit</button></a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link"
				href="${pageContext.request.contextPath}/rooms?page=${paging.prevPageNo}">Previous</a></li>
			<c:set var="pageIdx" value="${paging.startPageNo}" />
			<c:forEach varStatus="status" begin="${paging.startPageNo}"
				end="${paging.endPageNo}" step="1">
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/rooms?page=${pageIdx}">${pageIdx}</a></li>
				<c:set var="pageIdx" value="${pageIdx+1}" />
			</c:forEach>
			<li class="page-item"><a class="page-link"
				href="${pageContext.request.contextPath}/rooms?page=${paging.nextPageNo}">Next</a></li>
		</ul>
	</nav>
	</main>
</body>
</html>