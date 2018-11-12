<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body style="background-color: #EEEEEE;">
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div id="mypage_wrap_cont">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="mypage_cont">
			<h1 style="text-align: center; padding: 10px; font-weight: 800;">
				<i class="fas fa-history"></i> HISTORY
			</h1>
			<div class="row">
				<c:forEach var="his" items="${historys}">
					<div class="col-4">
						<div class="card history" style="width: 17rem;margin:15px auto 10px auto;">
							<div class="historyCard">
								<a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${his.roomsId}"><img
									class="card-img-top"
									src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
									alt="Card image cap" style="width: 100%; object-fit: contain;"></a>
							</div>
							<div class="card-body">
								<h5 class="card-title">
									<b>${his.hostId}</b>
								</h5>
								<a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${his.roomsId}">${his.details}</a>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><fmt:formatDate
										pattern="YY년 MM월 dd일" value="${his.checkIn}" /> ~<fmt:formatDate
										pattern="YY년 MM월 dd일" value="${his.checkOut}" /> ×
									${his.people}명</li>
								<li class="list-group-item">${his.address}</li>
								<li class="list-group-item">${his.price}</li>
							</ul>
							<div class="card-body">
								<a href="#" class="card-link">후기보기</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>