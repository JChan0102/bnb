<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WishList</title>
<%@ include file="/resources/common/includeHead.jsp"%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=RjRRELdZtqF2DId12vbe&submodules=geocoder"></script>
</head>
<body style="background-color: #EEEEEE;">
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div id="mypage_wrap_cont">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="mypage_cont" class="text-center">
			<h1 style="text-align: center; padding: 10px; font-weight: 800;">
				<i class="far fa-grin-hearts"></i> WISH LIST
			</h1>
			<div class="row" style="height: 450px; width: 900px; margin: 0 auto;">
				<div class="col-6" style="overflow: scroll">
					<h2 style="font-weight: 600;">${address}</h2>
					<br>
					<c:forEach var="wl" items="${wishList}">
						<div class="card" style="margin-bottom: 20px;">
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/resources/images/짱짱절미.jpg"
								alt="Card image cap">
							<div class="card-body">
								<h6 class="card-title">
									<b>${wl.hostId}</b>님의 숙소
								</h6>
								<p class="card-text" id="price">￦ ${wl.price_weekdays} ~
									${wl.price_weekend} /박</p>
								<p class="card-text">리뷰평균(리뷰수)</p>
								<a
									href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${wl.roomsId}"
									class="btn btn-primary">보러가기</a>
							</div>
							<input type="hidden" value="${wl.address}" id="de_add"
								class="de_add" name="address">
						</div>
					</c:forEach>
				</div>
				<div class="col-6" id="map"></div>
			</div>
			<br>
			<button onclick="javascript:history.back();"
				class="btn btn-outline-secondary" style="margin: 10px;">목록으로</button>
			<br> <br>
		</div>
	</div>
	<script>
		$(function() {
			$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
				if (options.crossDomain && jQuery.support.cors) {
					options.url = "https://cors-anywhere.herokuapp.com/"
							+ options.url;
				}
			});
		});
		//지도를 삽입할 HTML 요소 또는 HTML 요소의 id를 지정합니다.
		var mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일

		/* var map = new naver.maps.Map(mapDiv, {
		    zoom: 11, //지도의 초기 줌 레벨
		    });  */
		var map = new naver.maps.Map(mapDiv);
		var myaddress = '';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		var wishList = $('.de_add');

		for (var i = 0; i < wishList.length; i++) {
			myaddress = $("input[name='address']").eq(i).val();

			console.log(myaddress);
				naver.maps.Service.geocode({
					address : myaddress
				}, function(status, response) {
					if (status !== naver.maps.Service.Status.OK) {
						return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
					}
					var result = response.result;
					console.log(result);
					// 검색 결과 갯수: result.total
					// 첫번째 결과 결과 주소: result.items[0].address
					// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
					var myaddr = new naver.maps.Point(result.items[i].point.x, result.items[i].point.y);
					/* map.setCenter(myaddr); */ // 검색된 좌표로 지도 이동
					// 마커 표시
					var marker = new naver.maps.Marker({
						position : myaddr,
						map : map
					});
					// 마커 클릭 이벤트 처리
					/* naver.maps.Event.addListener(marker, "click", function(e) {
						if (infowindow.getMap()) {
							infowindow.close();
						} else {
							infowindow.open(map, marker);
						}
					});
					// 마크 클릭시 인포윈도우 오픈
					var infowindow = new naver.maps.InfoWindow({
						content : ''
					}); */
				}); 
			}
	</script>
</body>
</html>