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
	<div class="row justify-content-md-center">

		<div class="col col-md-10 col-lg-8">
			<form method="post">
				<table class="table">
					<tr>
						<td>호스트 아이디</td>
						<td><input type="text" class="form-control"
							readonly="readonly" value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>상세설명</td>
						<td><input type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>어른</td>
						<td><input type="text" class="form-control"
							value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>어린이</td>
						<td><input type="text" class="form-control"
							value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>유아</td>
						<td><input type="text" class="form-control"
							value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>침실</td>
						<td><input type="text" class="form-control"
							value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>침대</td>
						<td><input type="text" class="form-control"
							value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>욕실</td>
						<td><input type="text" class="form-control"
							value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>편의시설</td>
						<td><input type="text" class="form-control"
							value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>체크인</td>
						<td><input type="text" class="form-control"
							value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>체크아웃</td>
						<td><input type="text" class="form-control"
							value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>주중가격</td>
						<td><input type="text" class="form-control"
							value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>주말가격</td>
						<td><input type="text" class="form-control"
							class="form-control" value="{로그인세션의아이디}"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" class="form-control"></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	</main>
</body>
</html>