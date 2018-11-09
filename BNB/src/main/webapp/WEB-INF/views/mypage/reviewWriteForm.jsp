<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
	String num = request.getParameter("reservationNum");
	int reservationNum = Integer.parseInt(num);
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body style="background-color: #EEEEEE;">
	<%@ include file="/resources/common/Navbar.jsp"%>

	<div id="mypage_wrap_cont">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="mypage_cont">
			<div id="reviewCont_wrap">
				<form method="post" name="reWrite">
					<input type="text" name="reservationNum" class="form-control-plaintext"
						value="${reservationNum}"
						style="width: 300px;" readonly><br>
					<div class="form-group">
						<label for="reviewCont">리뷰 내용</label>
						<textarea class="form-control" name="reviewContent" id="reviewCont" rows="3"></textarea>
					</div>
					<select class="form-control" name="scope">
						<option selected>별점</option>
						<option value="1">★</option>
						<option value="2">★★</option>
						<option value="3">★★★</option>
						<option value="4">★★★★</option>
						<option value="5">★★★★★</option>
					</select><br>
					<button type="button" class="btn btn-warning" onclick="javascript:document.reWrite.submit();" style="float:right;">리뷰 쓰기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>