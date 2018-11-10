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
			<h1 style="text-align: center;font-weight: 800;padding:10px;"><i class="fas fa-user-edit"></i> PROFILE EDIT</h1>
			<div id="editForm_wrap">
				<form method="post">
					<!-- 아이디 -->
					<div class="form-group row">
						<label for="staticEmail" class="col-sm-2 col-form-label">ID</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								id="staticEmail" value="${loginUser.userId}">
						</div>
					</div>
					<!-- 현재비밀번호 -->
					<div class="form-group row">
						<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPassword"
								placeholder="Password" required>
						</div>
					</div>
					<!-- 비밀번호 확인 -->
					<div class="form-group row">
						<label for="inputPassword" class="col-sm-2 col-form-label">비번확인</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPassword"
								placeholder="Password" required>
						</div>
					</div>

					<!-- 자기소개 -->
					<div class="form-group">
						<label for="exampleFormControlTextarea1">자기소개</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="3"></textarea>
					</div>

					<!-- 사진업로드 -->
					<div class="custom-file">
					<label for="customFile">프로필 사진</label>
						<input type="file" class="custom-file-input" id="customFile">
						<label class="custom-file-label" for="customFile">파일을
							선택하세요.</label>
					</div>
					
					<button type="submit" class="btn btn-outline-secondary btn-block">수정하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>