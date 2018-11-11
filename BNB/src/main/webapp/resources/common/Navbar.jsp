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

					<li class="nav-item"><a id="login_go" class="nav-link text-dark"
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
						aria-expanded="false" onclick="getListmessage()"> 알림<span class="badge badge-secondary"
							id="jchannotice">
							<c:if test="${sessionScope.NewmessageCk ne 0}">new</c:if></span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#" id="list1"></a>
							<a class="dropdown-item" href="#" id="list2"></a>
							<a class="dropdown-item" href="#" id="list3"></a>
							<a class="dropdown-item" href="#" id="list4"></a>
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
			if ((obj.userId == '${sessionScope.loginUser.userId}' && obj.receive == 'U')){
				toastMessage(obj.messagecontent, obj.hostId)

			}  else if((obj.hostId == '${sessionScope.loginUser.userId}' && obj.receive == 'H')) {

                toastMessage(obj.messagecontent, obj.userId)
                }
			function toastMessage(msg,sender){
				$('#jchannotice').html('New');
					if(msg.length>10){
					    msg = msg.substring(9,0)+'...';
                    }
				$.toast({
					text : msg, // Text that is to be shown in the toast
					heading : 'NewMessage ( '+sender+' ) ', // Optional heading to be shown on the toast
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

	function getListmessage() {
        $.ajax({
            url: '${pageContext.request.contextPath}/chat/unreadlist',
            type: 'get',
            datatype: 'json',
            success: function (data) {
                var listindex=1;
                $(data).each(function (key, value){
                    msg= value.messagecontent;
                if(value.messagecontent.length>10){
                    msg = msg.substring(9,0)+'...';
                }
                   if(value.userId=='${sessionScope.loginUser.userId}'&&value.receive=='U'){
						$('#list'+listindex).text(value.hostId+' : '+msg + ' ('+value.unreadCount+')' );
						listindex++;
                   }
                   if(value.hostId=='${sessionScope.loginUser.userId}'&&value.receive=='H'){
                       $('#list'+listindex).text(value.userId+' : '+msg + ' ('+value.unreadCount+')' );
                       listindex++;
                   }
                   if(listindex==5){
                       return false;
                   }
                });
            },
            error: function () {
                alert(error);
            }
        });
    }
</script>
<!-- 로그인 모달-->
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
			
			<main role="main" class="container">
		<div class="row justify-content-md-center">
			<div class="col col-md-4 col-lg-8">
					<label class="form-check-label mt-2 mb-2">아이디 :</label> <input
						type="email" id="input_userId" name="userId" class="form-control"
						placeholder="example@example.com" value="${cookie.cookieUserId.value}" />
						
						<div id="loginHidden" style="display: none; color: #dc3545;" ></div>
						
					<label class="form-check-label mt-2 mb-2">비밀번호 :</label><input
						type="password" id="input_userPw" name="userPw" class="form-control" />
					<label class="form-check-label mt-2 mb-2">Remember Me! </label>
					<input type="checkbox" id="chk_rememberMe" name="rememberMe" 
						<c:if test="${cookie.cookieUserId ne null}">
                            checked
                        </c:if>
						class="form-control-input" />
					<button id="btn_login" class="btn btn-lg btn-danger btn-block" type="button">
					로그인</button>
			
							</div>
						</div>
					</main>
				</div>
			
			<!-- Footer -->
			<div class="modal-footer">BIBIBIT 대한민국 숙박정보 BnB</div>
		</div>
	</div>
</div>
<!-- 로그인 모달 끝 -->

<!-- 로그인 관련 스크립트 -->
<script>

$('#login_go').click(function(){
	
	if(${cookie.cookieUserId == null}){
		$('#input_userId').val("");
	}
	
	$('#input_userPw').val("");
	$('#input_userPw').val("");
	$('#loginHidden').css("display","none");
});

$('#chk_rememberMe').click(function(){
	var chk = $('#chk_rememberMe'); 
	alert(chk.is(':checked'));
	
});


$('#btn_login').click(function() {
	
	$('#loginHidden').empty();
	
          var userId = $('#input_userId').val();
          var userPw = $('#input_userPw').val();
          var rememberMe = $('#chk_rememberMe').is(':checked');
          var result = "";

          alert(rememberMe);
          
          $.ajax({
              type : "POST",
              url : "login",
              data : {"userId" : userId,
            	  	  "userPw" : userPw,
            	  	  "rememberMe" : rememberMe},
              success : function(result) {
                if (result == 'loginFail') {
          			$('#loginHidden').css("display","");
          			$('#loginHidden').append("아이디와 비밀번호를 확인하세요");
                  } else {
                      location.href = '${pageContext.request.contextPath}/';
                  }
              }
          })
});
</script>
<!-- 로그인 스크립트 끝 -->
