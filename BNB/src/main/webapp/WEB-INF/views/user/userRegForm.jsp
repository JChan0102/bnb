<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<%@ include file="/resources/common/includeHead.jsp"%>
<%@ include file="/resources/common/Navbar.jsp"%>
	
	<div id="userRegForm" style="padding:20px">
	<form method="post" enctype="multipart/form-data">
		아이디(이메일 ) : <input type="email" name="userId" /><br>
		비밀번호 설정 : <input type="password" name="userPw" /><br>
		이름 : <input type="text" name="userName" /><br>
		사진 : <input type="file" name="photoFile" /><br>
		<input type="hidden" name="host" value=1 /><br>
		<input type="hidden" name="admin" value=1 /><br>
		<input type="hidden" name="userKey" value="asd123" /><br>
		<input type="hidden" name="userCheck" value=1 /><br>
		<input type="hidden" name="point" value=0 /><br>
		<input type="hidden" name="disabled" value=1 /><br>
		<select name="month">
			<option>월</option>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
			<option>7</option>
			<option>8</option>
			<option>9</option>
			<option>10</option>
			<option>11</option>
			<option>12</option>
		</select>
		<input type="text" name="day" placeholder="일" />
		<input type="text" name="year" placeholder="년(4자리)" />
		<textarea name="userInfo" cols="30" placeholder="자기소개"></textarea> <br>
		<input type="submit" value="가입하기" />
	</form>
	</div>
</body>
</html>