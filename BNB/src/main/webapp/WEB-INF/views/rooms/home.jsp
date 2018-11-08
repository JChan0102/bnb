<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body>
	<%@ include file="/resources/common/Navbar.jsp"%>
	<!-- Begin page content -->
	<main role="main" class="container"> 
	
	
		private int roomsId;
	private String hostId;
	private String details;
	private int avail_adults;
	private int avail_children;
	private int avail_infants;
	private int avail_bedroom;
	private int avail_bed;
	private int avail_bathroom;
	private String amenities;
	private String time_checkin;
	private String time_checkout;
	private int price_weekdays;
	private int price_weekend;
	private String address;
	private int disabled;
	
	
	<form method="post">
	<table>
	<tr><td>호스트 아이디</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	<tr><td>상세설명</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	<tr><td>어른</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	<tr><td>어린이</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	<tr><td>유아</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	<tr><td>침실</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	<tr><td>침대</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	<tr><td>욕실</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	<tr><td>편의시설</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	<tr><td>체크인</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	<tr><td>체크아웃</td><td><input typ="text" value="{로그인세션의아이디}"></td></tr>
	
	</table>
	</form>
	
	
	
	</main>
</body>
</html>