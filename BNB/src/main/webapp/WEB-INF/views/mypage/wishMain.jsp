<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WishList</title>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body style="background-color: #EEEEEE;">
	<%@ include file="/resources/common/Navbar.jsp"%>
	<div id="mypage_wrap_cont" class="row">
		<%@ include file="/WEB-INF/views/mypage/leftlist.jsp"%>
		<div id="mypage_cont" class="col-9">
			<h1 style="text-align: center; padding: 10px; font-weight: 800;">
				<i class="far fa-grin-hearts"></i> WISH LIST
			</h1>
			<div id="wish_wrap">
				<div class="row">
					<c:forEach var="wd" items="${wishDiv}">
						<div class="col-4">
							<a
								href="${pageContext.request.contextPath}/wishList?userId=${loginUser.userId}&address=${wd.address}"
								style="text-align: center; font-size: 18px; text-decoration: none; color: black;"
								class="wish_div">
								<div class="card border-light wish_hover"
									style="height: 200px; margin-bottom: 20px; overflow: hidden;">
									<c:forEach var="img" items="${wishDivImg}">
										<c:if test="${wd.address == img.address}">
											<img class="card-img divImg"
												src="http://13.209.99.134:8080/imgserver/resources/upload/${img.filename}"
												style="width: 100%; object-fit: contain; opacity:0.7;vertical-align: middle; /*filter:blur(1px); */">
										</c:if>
									</c:forEach>
									<div class="card-img-overlay">
										<div class="card-body" style="padding:0px;">
											<span class="card-text"
												style="float: right; font-size: 18px; font-weight: 600;">
												<i class="fas fa-heart" style="color: #ff3232;"></i> <span
												id="idx"></span>개
											</span><br> <br> <input
												class="form-control-plaintext wishAddress text-center"
												name="address" style="font-weight: 600;font-size: 25px;" value="${wd.address}" readonly />
										</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			var wishList = $('.wishAddress');
			var arr = [];
			for (var i = 0; i < wishList.length; i++) {
				/* console.log($("input[name='address']").eq(i).val());  */
				arr.push($("input[name='address']").eq(i).val());
			}

			var jsonInfo = JSON.stringify(arr);

			for (var j = 0; j < wishList.length; j++) {
				$("span[id='idx']").eq(j).addClass("wishIdx" + j);
				/* console.log($("span[id='idx']").eq(j).addClass("wishIdx" + j));  */
			}

			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/wishCnt',
				contentType : 'application/json',
				data : jsonInfo,
				success : function(response) {
					/* console.log(response);  */
					var obj = JSON.parse(response);
					$.each(obj, function(key, val) {
						for (var i = 0; i < wishList.length; i++) {
							var loc = $("input[name='address']").eq(i).val();
							if (loc == key) {
								/* console.log(loc);
								console.log($('.wishIdx' + i).text(val));  */
								$('.wishIdx' + i).text(val);
							}
						}
					});
				}
			});
		});
	</script>
</body>
</html>