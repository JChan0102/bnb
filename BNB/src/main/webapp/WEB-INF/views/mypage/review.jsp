<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body style="background-color: #EEEEEE;">
	<%@ include file="/resources/common/Navbar.jsp"%>

	<div id="mypage_wrap_cont">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="mypage_cont">
			<ul class="nav reviewNav">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath }/review">내가 쓴 후기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">내게 쓴 후기</a></li>
			</ul>
			<div id="review_cont">
				<!-- 써야할 리뷰 리스트 -->
				<table id="review_write_table" rules="none"
					style="border-radius: 10px;">
					<tr style="height: 30px;">
						<th colspan="2" style="text-align: center; height: 50px;"><i
							class="fas fa-edit"></i>&ensp;작성해야할 후기</th>
					</tr>
					<c:if test="${empty reviewWrite}">
						<tr>
							<td style="width: 800px; text-align: center;">작성해야할 후기가 없습니다.</td>
						</tr>
					</c:if>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:forEach var="reWrite" items="${reviewWrite}">
						<c:if test="${reWrite.reviewContent eq null && reWrite.checkOut <= now && loginUser.userId eq reWrite.userId}">
							<tr>
								<td style="width: 800px; height: 50px; text-align: center;"><b><fmt:formatDate
											pattern="MM월 dd일" value="${reWrite.checkIn}" /> - <fmt:formatDate
											pattern="MM월 dd일" value="${reWrite.checkOut}" /></b>에 숙박한 숙소에 대한 후기를 써주세요.</td>
								<td><a href="${pageContext.request.contextPath }/reviewWrite?reservationNum=${reWrite.reservationNum}">후기쓰기</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</table>

				<c:if test="${empty reviewTo}">
					<h1 style="text-align: center;">작성한 리뷰가 없습니다.</h1>
				</c:if>

				<!-- 내가 쓴 것만 나타내줌! 리뷰쓴내역 -->
				<c:forEach var="reTo" items="${reviewTo}">
					<c:if test="${reTo ne null && loginUser.userId eq reTo.userId}">
						<table id="review_table" rules="none" style="border-radius: 10px;">
							<tr>
								<td class="review_photo" rowspan='2'>
								<img src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg" id="review_img"></td>
								<td class="review_host"><b>${reTo.hostId}</b>님의 대한 후기</td>
								<td><c:forEach var="scope" begin="1" end="${reTo.scope}">
										<i class="fas fa-star" style="color: #FF5675"></i>
									</c:forEach></td>
							</tr>
							<tr>
								<td colspan='2'>${reTo.reviewContent}<br> <br> <fmt:formatDate
										pattern="yyyy년 MM월 dd일" value="${reTo.reviewDate}" />
								</td>
							</tr>
						</table>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>