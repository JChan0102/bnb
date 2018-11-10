<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<h1 style="text-align: center;padding:10px;font-weight: 800;"><i class="fas fa-id-card"></i> MY PROFILE</h1>
			<div class="row profile_wrap">
				<div class="col-sm-5 profile_left">
					<div id="profile_photo">
						<img
							src="${pageContext.request.contextPath}/resources/images/userphoto/이제훈.jpg"
							style="width: 100%; object-fit: contain;" class="rounded">
					</div>
					<br>
					<h4><span class="badge badge-pill badge-warning">Id</span>&ensp;${loginUser.userId }</h4>
					<h4>${loginUser.userName }</h4>
				</div>
				<div class="col-sm-6 profile_right">
					<dl>
						<dt style="font-size: 19px;">생년월일</dt>
						<dd>${loginUser.birth}</dd>
						<dt style="font-size: 19px;">자기소개</dt>
						<dd>${loginUser.userInfo}</dd>
						<dt style="font-size: 19px;">본인확인여부</dt>
						<dd>
							<c:choose>
								<c:when test="${loginUser.userCheck eq 1}">
									<i class="far fa-check-circle" style="color: #329632"></i> 확인 되었습니다.
								</c:when>
								<c:otherwise>
									<i class="far fa-times-circle" style="color: #CD0000"></i> 본인 확인을 진행해 주세요.
								</c:otherwise>
							</c:choose>
						</dd>
						<dt style="font-size: 19px;">호스트여부</dt>
						<dd>
							<c:choose>
								<c:when test="${loginUser.host eq 1}">
									<i class="far fa-check-circle" style="color: #329632"></i> 호스트 등록되어있습니다.
								</c:when>
								<c:otherwise>
									<i class="far fa-times-circle" style="color: #CD0000"></i> 호스트가 아닙니다.
									<dt>호스트가 되길 원하신다면? <button type="button" class="btn btn-link">호스트신청</button></dt>
								</c:otherwise>
							</c:choose>
						</dd>
						
					</dl>
					<br><button type="button" class="btn btn-outline-secondary"
					onclick="javascript:location.href='${pageContext.request.contextPath}/profileEdit'">프로필수정</button>
				&ensp;<button type="button" class="btn btn-outline-danger">회원 탈퇴</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>