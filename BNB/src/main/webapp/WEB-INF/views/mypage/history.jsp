<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>History</title>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body style="background-color: #EEEEEE;">
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div id="mypage_wrap_cont" class="row">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="mypage_cont" class="col-9">
			<h1 style="text-align: center; padding: 10px; font-weight: 800;">
				<i class="fas fa-home"></i> MY TRIP
			</h1>
			<div class="card">
				<h5 class="card-header">현재 예약</h5>
				<c:if test="${empty trip}">
					<h1 style="text-align: center;">예정된 여행이 없습니다.</h1>
				</c:if>
				<div class="row">
					<c:forEach var="trip" items="${trip}">
						<div class="card history"
							style="width: 19rem; margin: 15px auto 10px auto;">
							<div class="historyCard">
								<a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${his.roomsId}"><img
									class="card-img-top"
									src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
									alt="Card image cap" style="width: 100%; object-fit: contain;"></a>
							</div>
							<div class="card-body">
								<h4 class="card-title">${trip.address}</h4>
								<fmt:formatDate pattern="YY년 MM월 dd일" value="${trip.checkIn}" />
								~
								<fmt:formatDate pattern="YY년 MM월 dd일" value="${trip.checkOut}" />
								· <br>게스트 ${trip.people}명<br> <br> <a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${trip.roomsId}">${trip.details}</a>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><fmt:formatNumber type="int"
										var="price" value="${trip.price}" pattern="#,###" />￦
									${price}</li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			<br> <br>
			<div class="card">
				<h5 class="card-header">이전 예약</h5>
				<c:if test="${empty historys}">
					<h1 style="text-align: center;">다녀온 여행이 없습니다.</h1>
				</c:if>
				<div class="row">
					<c:forEach var="his" items="${historys}">
						<div class="card history"
							style="width: 19rem; margin: 15px auto 10px auto;">
							<div class="historyCard">
								<a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${his.roomsId}"><img
									class="card-img-top"
									src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
									alt="Card image cap" style="width: 100%; object-fit: contain;"></a>
							</div>
							<div class="card-body">
								<h4 class="card-title">${his.address}</h4>
								<fmt:formatDate pattern="YY년 MM월 dd일" value="${his.checkIn}" />
								~
								<fmt:formatDate pattern="YY년 MM월 dd일" value="${his.checkOut}" />
								· <br>게스트 ${his.people}명<br> <br> <a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${his.roomsId}">${his.details}</a>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><fmt:formatNumber type="int"
										var="price" value="${his.price}" pattern="#,###" />￦ ${price}</li>
								<li class="list-group-item"><a
									href="${pageContext.request.contextPath}/review"
									class="card-link">후기보기</a></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>