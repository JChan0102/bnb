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
	<div id="loginForm" style="padding: 20px">
		<!-- Begin page content -->
		<main role="main" class="container">
		<div class="row justify-content-md-center">
			<div class="col col-md-6 col-lg-4">
				<form method="post"><label class="form-check-label mt-2 mb-2">아이디 :</label>
					<input type="text" name="userId" class="form-control"
						placeholder="example@example.com" value="${cookieUserId}" /> <br>
					<label class="form-check-label mt-2 mb-2">비밀번호 :</label><input type="password" name="userPw" class="form-control" />

					<label class="form-check-label mt-2 mb-2">Remember Me! </label> <input
						type="checkbox" name="rememberMe" ${rememberChk}
						class="form-control-input" />
					<button class="btn btn-lg btn-danger btn-block" type="submit">로그인</button>
				</form>
			</div>
		</div>
		</main>
	</div>
</body>
</html>