<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/includeHead.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700" rel="stylesheet">
</head>
<body id="mainback">
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div class="row justify-content-between" style="margin:0px;">
		<div class="col-5">
			<h1 style="text-align: center;">당신의 숙소를 찾아보세요!</h1>
			<div id="booking" class="section">
		<div class="section-center">
			<div class="container">
				<div class="row">
					<div class="booking-form">
						<form>
							<div class="row no-margin">
								<div class="col-sm-6">
									<div class="form-group">
										<span class="form-label">Check In</span>
										<input class="form-control" type="date" required>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<span class="form-label">Check Out</span>
										<input class="form-control" type="date" required>
									</div>
								</div>
							</div>
							<div class="row no-margin">
								<div class="col-sm-6">
									<div class="form-group">
										<span class="form-label">성인</span>
										<select class="form-control">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
										<span class="select-arrow"></span>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<span class="form-label">어린이</span>
										<select class="form-control">
											<option>0</option>
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
										<span class="select-arrow"></span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<span class="form-label">목적지</span>
								<input class="form-control" type="text" placeholder="목적지를 입력하세요.">
							</div>
							<div class="form-group">
								<span class="form-label">Email</span>
								<input class="form-control" type="email" placeholder="Enter your email">
							</div>
							<div class="form-group">
								<span class="form-label">Phone</span>
								<input class="form-control" type="tel" placeholder="Enter your phone number">
							</div>
							<div class="form-btn">
								<button class="submit-btn">Book Now</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
		</div>
		<div class="col-3">
		<h1 style="text-align: center;">둘러보기</h1>
			<%-- <div class="card" style="top:10px;">
      			<div class="card-body">
      				<img src="${pageContext.request.contextPath}/resources/images/bed.jpg" style="width:100px;">
        			<h5 class="card-title">숙소</h5>
        			<p class="card-text">멋진 숙소를 둘러보세요</p>
        			<a href="#" class="btn btn-primary">보러가기</a>
      			</div>
   			</div> --%>
   			<a href="${pageContext.request.contextPath}/rooms">
   			<div class="card text-white" style="top:10px;">
   			<div class="img_overlay">
			  <img class="card-img" src="${pageContext.request.contextPath}/resources/images/bed.jpg" style="height: 200px;">
			</div>
			  <div class="card-img-overlay">
			    <h5 class="card-title"><b>숙소</b></h5>
			    <p class="card-text"><b>대한민국의 다양하고 멋진 숙소를 둘러보세요<br>여러분을 기다리고 있습니다!</b></p>
			  </div>
			</div>
			</a>
			
			<a href="https://korean.visitkorea.or.kr/main/main.html" target="_blank">
   			<div class="card text-white" style="margin-top:50px;">
   			<div class="img_overlay">
			  <img class="card-img" src="${pageContext.request.contextPath}/resources/images/trip.jpg" style="height: 200px;">
			</div>
			  <div class="card-img-overlay">
			    <h5 class="card-title"><b>관광지</b></h5>
			    <p class="card-text"><b>당신의 여행을 더 멋지게 만들어줄<br>관광지를 찾아보세요!</b></p>
			  </div>
			</div>
			</a>
		</div>
		<div class="col-3 text-center" style="float: right;">
			<div class="vis-weather">
			<h1>전국 날씨</h1>
				<ul class="list-group list-group-flush weather" style="/* margin-left:110px; */font-weight: 600;">  
					<!-- <li class="list-group-item weather"></li> -->
				</ul> 
			</div>
		</div>
	</div>
	<script>
		//crossDomain 해결코드
		$(function() {
			$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
				if (options.crossDomain && jQuery.support.cors) {
					options.url = "https://cors-anywhere.herokuapp.com/" + options.url;
				}
			});
		});

		$(document).ready(function() {
							var arr = [];
							var today = new Date();
							var week = new Array('일', '월', '화', '수', '목', '금', '토');
							var year = today.getFullYear();
							var month = today.getMonth() + 1;
							var day = today.getDate();
							var hours = today.getHours();
							var minutes = today.getMinutes();
							var hours_al = new Array('02', '05', '08', '11', '14', '17', '20', '23');
							var korea = [{'region': '서울' , 'nx': 60, 'ny':127},{'region':'인천', 'nx': 55, 'ny':124},
								{'region':'경기도', 'nx':60, 'ny':121},{'region':'강원도', 'nx':92, 'ny':131},
								{'region':'충청북도', 'nx':69, 'ny':106},{'region':'충청남도', 'nx':68, 'ny':100},
								{'region':'전라북도', 'nx':63, 'ny':89},{'region':'전라남도', 'nx':50, 'ny':67},
								{'region':'경상남도', 'nx':90, 'ny':77},{'region':'경상북도', 'nx':91, 'ny':106},
								{'region':'제주도', 'nx':52, 'ny':38}];

							/* $('.weather-date').html(
									month + "월 " + day + "일 "
											+ week[today.getDay()] + "요일"); */

							/* 동네예보 시간이 0200 0500 ... 3시간 단위로 23시까지 */
							for (var i = 0; i < hours_al.length; i++) {
								var h = hours_al[i] - hours;
								if (h == -1 || h == 0 || h == -2) {
									var now = hours_al[i];
								}
								if (hours == 00) {
									var now = hours_al[7];
								}
							}

							/* example
							 * 9시 -> 09시 변경 필요
							 */
							if (hours < 10) {
								hours = '0' + hours;
							}
							if (month < 10) {
								month = '0' + month;
							}
							if (day < 10) {
								day = '0' + day;
							}

							today = year + "" + month + "" + day;

							/* 좌표 */
							$.each(korea, function(j,k) {
							var _nx = korea[j].nx, _ny = korea[j].ny, region = korea[j].region,
							apikey = "mkLeHeg6pgfqAf5AwH2BUWGZpEaSvzXBgBHKy3FI%2FeeGh8xFUqZzbJqisqmc8xcSWCRu%2Fl31QlSR9Un8gMSCrg%3D%3D", ForecastGribURL = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData";
							ForecastGribURL += "?ServiceKey=" + apikey;
							ForecastGribURL += "&base_date=" + today;
							ForecastGribURL += "&base_time=" + now + "00";
							ForecastGribURL += "&nx=" + _nx + "&ny=" + _ny;
							arr.push({'url': ForecastGribURL, 'region':region});

							$.ajax({
										url : arr[j].url,
										type : 'GET',
										success : function(data) {
											var $data = $(data).find("response>body>items>item");
											var cate = '';
											var temp = '';
											var sky = '';
											var rain = ''; 

											$.each($data, function(i, o) {
																	cate = $(o).find("category").text(); // 카테고리 목록	

																if (cate == 'T3H') {
																	temp = $(this).find("fcstValue").text(); // 3시간 온도
																}
																if (cate == 'SKY') {
																	sky = $(this).find("fcstValue").text(); // 하늘상태
																}
																if (cate == 'PTY') {
																	rain = $(this).find("fcstValue").text(); // 강수형태
																}
											 });

											$('.weather').append('<li class="list-group-item weather_li'+j+'"></li>');
											$('.weather_li'+j).addClass('in'+j);
											$('.in'+j).html(temp + " ℃"); //온도 
											$('.in'+j).prepend(arr[j].region + '&emsp;');  // 지역이름

											if (rain != 0) {
												switch (rain) {
												case '1':
													$('.in'+j).append(" / 비");
													$('.in'+j).prepend('<i class="fas fa-cloud-showers-heavy"></i>&emsp;');
													break;
												case '2':
													$('.in'+j).append(" / 비/눈");
													$('.in'+j).prepend('<i class="fas fa-cloud-rain"></i>&emsp;');
													break;
												case '3':
													$('.in'+j).append(" / 눈");
													$('.in'+j).prepend('<i class="fas fa-snowflake"></i>&emsp;');
													break;
												}
											} else {
												switch (sky) {
												case '1':
													$('.in'+j).append(" / 맑음");
													$('.in'+j).prepend('<i class="fas fa-sun"></i>&emsp;');
													break;
												case '2':
													$('.in'+j).append(" / 구름조금");
													$('.in'+j).prepend('<i class="fas fa-cloud-sun"></i>&emsp;');
													break;
												case '3':
													$('.in'+j).append(" / 구름많음");
													$('.in'+j).prepend('<i class="fas fa-cloud"></i>&emsp;');													
													break;
												case '4':
													$('.in'+j).append(" / 흐림");
													$('.in'+j).prepend('<i class="fas fa-smog"></i>&emsp;');
													break;
												}
											}//if 종료
										}//success func 종료
							});
					});
		});
	</script>
	<!-- <div id="search"> 
		<h1 id="title">당신의 숙소를 검색하세요.</h1>
		<div id="search_content">
			<div class="search_wrap">
				<label for="target">목적지</label><br> <input type="text"
					id="target"><br>
			</div>
			<div class="search_wrap">
				<label for="checkin">체크인&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label><label
					for="checkout">체크아웃</label><br> <input type="text"
					id="checkin" style="width: 190px"> <input type="text"
					id="checkout" style="width: 190px"><br>
			</div>
			<div class="search_wrap">
				<label for="adult">성인&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>
				<label for="child">어린이</label> <br> <select>
					<option>인원 수</option>
					<option>1명</option>
					<option>2명</option>
				</select> <select>
					<option>인원 수</option>
					<option>1명</option>
					<option>2명</option>
				</select>
				<div class="search_wrap">
					<br> <input type="button" value="검색하기">
				</div>
			</div>
		</div>
	</div> -->
</body>
</html>