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
							readonly="readonly" value="(로그인세션의아이디)" id="hostId" name="hostId"></td>
					</tr>
					<tr>
						<td>소개</td>
						<td><textarea class="form-control" id="details"
								name="details" rows="5" placeholder="숙소를 소개해주세요."></textarea></td>
					</tr>
					<tr>
						<td>어른</td>
						<td><input type="number" class="form-control"
							id="avail_adults" name="avail_adults" value="0" min="0" max="100"
							step="1"></td>

					</tr>
					<tr>
						<td>어린이</td>
						<td><input type="number" class="form-control" value="0"
							min="0" max="100" step="1" id="avail_children"
							name="avail_children"></td>

					</tr>
					<tr>
						<td>유아</td>
						<td><input type="number" class="form-control" value="0"
							min="0" max="100" step="1" id="avail_infants"
							name="avail_infants"></td>

					</tr>
					<tr>
						<td>침실</td>
						<td><input type="number" class="form-control" value="0"
							min="0" max="100" step="1" id="avail_bedroom"
							name="avail_bedroom"></td>

					</tr>
					<tr>
						<td>침대</td>
						<td><input type="number" class="form-control" value="0"
							min="0" max="100" step="1" id="avail_bed" name="avail_bed"></td>
					</tr>
					<tr>
						<td>욕실</td>
						<td><input type="number" class="form-control" value="0"
							min="0" max="100" step="1" id="avail_bathroom"
							name="avail_bathroom"></td>
					</tr>
					<tr>
						<td>편의시설</td>
						<td><input type="text" class="form-control" value="0" min="0"
							max="100" step="1" id="amenities" name="amenities"></td>
					</tr>
					<tr>
						<td>체크인</td>
						<td><input type="time" class="form-control" id="time_checkin"
							name="time_checkin"></td>
					</tr>
					<tr>
						<td>체크아웃</td>
						<td><input type="time" class="form-control"
							id="time_checkout" name="time_checkout"></td>
					</tr>
					<tr>
						<td>주중가격</td>
						<td><input type="text" class="form-control"
							id="price_weekdays" name="price_weekdays"></td>
					</tr>
					<tr>
						<td>주말가격</td>
						<td><input type="text" class="form-control"
							id="price_weekend" name="price_weekend" class="form-control"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" class="form-control" id="address"
							name="address"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="hidden" id="roomsId"
							name="roomsId" value="?"><input type="hidden"
							id="disabled" name="disabled" value="1"></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	</main>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-input-spinner.js"></script>
	<script>
		$("input[type='number']").inputSpinner()
	</script>
</body>
</html>