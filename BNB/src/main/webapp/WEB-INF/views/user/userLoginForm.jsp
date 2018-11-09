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

<!-- <script>
alert("${cookieUserId}");
</script>
 -->
<div id="loginForm" style="padding:20px">
<form method="post">
	아이디 : <input type="text" name="userId" placeholder="example@example.com" value="${cookieUserId}" /> <br>
	비밀번호 : <input type="password" name="userPw" /> <br>
	Remember Me! <input type="checkbox" name="rememberMe" ${rememberChk} />
	<input type="submit" value="로그인" />
</form>
</div>

</body>
</html>