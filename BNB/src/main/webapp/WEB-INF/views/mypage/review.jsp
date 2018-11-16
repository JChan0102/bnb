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
				<li style="margin-left: 335px;">
				<li>
					<form class="form-inline my-2 my-lg-0" method="get" id="searchForm"
						action="${pageContext.request.contextPath }/reviewSearchList">
						<select class="custom-select" id="inputGroupSelect01"
							name="searchType">
							<option value="all"
								<c:out value="${rvs.searchType == all?'selected':''}" />>전체검색</option>
							<option value="reviewContent"
								<c:out value="${rvs.searchType eq 'reviewContent'?'selected':''}" />>내용</option>
							<option value="hostId"
								<c:out value="${rvs.searchType eq 'hostId'?'selected':''}" />>호스트명</option>
							<option value="scope"
								<c:out value="${rvs.searchType eq 'scope'?'selected':''}" />>별점</option>
						</select>&ensp; <input class="form-control mr-sm-2" type="search"
							placeholder="검색하기" aria-label="Search" name="keyword"
							id="keywordInput" value="${rvs.keyword}">
						<button class="btn my-2 my-sm-0" id="searchBtn"
							style="background-color: #FF5675; color: white;">검색</button>
					</form>
				</li>
			</ul>
			<form id="actionForm" action="/mypage/reviewSearchList" method="get">
				<input type="hidden" name="searchType"
					value='<c:out value="${rvs.searchType}" />'> <input
					type="hidden" name="keyword"
					value='<c:out value="${rvs.keyword}" />'>
			</form>
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
							<td style="width: 800px; text-align: center;">작성해야할 후기가
								없습니다.</td>
						</tr>
					</c:if>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:forEach var="reWrite" items="${reviewWrite}">
						<c:if
							test="${reWrite.reviewContent eq null && reWrite.checkOut <= now && loginUser.userId eq reWrite.userId}">
							<tr>
								<td style="width: 800px; height: 50px; text-align: center;"><b><fmt:formatDate
											pattern="MM월 dd일" value="${reWrite.checkIn}" /> - <fmt:formatDate
											pattern="MM월 dd일" value="${reWrite.checkOut}" /></b>에 숙박한 숙소에 대한
									후기를 써주세요.</td>
								<td><a
									href="${pageContext.request.contextPath }/reviewWrite?reservationNum=${reWrite.reservationNum}">후기쓰기</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</table>

				<c:if test="${empty reviewTo}">
					<h1 style="text-align: center; padding: 20px; font-weight: 800;">작성한
						리뷰가 없습니다.</h1>
				</c:if>
				<!-- 내가 쓴 것만 나타내줌! 리뷰쓴내역 -->
				<c:forEach var="reTo" items="${reviewTo}">
					<c:if test="${reTo ne null}">
						<div class="media"
							style="background-color: #FFEAEA; border-radius: 10px; margin-bottom: 15px;">
							<div id="review_photo" class="align-self-center">
								<img class="align-self-center mr-3 rounded"
									src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
									style="width: 100%; object-fit: contain;">
							</div>
							<div class="media-body" style="padding: 0 10px;">
								<div class="row">
									<h6 class="mt-3 col-6">
										<b>${reTo.hostId}</b>님의 대한 후기
									</h6>
									<h6 class="mt-3 col-3">
										<c:forEach var="scope" begin="1" end="${reTo.scope}">
											<i class="fas fa-star" style="color: #FF5675"></i>
										</c:forEach>
									</h6>
									<div class="mt-3 col-3" style="left: 65px;">
										<button type="button" class="btn btn-secondary btn-sm"
											onclick="javascript:location.href='${pageContext.request.contextPath}/reviewEdit?reservationNum=${reTo.reservationNum}'">수정</button>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-secondary btn-sm"
											data-toggle="modal" data-target="#deleteModal">삭제</button>
										<!-- Modal -->
										<div class="modal fade" id="deleteModal" tabindex="-1"
											role="dialog" aria-labelledby="deleteModal"
											aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalCenterTitle">후기삭제</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body" style="text-align: center;">
														<b>${reTo.hostId}</b>님의 대한 후기를 삭제하시겠습니까?
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-danger"
															onclick="javascript:location.href='review_delete?reservationNum=${reTo.reservationNum}'">삭제하기</button>
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">취소</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<p class="mb-0" style="margin-top: 10px;">${reTo.reviewContent}<br>
									<br>
									<fmt:formatDate pattern="yyyy년 MM월 dd일"
										value="${reTo.reviewDate}" />
									<br> <br>
								</p>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>