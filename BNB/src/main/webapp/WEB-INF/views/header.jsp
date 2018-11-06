<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
</head>
<body>
	<div id="back"></div>
	<div id="header">
		<img src="${pageContext.request.contextPath}/img/logo2.png" id="logo">
		<div id="infobutton">
			<input type="button" id="mypage" value="마이페이지"> <input
				type="button" id="login" value="로그인">
		</div>
	</div>
	<div id="search">
		<h1 id="title">당신의 숙소를 검색하세요.</h1>
		<div id="search_content">
			<div class="search_wrap">
				<label for="target">목적지</label><br> <input type="text"
					id="target"><br>
			</div>
			<div class="search_wrap">
				<label for="checkin">체크인&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label><label
					for="checkout">체크아웃</label><br> <input type="text"
					id="checkin" style="width: 190px"> <input type="text"
					id="checkout" style="width: 190px"><br>
			</div>
			<div class="search_wrap">
				<lavel for="adult">성인&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</lavel>
				<lavel for="child">어린이</lavel>
				<br> <select>
					<option>인원 수</option>
					<option>1명</option>
					<option>2명</option>
				</select> <select>
					<option>인원 수</option>
					<option>1명</option>
					<option>2명</option>
				</select>
				<div class="search_wrap">
					<br>
					<input type="button" value="검색하기">
				</div>
			</div>
</body>
</html>