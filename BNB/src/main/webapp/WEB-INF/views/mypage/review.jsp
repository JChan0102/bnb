<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body>
	<%@ include file="/resources/common/Navbar.jsp"%>

	<div id="wrap_cont">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="review_content">
			<!-- 탭이 두 개 필요. 내가쓴 후기 내게쓴후기 -->
			<!-- 테이블로 돌리자. 형식은. -->
			<a href="#">내가 쓴 후기</a><a href="#">내게 쓴 후기</a>
			<table>
				<tr>
					<td rowspan='2'>사진들어갈곳</td>
					<td>(호스트)님의 대한 후기</td>
					<td>별점</td>
				</tr>
				<tr>
					<td colspan='2'>리뷰내용&날짜</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>