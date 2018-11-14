<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body>

	<%@ include file="/resources/common/Navbar.jsp"%>
	<!-- Begin page content -->

	<main role="main" class="row ml-5 mr-5">
	<div class="col-md-2 border-right pr-4">
		<form method="post">
			<input type="submit" class="btn btn-danger col-12 btn-lg"
				value="숙소 검색">
			<table class="table">
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
						min="0" max="100" step="1" id="avail_infants" name="avail_infants"></td>

				</tr>
				<tr>
					<td>침실</td>
					<td><input type="number" class="form-control" value="0"
						min="0" max="100" step="1" id="avail_bedroom" name="avail_bedroom"></td>

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
					<td>체크인</td>
					<td><input type="time" class="form-control" id="time_checkin"
						name="time_checkin" value="14:00"></td>
				</tr>
				<tr>
					<td>체크아웃</td>
					<td><input type="time" class="form-control" id="time_checkout"
						name="time_checkout" value="12:00"></td>
				</tr>
				<tr>
					<td>주중가격</td>
					<td><input type="number" class="form-control"
						id="price_weekdays" name="price_weekdays" value="0" min="0"
						max="10000000" step="1000"></td>
				</tr>
				<tr>
					<td>주말가격</td>
					<td><input type="number" class="form-control"
						id="price_weekend" name="price_weekend" value="0" min="0"
						max="10000000" step="1000" class="form-control"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" class="form-control" id="address"
						name="address" required="required"></td>
				</tr>
			</table>
		</form>

	</div>
	<div class="col-md-10 pl-4">
		<div id="map" style="width: 100%; height: 100%;"></div>
		<c:if test="${1 eq loginUser.host}">
			<a href="${pageContext.request.contextPath}/rooms/registerRooms"><button
					class="btn btn-danger">방입력</button></a>
		</c:if>
		<br>
		<div id="map"></div>
		<div class="row" id="roomsList">
			<c:forEach items="${rooms}" var="item" varStatus="status">
				<div class="col-md-3">
					<div class="card mb-3 box-shadow">
						<img class="card-img-top">
						<div class="card-body">
							<p class="card-text">
								${item.roomsId}<br>${item.address}<br>
								<fmt:formatNumber value="${item.price_weekdays}"
									pattern="\###,###,###" />
								-
								<fmt:formatNumber value="${item.price_weekend}"
									pattern="\###,###,###" />
								/박<br>
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<small class="text-muted"> <c:forEach
										items="${reviewSummary}" var="reviewSummary">
										<c:if test="${item.roomsId eq reviewSummary.roomsId}">
											<c:forEach begin="1" end="${reviewSummary.avgScope}" step="1">★</c:forEach>
											<fmt:formatNumber value="${reviewSummary.avgScope}"
												pattern="0.0" />
										(${reviewSummary.reviewCount})
								</c:if>
									</c:forEach>
								</small>
								<div class="btn-group">
									<c:if test="${item.hostId eq loginUser.userId}">
										<a
											href="${pageContext.request.contextPath}/rooms/modifyRooms?roomsId=${item.roomsId}&_hostId=${item.hostId}"><button
												type="button" class="btn btn-sm btn-outline-secondary ml-1">Edit</button></a>
									</c:if>
									<a
										href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${item.roomsId}&hostId=${item.hostId}"><button
											type="button" class="btn btn-sm btn-outline-secondary ml-1">View</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/rooms?page=${paging.prevPageNo}">Previous</a></li>
				<c:set var="pageIdx" value="${paging.startPageNo}" />
				<c:forEach varStatus="status" begin="${paging.startPageNo}"
					end="${paging.endPageNo}" step="1">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/rooms?page=${pageIdx}">${pageIdx}</a></li>
					<c:set var="pageIdx" value="${pageIdx+1}" />
				</c:forEach>
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/rooms?page=${paging.nextPageNo}">Next</a></li>
			</ul>
		</nav>
	</div>
	</main>
	<!-- 스피너 사용을 위한 JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-input-spinner.js"></script>
	<script>
		// 스피너 사용	
		$("input[type='number']").inputSpinner()

		// input에서 엔터키 사용시 submit을 방지하기 위함
		$('input[type="text"]').keydown(function() {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
		});
	</script>
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

		// search by tm128 coordinate
		function searchCoordinateToAddress(latlng) {
			var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

			infoWindow.close();

			naver.maps.Service
					.reverseGeocode(
							{
								location : tm128,
								coordType : naver.maps.Service.CoordType.TM128
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									$('#address').val('');
									return alert('유효하지 않은 주소 입니다! 주소를 확인해 주세요.');
								}

								var items = response.result.items, htmlAddresses = [];

								for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
									item = items[i];

									if (i == 0) {
										addrType = item.isRoadAddress ? '[도로명주소]'
												: '[지번주소]';

										// htmlAddresses.push((i + 1) + '. ' + addrType+ ' ' + item.address);
										htmlAddresses.push(addrType + ' '
												+ item.address);
										$('#address').val(item.address);
									}
								}

								infoWindow
										.setContent([
												'<div class="alert alert-light border border-secondary map_info mb-0" role="alert">',
												'<b>검색 좌표</b><br>',
												htmlAddresses.join('<br>'),
												'</div>' ].join('\n'));

								infoWindow.open(map, latlng);
							});
		}

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
			map.addListener('click', function(e) {
				searchCoordinateToAddress(e.coord);
			});

			// 주소창에 enter 입력시
			$('#address').on('keydown', function(e) {
				var keyCode = e.which;
				if (keyCode === 13) { // Enter Key
					searchAddressToCoordinate($('#address').val());
				}
			});

			// 주소창에 입력후 엔터를 입력하지 않았으나, 포커스를 벗어날  경우
			$('#address').blur(function(e) {
				searchAddressToCoordinate($('#address').val());
			});
		}

		naver.maps.onJSContentLoaded = initGeocoder;
	</script>
</body>
</html>