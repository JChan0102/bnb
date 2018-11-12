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
		<div class="col-md-7">
			<h1>
				<b>숙소 보기</b>
			</h1>
			<form method="post">
				<table class="table">
					<tr>
						<td>호스트 아이디</td>
						<td>${selectedRoom.hostId}</td>
					</tr>
					<tr>
						<td>소개</td>
						<td>${selectedRoom.details}</td>
					</tr>
					<tr>
						<td>인원</td>
						<td><c:if test="${0 ne selectedRoom.avail_adults}">
						어른 ${selectedRoom.avail_adults}명</c:if> <c:if
								test="${0 ne selectedRoom.avail_children}">
						어린이 ${selectedRoom.avail_children}명</c:if> <c:if
								test="${0 ne selectedRoom.avail_infants}">
						유아 ${selectedRoom.avail_infants}명</c:if></td>

					</tr>
					<tr>
						<td>시설</td>
						<td><c:if test="${0 ne selectedRoom.avail_bedroom}">
						침실 ${selectedRoom.avail_bedroom}개</c:if> <c:if
								test="${0 ne selectedRoom.avail_bed}">
						침대 ${selectedRoom.avail_bed}개</c:if> <c:if
								test="${0 ne selectedRoom.avail_bathroom}">
						욕실 ${selectedRoom.avail_bathroom}개</c:if></td>

					</tr>
					<tr>
						<td>편의시설</td>
						<td><c:set var="count" value="0" /> <c:set var="divideChk"
								value="1" /> <c:forEach items="${amenities}" var="item">
								<c:set var="count" value="${count+1}" />
								<c:if
									test="${'T' eq fn:substring(selectedRoom.amenities, count-1, count)}">
									<c:if
										test="${divideChk ne (item.amenities_idx-(item.amenities_idx mod 100))/100 && divideChk ne 1}">
										<hr>
										<c:set var="divideChk"
											value="${(item.amenities_idx-(item.amenities_idx mod 100))/100}" />
									</c:if>
									<label for="amcb${count}" class="form-check-label">${item.amenities_details}</label>
									<br>
								</c:if>
							</c:forEach><input type="hidden" class="form-control"
							value="${selectedRoom.amenities}" id="amenities" name="amenities"></td>
					</tr>
					<tr>
						<td>체크인</td>
						<td>${selectedRoom.time_checkin}</td>
					</tr>
					<tr>
						<td>체크아웃</td>
						<td>${selectedRoom.time_checkout}</td>
					</tr>
					<tr>
						<td>주중가격</td>
						<td>${selectedRoom.price_weekdays}</td>
					</tr>
					<tr>
						<td>주말가격</td>
						<td>${selectedRoom.price_weekend}</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>${selectedRoom.address}</td>
					</tr>
					<tr>
						<td colspan="2"><div id="map"
								style="width: 100%; height: 500px;"></div></td>
					</tr>
					<tr>
						<td colspan="2">이방의 후기</td>
					</tr>
					<tr>
						<td colspan="2">호스트 정보</td>
					</tr>
					<tr>
						<td colspan="2">?</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center"><input type="hidden"
							id="roomsId" name="${selectedRoom.roomsId}" value="0"><input
							type="hidden" id="disabled" name="disabled"
							value="${selectedRoom.disabled}"> <a
							href="${pageContext.request.contextPath}/chat/sendmessage?roomsId=${selectedRoom.roomsId}&hostId=${selectedRoom.hostId}"><input
								type="button" class="btn btn-danger ml-1 mr-1" value="문의하기"></a>
							<a href="#"><input type="button"
								class="btn btn-danger ml-1 mr-1" value="좋아요"></a></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-5">
		달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분달력부분
		</div>
	</div>
	</main>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=RjRRELdZtqF2DId12vbe&submodules=geocoder"></script>
	<script>
		// 초기값 경복궁
		var map = new naver.maps.Map("map", {
			center : new naver.maps.LatLng(37.5788408, 126.9770162),
			zoom : 10,
			scaleControl : true,
			scaleControlOptions : {
				position : naver.maps.Position.TOP_LEFT
			},
			zoomControl : true,
			zoomControlOptions : {
				position : naver.maps.Position.TOP_RIGHT
			},
			mapTypeControl : true
		});

		var infoWindow = new naver.maps.InfoWindow({
			borderWidth : 0,
			backgroundColor : 'transparant',
			anchorSize : {
				width : 10,
				height : 10
			}
		});

		map.setCursor('pointer');

		// result by latlng coordinate
		function searchAddressToCoordinate(address) {
			naver.maps.Service
					.geocode(
							{
								address : address
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									$('#address').val('');
									return alert('유효하지 않은 주소 입니다! 주소를 확인해 주세요.');
								}

								var item = response.result.items[0], addrType = item.isRoadAddress ? '[도로명주소]'
										: '[지번주소]', point = new naver.maps.Point(
										item.point.x, item.point.y);

								$('#address').val(item.address);

								infoWindow
										.setContent([
												'<div class="alert alert-light border border-secondary map_info mb-0" role="alert">',
												'<b>검색 주소 : '
														+ response.result.userquery
														+ '</b><br>',
												addrType + ' ' + item.address
														+ '<br>', '</div>' ]
												.join('\n'));

								map.setCenter(point);
								infoWindow.open(map, point);
							});
		}

		function initGeocoder() {

			searchAddressToCoordinate('${selectedRoom.address}');
		}

		naver.maps.onJSContentLoaded = initGeocoder;
	</script>
</body>
</html>