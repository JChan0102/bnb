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
						<td><fmt:formatNumber value="${selectedRoom.price_weekdays}"
								pattern="\###,###,###" /></td>
					</tr>
					<tr>
						<td>주말가격 (공휴일 포함)</td>
						<td><fmt:formatNumber value="${selectedRoom.price_weekend}"
								pattern="\###,###,###" /></td>
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
						<td colspan="2"><table class="table" id="review">
								<%-- <c:forEach items="${review}" var="item">
									<tr>
										<td rowspan="3" class="border-bottom border-right"><h1>사진</h1>${item.userName}</td>
										<td><small class="text-muted"> <c:forEach
													begin="1" end="${item.scope}" step="1">★</c:forEach>(${item.scope})
										</small></td>
									</tr>
									<tr>
										<td class="border-top-0 border-bottom-0">${item.reviewContent}</td>
									</tr>
									<tr>
										<td class="border-top-0 border-bottom"><small
											class="text-muted"><fmt:formatDate
													value="${item.reviewDate}" pattern="yyyy-MM-dd" />에 작성된
												후기입니다.</small></td>
									</tr>
								</c:forEach> --%>
							</table></td>
					</tr>
					<%-- <tr>
						<td colspan="2"><table class="table" id="reviewTable">
								<c:if test="${empty review}">
									<tr>
										<td>후기가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${review}" var="item">
									<tr>
										<td rowspan="3" class="border-bottom border-right" id="RTuserName"><h1>사진</h1>${item.userName}</td>
										<td><small class="text-muted"> <c:forEach
													begin="1" end="${item.scope}" step="1">★</c:forEach>(${item.scope})
										</small></td>
									</tr>
									<tr>
										<td class="border-top-0 border-bottom-0">${item.reviewContent}</td>
									</tr>
									<tr>
										<td class="border-top-0 border-bottom"><small
											class="text-muted"><fmt:formatDate
													value="${item.reviewDate}" pattern="yyyy-MM-dd" />에 작성된
												후기입니다.</small></td>
									</tr>
								</c:forEach>
							</table></td>
					</tr> --%>
					<tr>
						<td colspan="2">호스트 정보</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center"><input type="hidden"
							id="roomsId" name="roomsId" value="${selectedRoom.roomsId}"><input
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
	<script type="text/javascript">
		var output = '';
		$(document).ready(function() {
			getReviews(1);
		});

		// 리뷰를 가져온다
		function getReviews(i) {
			$
					.ajax({
						type : 'GET',
						url : "${pageContext.request.contextPath}/rooms/getReveiws?roomsId="
								+ $('#roomsId').val() + '&page=' + i,
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						dataType : 'JSON',
						success : function(json) {
							if (json.review.length == 0) {
								$('#review')
										.html('<tr><td>후기가 없습니다.</td></tr>');
							} else {
								for (i = 0; i < json.review.length; i++) {
									output += '<tr>';
									output += '<td rowspan="3" class="border-bottom border-right w-25 text-center align-middle"><h1>사진</h1>'
											+ json.review[i].userName + '</td>';
									output += '<td class="w-75"><small class="text-muted">';
									for (j = 0; j < json.review[i].scope; j++) {
										output += '★';
									}
									output += ' (' + json.review[i].scope + ')'
											+ '</small></td>';
									output += '</tr>';
									output += '<tr>';
									output += '<td class="border-top-0 border-bottom-0">'
											+ json.review[i].reviewContent
											+ '</td>';
									output += '</tr>';
									output += '<tr>';
									output += '<td class="border-top-0 border-bottom"><small class="text-muted">이 후기는 '
											+ json.review[i].reviewDate.substr(
													0, 4)
											+ '년 '
											+ json.review[i].reviewDate.substr(
													5, 2)
											+ '월 '
											+ json.review[i].reviewDate.substr(
													8, 2)
											+ '일'
											+ '에 작성되었습니다.</small></td>';
									output += '</tr>';
								}
								if (json.paging.currentPageNo < json.paging.lastPageNo) {
									// 출력할 것이 남은 경우
									var moreBtn = '<tr><td colspan="2" class="text-center align-middle"><input type="button" class="btn btn-danger" value="더보기" '
											+ 'onclick="getReviews('
											+ json.paging.nextPageNo
											+ ');"></td></tr>';
								}
								$('#review').html(output + moreBtn);
							}
							console.log(json.review);
						},
						error : function(error) {
							console.log("error : " + error);
						}
					});
		};
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