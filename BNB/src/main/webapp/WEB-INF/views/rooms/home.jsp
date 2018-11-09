<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<a href="${pageContext.request.contextPath}/rooms/registerRooms">방입력</a>
	<br>

	<div class="row">
		<c:forEach items="${rooms}" var="item" varStatus="status">
			<div class="col-md-4">
				<div class="card mb-4 box-shadow">
					<img class="card-img-top">
					<div class="card-body">
						<p class="card-text">
							${item.roomsId}번 방<br>방주인은 ${item.hostId}

						</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${item.roomsId}"><button
										type="button" class="btn btn-sm btn-outline-secondary">View</button></a>
								<a
									href="${pageContext.request.contextPath}/rooms/modifyRooms?roomsId=${item.roomsId}"><button
										type="button" class="btn btn-sm btn-outline-secondary">Edit</button></a>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</main>
</body>
</html>