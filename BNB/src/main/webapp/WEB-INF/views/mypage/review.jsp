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
			<!-- 탭이 두 개 필요. 내가쓴 후기 내게쓴후기 -->
			<!-- 테이블로 돌리자. 형식은. -->
			<ul class="nav reviewNav">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath }/review">내가 쓴 후기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">내게 쓴 후기</a></li>
			</ul>
			<div id="review_cont">
				<c:if test="${reviewTo.isEmpty()}">
					<h1>작성된 리뷰가 없습니다.</h1>
				</c:if>

				<!-- 써야할 리뷰 리스트 -->
				<table id="review_write_table" rules="none"
					style="border-radius: 10px;">
					<tr style="height: 30px;">
						<th colspan="2" style="text-align: center; height: 50px;"><i
							class="fas fa-edit"></i>&ensp;작성해야할 리뷰</th>
					</tr>
					<c:if test="${reviewWrite eq null}">
						<tr>
							<td style="width: 800px; text-align: center;">작성해야할 리뷰가
								없습니다.</td>
						</tr>
					</c:if>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:forEach var="reWrite" items="${reviewWrite}">
						<c:choose>
							<c:when test="${reWrite.reviewContent eq null && reWrite.checkOut <= now}">
								<tr>
									<td style="width: 800px; height: 50px; text-align: center;"><fmt:formatDate
											pattern="MM월 dd일" value="${reWrite.checkIn}" /> - <fmt:formatDate
											pattern="MM월 dd일" value="${reWrite.checkOut}" />에 숙박한 숙소에 대한
										리뷰를 써주세요.</td>
									<td><a href="#">리뷰쓰기</a></td>
								</tr>
							</c:when>
							<%-- <c:when test="${reWrite.checkOut >= now}">
								<tr>
									<td style="width: 800px; text-align: center;">작성해야할 리뷰가
										없습니다.</td>
								</tr>
							</c:when> --%>
						</c:choose>
					</c:forEach>
				</table>

				<!-- 리뷰쓴내역 -->
				<c:if test="${reviewTo ne null}">
					<c:forEach var="reTo" items="${reviewTo}">
						<table id="review_table" rules="none" style="border-radius: 10px;">
							<tr>
								<td class="review_photo" rowspan='2'><img
									src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
									id="review_img"> ${reTo.userPhoto}</td>
								<td class="review_host">${reTo.hostId}님의대한후기</td>
								<td><c:forEach var="scope" begin="1" end="${reTo.scope}">
										<i class="fas fa-star" style="color: #FF5675"></i>
									</c:forEach></td>
							</tr>
							<tr>
								<td colspan='2'>${reTo.reviewContent}<br> <fmt:formatDate
										pattern="yyyy년 MM월 dd일" value="${reTo.reviewDate}" />
								</td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>