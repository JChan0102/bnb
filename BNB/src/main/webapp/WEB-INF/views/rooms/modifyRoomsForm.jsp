<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$('input:checkbox').change(function() {
				var check = '';
				$('input:checkbox').each(function() {
					if ($(this).is(':checked')) {
						check = check + 'T';
					} else {
						check = check + 'F';
					}
				});
				$('#amenities').val(check);
			});

		});
	</script>
	<%@ include file="/resources/common/Navbar.jsp"%>
	<!-- Begin page content -->
	<!-- https://shaack.com/projekte/bootstrap-input-spinner/ -->
	<main role="main" class="container">
	<div class="row justify-content-md-center">
		<div class="col col-md-10 col-lg-8">
			<h1>
				<b>숙소 수정</b>
			</h1>
			<form method="post">
				<table class="table">
					<tr>
						<td>호스트 아이디</td>
						<td><input type="text" class="form-control"
							readonly="readonly" id="hostId" name="hostId"
							value="${selectedRoom.hostId}" required="required"></td>
					</tr>
					<tr>
						<td>소개</td>
						<td><textarea class="form-control" id="details"
								name="details" rows="5" placeholder="숙소를 소개해주세요.">${selectedRoom.details}</textarea></td>
					</tr>
					<tr>
						<td>어른</td>
						<td><input type="number" class="form-control"
							id="avail_adults" name="avail_adults"
							value="${selectedRoom.avail_adults}" min="0" max="100" step="1"></td>

					</tr>
					<tr>
						<td>어린이</td>
						<td><input type="number" class="form-control"
							value="${selectedRoom.avail_children}" min="0" max="100" step="1"
							id="avail_children" name="avail_children"></td>

					</tr>
					<tr>
						<td>유아</td>
						<td><input type="number" class="form-control"
							value="${selectedRoom.avail_infants}" min="0" max="100" step="1"
							id="avail_infants" name="avail_infants"></td>

					</tr>
					<tr>
						<td>침실</td>
						<td><input type="number" class="form-control"
							value="${selectedRoom.avail_bedroom}" min="0" max="100" step="1"
							id="avail_bedroom" name="avail_bedroom"></td>

					</tr>
					<tr>
						<td>침대</td>
						<td><input type="number" class="form-control"
							value="${selectedRoom.avail_bed}" min="0" max="100" step="1"
							id="avail_bed" name="avail_bed"></td>
					</tr>
					<tr>
						<td>욕실</td>
						<td><input type="number" class="form-control"
							value="${selectedRoom.avail_bathroom}" min="0" max="100" step="1"
							id="avail_bathroom" name="avail_bathroom"></td>
					</tr>
					<tr>
						<td>편의시설</td>
						<td><c:set var="count" value="0" /> <c:set var="divideChk"
								value="1" /> <c:forEach items="${amenities}" var="item">
								<c:set var="count" value="${count+1}" />
								<c:if
									test="${divideChk ne (item.amenities_idx-(item.amenities_idx mod 100))/100}">
									<hr>
									<c:set var="divideChk"
										value="${(item.amenities_idx-(item.amenities_idx mod 100))/100}" />
								</c:if>
								<c:choose>
									<c:when
										test="${'T' eq fn:substring(selectedRoom.amenities, count-1, count)}">
										<input type="checkbox" id="amcb${count}" name="amcb${count}"
											class="form-control-input" checked="checked">
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="amcb${count}" name="amcb${count}"
											class="form-control-input">
									</c:otherwise>
								</c:choose>
								<label for="amcb${count}" class="form-check-label">${item.amenities_details}</label>
								<br>
							</c:forEach><input type="hidden" class="form-control"
							value="${selectedRoom.amenities}" id="amenities" name="amenities"></td>
					</tr>
					<tr>
						<td>체크인</td>
						<td><input type="time" class="form-control" id="time_checkin"
							name="time_checkin" value="${selectedRoom.time_checkin}"></td>
					</tr>
					<tr>
						<td>체크아웃</td>
						<td><input type="time" class="form-control"
							id="time_checkout" name="time_checkout"
							value="${selectedRoom.time_checkout}"></td>
					</tr>
					<tr>
						<td>주중가격</td>
						<td><input type="number" class="form-control"
							id="price_weekdays" name="price_weekdays"
							value="${selectedRoom.price_weekdays}" min="0" max="10000000"
							step="1000"></td>
					</tr>
					<tr>
						<td>주말가격</td>
						<td><input type="number" class="form-control"
							id="price_weekend" name="price_weekend"
							value="${selectedRoom.price_weekend}" min="0" max="10000000"
							step="1000" class="form-control"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" class="form-control" id="address"
							name="address" value="${selectedRoom.address}"
							required="required"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3">
								<div class="custom-file">
									<input type="file" class="custom-file-input"
										id="inputGroupFile02"> <label
										class="custom-file-label" for="inputGroupFile02"
										aria-describedby="inputGroupFileAddon02">Choose file</label>
								</div>
								<div class="input-group-append">
									<span class="input-group-text" id="inputGroupFileAddon02">Upload</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center"><input type="hidden"
							id="roomsId" name="${selectedRoom.roomsId}" value="0"><input
							type="hidden" id="disabled" name="disabled"
							value="${selectedRoom.disabled}"><input type="submit"
							class="btn btn-danger" value="수정"><a
							href="${pageContext.request.contextPath}/rooms/deleteRoom?roomsId=${selectedRoom.roomsId}&hostId=${selectedRoom.hostId}"><input
								type="button" class="btn btn-danger" value="삭제"></a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</main>
	<!-- 스피너 사용을 위한 JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-input-spinner.js"></script>
	<script>
		// 스피너 사용	
		$("input[type='number']").inputSpinner()
	</script>
</body>
</html>