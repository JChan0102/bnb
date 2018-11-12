<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage Edit</title>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body style="background-color: #EEEEEE;">
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div id="mypage_wrap_cont">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="mypage_cont">
			<h1 style="text-align: center; font-weight: 800; padding: 10px;">
				<i class="fas fa-user-edit"></i> PROFILE EDIT
			</h1>
			<div id="editForm_wrap">
				<form method="post" enctype="multipart/form-data">
					<!-- 아이디 -->
					<div class="form-group row">
						<label for="staticEmail" class="col-sm-2 col-form-label">ID</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								id="staticEmail" name="userId" value="${userId}">
						</div>
					</div>
					<!-- 이름 -->
					<div class="form-group row">
						<label for="inputName" class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputName"
								placeholder="이름" name="userName" value="${member.userName }"
								required>
						</div>
					</div>
					<!-- 현재비밀번호 -->
					<div class="form-group row">
						<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPassword"
								placeholder="Password" name="userPw" onchange="checkPw()" required>
						</div>
					</div>
					<!-- 비밀번호 확인 -->
					<div class="form-group row">
						<label for="inputPassword" class="col-sm-2 col-form-label">비번확인</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="passwordCk"
								placeholder="Password" onchange="checkPw()" required> <span id="pwCk" style="color:red;font-size: 13px;"></span>
						</div>
					</div>

					<script>
						function checkPw() {
							var pw = document.getElementById('inputPassword').value;
							var pwck = document.getElementById('passwordCk').value;

							if (pw != pwck) {
								document.getElementById('pwCk').innerHTML = '<b>비밀번호가 일치하지 않습니다.</b>';
								return false;
							}
							else {
								document.getElementById('pwCk').innerHTML = '';
								return true;
							}
						}
					</script>
					
					<!-- 자기소개 -->
					<div class="form-group">
						<label for="exampleFormControlTextarea1">자기소개</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="3" name="userInfo">${member.userInfo }</textarea>
					</div>
					<!-- 사진업로드 -->
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="customFile" name="userPhotoFile">
						<input type="hidden" name="before" value="${member.userPhoto}">
						<label class="custom-file-label" for="customFile">파일을 선택하세요.</label>
					</div>
					<br><br>
					<div id="editButton">
					<button type="submit" class="btn btn-outline-secondary">수정하기</button>
					<button type="reset" class="btn btn-outline-danger" onclick="javascript:history.back();">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>