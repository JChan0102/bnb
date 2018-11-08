<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ include file="/resources/common/includeHead.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<%@ include file="/resources/common/Navbar.jsp"%>
	
	<div>
	<form method="post">
		아이디(이메일 ) : <input type="email" name="userId" /><br>
		비밀번호 설정 : <input type="password" name="userPw" /><br>
		이름 : <input type="text" name="userName" /><br>
		사진 : <input type="file" name="photoFile" /><br>
		<input type="hidden" name="host" value=1 /><br>
		<input type="hidden" name="admin" value=1 /><br>
		<input type="hidden" name="userKey" value="asd123" /><br>
		<input type="hidden" name="userCheck" value=1 /><br>
		<input type="hidden" name="point" /><br>
		<input type="hidden" name="disabled" value=1 /><br>
		<input type="hidden" name="birth" value="1991-02-21" /><br>
		<textarea name="userInfo" cols="30" placeholder="자기소개"></textarea> <br>
		<input type="submit" value="가입하기" />
	</form>
	</div>
</body>
</html>