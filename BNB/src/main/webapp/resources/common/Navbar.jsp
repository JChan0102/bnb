<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header>


	<!-- https://work.smarchal.com/twbscolor/css/e74c3cc0392becf0f1ffbbbc0 -->
	<!--  -->
	<!-- <nav class="navbar transparent navbar-inverse"> -->
	<div
		class="navbar navbar-expand-md navbar-light fixed-top bg-white border-bottom">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
			src="${pageContext.request.contextPath}/resources/images/logo.png"
			id="logo"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="nav justify-content-end ml-auto">
				<!-- 임시 -->
				<li class="nav-item"><a class="nav-link text-dark"
					href="${pageContext.request.contextPath}/reservation">예약 임시</a></li>
				<!-- 임시 -->
				<li class="nav-item"><a class="nav-link text-dark"
					href="${pageContext.request.contextPath}/rooms">숙소</a></li>
				<!-- 비로그인 상태 -->
				<li class="nav-item"><a class="nav-link text-dark" href="#">도움말</a></li>

				<c:if test="${loginUser eq null}">
					<li class="nav-item"><a class="nav-link text-dark"
						href="${pageContext.request.contextPath}/userReg">회원가입</a></li>
					<!-- <button class="btn btn-default" data-target="#layerpop" data-toggle="modal">로그인</button> -->

					<li class="nav-item"><a class="nav-link text-dark"
						data-target="#layerpop" data-toggle="modal"
						href="${pageContext.request.contextPath}/login">로그인</a></li>
				</c:if>

				<!--  로그인 상태 -->
				<c:if test="${loginUser ne null}">
					<li class="nav-item"><a class="nav-link text-dark" href="#">호스팅
							시작하기</a></li>
					<li class="nav-item text-dark dropdown"><a
						class="nav-link  dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 알림<span class="badge badge-secondary"
							id="jchannotice">
							<c:if test="${sessionScope.NewmessageCk ne 0}">new</c:if></span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">1</a> <a class="dropdown-item"
								href="#">2</a> <a class="dropdown-item" href="#">3</a> <a
								class="dropdown-item" href="#">4</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/chat/list">더보기..</a>
						</div></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
				</c:if>

			</ul>
		</div>
	</div>
	<!-- </nav> -->
</header>

<script type="text/javascript">
	connect();

	function connect() {
		sockg = new SockJS('/chat');
		sockg.onopen = function() {
			console.log('open');
		};
		sockg.onmessage = function(evt) {
			var data = evt.data;
			console.log(data);
			var obj = JSON.parse(data);
			if ((obj.userId == '${sessionScope.loginUser.userId}' && obj.receive == 'U')
					|| (obj.hostId == '${sessionScope.loginUser.userId}' && obj.receive == 'H')) {
				$('#jchannotice').html('New');

				$.toast({
					text : "NewMessage", // Text that is to be shown in the toast
					heading : 'Note', // Optional heading to be shown on the toast
					showHideTransition : 'slide', // fade, slide or plain
					allowToastClose : true, // Boolean value true or false
					hideAfter : 5000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
					stack : 7, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
					position : 'bottom-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values

					bgColor : '#eeeeee', // Background color of the toast
					textColor : '#2c2c2c', // Text color of the toast
					textAlign : 'left', // Text alignment i.e. left, right or center
					loader : false, // Whether to show loader or not. True by default
					loaderBg : '#9EC600', // Background color of the toast loader
					beforeShow : function() {
					}, // will be triggered before the toast is shown
					afterShown : function() {
					}, // will be triggered after the toat has been shown
					beforeHide : function() {
					}, // will be triggered before the toast gets hidden
					afterHidden : function() {
					} // will be triggered after the toast has been hidden
				});
			}

		};
	}
</script>
<!-- 모달 테스트 -->
<div class="modal fade" id="layerpop">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- header title -->
				<h4 class="modal-title">Login Modal</h4>
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<!-- body -->
			<div class="modal-body">
				<form action="${pageContext.request.contextPath}/login"
					method="post">
					아이디 : <input type="text" name="userId"
						placeholder="example@example.com"
						value="${cookie.cookieUserId.value}" /> <br> 비밀번호 : <input
						type="password" name="userPw" /> <br> Remember Me! <input
						type="checkbox" name="rememberMe"
						<c:if test="${cookie.cookieUserId ne null}">
                            checked
                        </c:if> />
					<input type="submit" value="로그인" />
				</form>
			</div>
			<!-- Footer -->
			<div class="modal-footer">BIBIBIT 대한민국 숙박정보 BnB</div>
		</div>
	</div>
</div>
<!-- 모달 테스트 끝 -->