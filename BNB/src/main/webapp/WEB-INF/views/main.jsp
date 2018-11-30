<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/includeHead.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body id="mainback">
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div class="row justify-content-md-center">
		<div class="col-6">
			<h1>둘러보기</h1>
		</div>
		<div class="col-4 text-center">
			<div class="vis-weather">
				<h1 class="vh_hide">전국 실시간 날씨정보</h1>
				<p class="weather-date"></p> 
				<ul class="list-group list-group-flush weather">  
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

							$('.weather-date').html(
									month + "월 " + day + "일 "
											+ week[today.getDay()] + "요일");

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
							console.log(ForecastGribURL)
							arr.push({'url': ForecastGribURL, 'region':region});
							/* region_arr.push(region); */
							/* }); */


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
																	/* console.log($cate); */

																if (cate == 'T3H') {
																	temp = $(this).find("fcstValue").text(); // 3시간 온도
																	/* console.log(temp); */
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
													$('.in'+j).append("비");
													$('.in'+j).append('&emsp;<i class="fas fa-cloud-showers-heavy"></i>');
													break;
												case '2':
													$('.in'+j).append("비/눈");
													$('.in'+j).append('&emsp;<i class="fas fa-cloud-rain"></i>');
													break;
												case '3':
													$('.in'+j).append("눈");
													$('.in'+j).append('&emsp;<i class="fas fa-snowflake"></i>');
													break;
												}
											} else {
												switch (sky) {
												case '1':
													$('.in'+j).append(" / 맑음");
													$('.in'+j).append('&emsp;<i class="fas fa-sun"></i>');
													break;
												case '2':
													$('.in'+j).append(" / 구름조금");
													$('.in'+j).append('&emsp;<i class="fas fa-cloud-sun"></i>');
													break;
												case '3':
													$('.in'+j).append(" / 구름많음");
													$('.in'+j).append('&emsp;<i class="fas fa-cloud"></i>');													
													break;
												case '4':
													$('.in'+j).append(" / 흐림");
													$('.in'+j).append('&emsp;<i class="fas fa-smog"></i>');
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