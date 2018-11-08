<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<h1>회원가입 성공</h1>

<div>
아이디 : ${userId} <br>
비밀번호 : ${userPw} <br>
이름 : ${userName} <br>
사진 : ${userPhoto} <br>
호스트 : ${host} <br>
어드민 : ${admin} <br>
유저키 : ${userKey} <br>
유저체크 : ${userCheck} <br>
포인트 : ${point} <br>
탈퇴여부 : ${disabled} <br>
생년월일 : ${birth} <br>
자기소개 : ${userInfo} <br>
</div>

<h3><a href="${pageContext.request.contextPath}/main">메인페이지 돌아가기</a></h3>
</body>
</html>