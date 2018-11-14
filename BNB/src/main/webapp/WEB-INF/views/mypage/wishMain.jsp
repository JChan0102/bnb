<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div id="mypage_cont">
			<h1 style="text-align: center; padding: 10px; font-weight: 800;">
				<i class="far fa-grin-hearts"></i> WISH LIST
			</h1>
			<div id="wish_wrap">
				<div class="row">
					<c:forEach var="wd" items="${wishDiv}">
						<div class="col-4">
							<a href="${pageContext.request.contextPath}/wishList?userId=${loginUser.userId}&address=${wd.address}" style="text-align: center; font-size: 18px; text-decoration: none; color:black;"class="wish_div">
							<div class="card border-secondary wish_hover" style="height: 200px; margin-bottom: 20px;">
									<div class="card-body text-center">
										<span class="card-text" style="float: right; font-size: 18px;font-weight: 600;">♥ ${wishCnt}개</span>
										<br><br><input type="text" class="form-control-plaintext" value="${wd.address}" name="address" id="address" style="text-align: center;" readonly>
									</div>
								</div></a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>