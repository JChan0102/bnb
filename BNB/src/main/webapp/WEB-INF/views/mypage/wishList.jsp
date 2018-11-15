<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WishList</title>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body style="background-color: #EEEEEE;">
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div id="mypage_wrap_cont">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="mypage_cont" class="text-center">
			<h1 style="text-align: center; padding: 10px; font-weight: 800;">
				<i class="far fa-grin-hearts"></i> WISH LIST
			</h1>
			<div class="card-columns">
				<c:forEach var="wl" items="${wishList}">
					<div class="card history"
						style="width: 17rem; margin: 15px auto 10px auto;">
						<div class="historyCard">
							<a
								href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${wl.roomsId}"><img
								class="card-img-top"
								src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
								alt="Card image cap" style="width: 100%; object-fit: contain;"></a>
						</div>
						<div class="card-body">
							<h5 class="card-title">
								<b>${wl.hostId}</b>
							</h5>
						</div>
						<ul class="list-group list-group-flush">
							<c:if test="${!empty wl.details}">
								<li class="list-group-item"><a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${wl.roomsId}">
										${wl.details}<c:if test="${fn:length(wl.details) >= 100}">...</c:if>
								</a></li>
							</c:if>
							<li class="list-group-item">${wl.address}</li>
							<li class="list-group-item">${wl.price_weekdays}</li>
							<li class="list-group-item">${wl.price_weekend}</li>
						</ul>
					</div>
				</c:forEach>
			</div>
			<br>
			<button onclick="javascript:history.back();"
				class="btn btn-outline-secondary" style="margin: 10px;">목록으로</button>
			<br> <br>
		</div>
	</div>
</body>
</html>