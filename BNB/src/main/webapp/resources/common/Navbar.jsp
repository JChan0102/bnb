<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					href="${pageContext.request.contextPath}/rooms">빵</a></li>
				<!-- 비로그인 상태 -->
				<li class="nav-item"><a class="nav-link text-dark" href="#">도움말</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="${pageContext.request.contextPath}/userReg">회원가입</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">로그인</a></li>
				<!--  로그인 상태 -->
				<li class="nav-item"><a class="nav-link text-dark" href="#">저장목록
				</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">호스팅
						시작하기</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">여행</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">메세지</a></li>
				<li class="nav-item"><a class="nav-link text-dark"
					href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">도움말</a></li>
			</ul>
		</div>
	</div>
	<!-- </nav> -->
</header>



</body>
</html>