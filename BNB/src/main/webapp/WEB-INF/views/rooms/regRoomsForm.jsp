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
			$('input:checkbox[name^=amcb]').change(function() {
				var check = '';
				$('input:checkbox[name^=amcb]').each(function() {
					if ($(this).is(':checked')) {
						check = check + 'T';
					} else {
						check = check + 'F';
					}
				});
				$('#amenities').val(check);
			});

		});
		$(function() {
			$("#uploadbutton")
					.click(
							function() {
								var form = $('#modiform')[0];
								var formData = new FormData(form);
								$
										.ajax({
											url : 'http://13.209.99.134:8080/imgserver/upload/userPhoto',
											processData : false,
											contentType : false,
											datatype : 'JSON',
											data : formData,
											type : 'POST',
											success : function(result) {
												$('#userPhoto')
														.val('' + result);
												$('#modiform').submit();
											}
										});
							});
		})
	</script>
	</script>
	<%@ include file="/resources/common/Navbar.jsp"%>
	<!-- Begin page content -->
	<!-- https://shaack.com/projekte/bootstrap-input-spinner/ -->
	<main role="main" class="container">
	<div class="row justify-content-md-center">
		<div class="col col-md-10 col-lg-8">
			<h1>
				<b>숙소 등록</b>
			</h1>
			<form method="post" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<td>호스트 아이디</td>
						<td><input type="text" class="form-control text-center"
							readonly="readonly" value="${loginUser.userId}" id="hostId"
							name="hostId"></td>
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
						<td><input type="text" class="form-control text-center"
							value="0" min="0" max="100" step="1" id="avail_children"
							name="avail_children" readonly="readonly"></td>

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
						<td><c:set var="count" value="0" /> <c:set var="divideChk"
								value="1" /> <c:forEach items="${amenities}" var="item">
								<c:set var="count" value="${count+1}" />
								<c:if
									test="${divideChk ne (item.amenities_idx-(item.amenities_idx mod 100))/100}">
									<hr>
									<c:set var="divideChk"
										value="${(item.amenities_idx-(item.amenities_idx mod 100))/100}" />
								</c:if>
								<input type="checkbox" id="amcb${count}" name="amcb${count}"
									class="form-control-input">
								<label for="amcb${count}" class="form-check-label">${item.amenities_details}</label>
								<br>
							</c:forEach><input type="hidden" class="form-control"
							value="<c:forEach begin="1" end="${count}" step="1">F</c:forEach>"
							id="amenities" name="amenities"></td>
					</tr>
					<tr>
						<td>체크인</td>
						<td><input type="time" class="form-control" id="time_checkin"
							name="time_checkin" value="14:00"></td>
					</tr>
					<tr>
						<td>체크아웃</td>
						<td><input type="time" class="form-control"
							id="time_checkout" name="time_checkout" value="12:00"></td>
					</tr>
					<tr>
						<td>주중가격</td>
						<td><input type="number" class="form-control"
							id="price_weekdays" name="price_weekdays" value="0" min="0"
							max="1000000000" step="1000"></td>
					</tr>
					<tr>
						<td>주말가격</td>
						<td><input type="number" class="form-control"
							id="price_weekend" name="price_weekend" value="0" min="0"
							max="1000000000" step="1000" class="form-control"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" class="form-control" id="address"
							name="address" required="required"></td>
					</tr>
					<tr>
						<td colspan="2"><div id="map"
								style="width: 100%; height: 500px;"></div></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input-group mb-3">
								<!-- <div class="custom-file">
									<input type="file" class="custom-file-input"
										id="inputGroupFile02"> <label
										class="custom-file-label" for="inputGroupFile02"
										aria-describedby="inputGroupFileAddon02">Choose file</label>
								</div>
								<div class="input-group-append">
									<span class="input-group-text" id="inputGroupFileAddon02">Upload</span>
								</div> -->
								
								
								
								
								
								
								<!-- The file upload form used as target for the file upload widget -->
		<form id="fileupload" action="https://jquery-file-upload.appspot.com/"
			method="POST" enctype="multipart/form-data">
			<!-- Redirect browsers with JavaScript disabled to the origin page -->
			<noscript>
				<input type="hidden" name="redirect"
					value="https://blueimp.github.io/jQuery-File-Upload/">
			</noscript>
			<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
			<div class="row fileupload-buttonbar">
				<div class="col-lg-7">
					<!-- The fileinput-button span is used to style the file input field as button -->
					<span class="btn btn-success fileinput-button"> <i
						class="glyphicon glyphicon-plus"></i> <span>파일 추가</span> <input
						type="file" name="files[]" multiple>
					</span>
					<button type="submit" class="btn btn-primary start">
						<i class="glyphicon glyphicon-upload"></i> <span>업로드</span>
					</button>
					<button type="reset" class="btn btn-warning cancel">
						<i class="glyphicon glyphicon-ban-circle"></i> <span>업로드 취소</span>
					</button>
					<button type="button" class="btn btn-danger delete">
						<i class="glyphicon glyphicon-trash"></i> <span>파일 삭제</span>
					</button>
					<input type="checkbox" class="toggle">
					<!-- The global file processing state -->
					<span class="fileupload-process"></span>
				</div>
				<!-- The global progress state -->
				<div class="col-lg-5 fileupload-progress fade">
					<!-- The global progress bar -->
					<div class="progress progress-striped active" role="progressbar"
						aria-valuemin="0" aria-valuemax="100">
						<div class="progress-bar progress-bar-success" style="width: 0%;"></div>
					</div>
					<!-- The extended global progress state -->
					<div class="progress-extended">&nbsp;</div>
				</div>
			</div>
			<!-- The table listing the files available for upload/download -->
			<table role="presentation" class="table table-striped">
				<tbody class="files"></tbody>
			</table>
		</form>
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center"><input type="hidden"
							id="roomsId" name="roomsId" value="0"><input
							type="hidden" id="disabled" name="disabled" value="1"> <input
							type="submit" class="btn btn-danger" value="등록하기"></td>
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