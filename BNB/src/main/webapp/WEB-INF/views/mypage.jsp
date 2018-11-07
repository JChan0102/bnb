<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<%@ include file="/resources/common/includeHead.jsp"%>

</head>
<body>
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div id="wrap_cont">
		<!--콘텐츠전체감싸주는 부분-->
		<div id="left_list">
			<div id="list">
				<ul>
					<li class="mypage_list"><i class="fas fa-user-circle"></i>&ensp;<a class="nav-link text-dark" href="#">프로필보기</a></li>
					<li class="mypage_list"><i class="fas fa-heart"></i>&ensp;<a class="nav-link text-dark" href="#">즐겨찾기</a></li>
					<li class="mypage_list"><i class="fas fa-history"></i>&ensp;<a class="nav-link text-dark" href="#">히스토리</a></li>
					<li class="mypage_list"><i class="fas fa-star"></i>&ensp;<a class="nav-link text-dark" href="#">후기</a></li>
				</ul>
			</div>
		</div>
		<!--리스트부분 감싸주는거-->
		<div id="profile_content">
			<!--콘텐츠부분들어가면됨-->
		</div>
	</div>
</body>
</html>