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
					href="${pageContext.request.contextPath}/reservation?roomsId=3">예약 임시</a></li>
				<!-- 임시 -->
				<li class="nav-item"><a class="nav-link text-dark"
					href="${pageContext.request.contextPath}/rooms">숙소</a></li>
				<!-- 비로그인 상태 -->
				<li class="nav-item"><a class="nav-link text-dark" href="#">도움말</a></li>

				<c:if test="${loginUser eq null}">
					<li class="nav-item"><a class="nav-link text-dark"
						href="${pageContext.request.contextPath}/userReg">회원가입</a></li>
					<!-- <button class="btn btn-default" data-target="#layerpop" data-toggle="modal">로그인</button> -->

					<li class="nav-item"><a id="login-go" class="nav-link text-dark"
						data-target="#layerpop" data-toggle="modal"
						href="#">로그인</a></li>
				</c:if>

				<!--  로그인 상태 -->
				<c:if test="${loginUser ne null}">
					<c:choose>
						<c:when test="${loginUser.host eq 0}">
							<li class="nav-item"><a class="nav-link text-dark" href="#">호스팅
								시작하기</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link text-dark" href="${pageContext.request.contextPath}/hostpage/main">호스트 페이지</a></li>
						</c:otherwise>
						
					</c:choose>
					<li class="nav-item"><a class="nav-link text-dark" href="#" onclick="getListmessage()">알림 <span class="badge badge-secondary" id="jchannotice" style="display: none">new</span></a></li>

				<c:if test="${loginUser.admin eq 1 }">		
					<li class="nav-item"><a class="nav-link text-dark"
						href="${pageContext.request.contextPath}/admin">관리페이지</a></li>
				</c:if>		
				<c:if test="${loginUser.admin eq 0 }">		
					<li class="nav-item"><a class="nav-link text-dark"
						href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
				</c:if>
						
					<li class="nav-item"><a class="nav-link text-dark" 
						href="${pageContext.request.contextPath}/logout">로그아웃</a></li>

					<script type="text/javascript">
                        connect();

                        function connect() {
                            sockg = new SockJS('${pageContext.request.contextPath}/chat');
                            sockg.onopen = function() {
                                console.log('open');
                            };
                            sockg.onmessage = function(evt) {
                                var data = evt.data;
                                var obj = JSON.parse(data);
                                if ((obj.userId == '${sessionScope.loginUser.userId}' && obj.receive == 'U')){
                                    toastMessage(obj.messagecontent, obj.hostId);
                                }  else if((obj.hostId == '${sessionScope.loginUser.userId}' && obj.receive == 'H')) {
                                    toastMessage(obj.messagecontent, obj.userId);
                                }
                                function toastMessage(msg,sender){
                                    $('#jchannotice').css('display','inline');
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
                                        position : 'bottom-left', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
                                        bgColor : '#eeeeee', // Background color of the toast
                                        textColor : '#2c2c2c', // Text color of the toast
                                        textAlign : 'left', // Text alignment i.e. left, right or center
                                        loader : false, // Whether to show loader or not. True by default
                                        loaderBg : '#9EC600', // Background color of the toast loader
										icon: info,
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
                        getListmessage();

                        function getListmessage() {

                            $('#frame').css('z-index',200);
							$('#frame').css('visibility','visible');

                            $.ajax({
                                url: '${pageContext.request.contextPath}/chat/list',
                                type: 'get',
                                datatype: 'json',
                                success: function (data) {
                                 var str = '';
                                    $(data).each(function (key, value){
                                     if(value.userId =='${loginUser.userId}'){
										str +='<li class="contact" onclick="getDBMessage(\''+value.userId+'\',\''+value.hostId+'\',\''+value.roomsId+'\',\''+value.hostName+'\',\''+value.hostPhoto+'\')" > <div class="wrap">';
											if(value.readCk=='F'&& value.receive=='U'){
											    str+='<span class="contact-status online"></span>';
											}
                                                <%--${list.hostPhoto}로 바꿔야함--%>
                                            str+='<img src="${pageContext.request.contextPath}/resources/images/userphoto/nopic.jpg" alt=""/>' +
                                                '<div class="meta">' +
                                                '<p class="name">'+value.hostName+'('+value.roomsId+')</p>' +
                                                '<p class="preview">'
												if(value.receive == 'U'){
												    str+= 'you';
                                                }else{
                                                    str+= 'me';
                                                }
												str+= ' : '+value.messagecontent+'</p>';
											} else {
                                            str +='<li class="contact" onclick="getDBMessage(\''+value.userId+'\',\''+value.hostId+'\',\''+value.roomsId+'\',\''+value.userName+'\',\''+value.userPhoto+'\')" > <div class="wrap">';
                                            if(value.readCk=='F'&& value.receive=='H'){
                                                str+='<span class="contact-status online"></span>';
                                            }
                                            <%--${list.hostPhoto}로 바꿔야함--%>
                                            str+='<img src="${pageContext.request.contextPath}/resources/images/userphoto/nopic.jpg" alt=""/>' +
                                                '<div class="meta">' +
                                                '<p class="name">'+value.userName+'('+value.roomsId+')</p>' +
                                                '<p class="preview">'
                                            if(value.receive == 'H'){
                                                str+= 'you';
                                            }else{
                                                str+= 'me';
                                            }
                                            str+= ' : '+value.messagecontent+'</p>';
                                    }
                                    str+='</div></div></li>'
								});
                             $('#contacts ul').html(str);
                        },
                                error: function () {
                                    alert(error);
                                }
                            });
                            }
					</script>

				</c:if>

			</ul>
		</div>
	</div>
	<!-- </nav> -->
</header>

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
				<div class="container">
					<div class="row justify-content-md-center">
						<div id="h-ready" class="col col-md-4 col-lg-8">
							
							<label class="form-check-label mt-2 mb-2">아이디 :</label>
							<input type="email" id="input_userId" name="userId" class="form-control"
								placeholder="example@example.com" value="${cookie.cookieUserId.value}" />
							<div id="loginHidden" style="display: none; color: #dc3545;" ></div>

							<label class="form-check-label mt-2 mb-2">비밀번호 :</label>
							<input type="password" id="input_userPw" name="userPw" class="form-control" />
							<label class="form-check-label mt-2 mb-2">Remember Me! </label>
							<input type="checkbox" id="chk_rememberMe" name="rememberMe"
								<c:if test="${cookie.cookieUserId ne null}">
                            		checked
                       			 </c:if>
								class="form-control-input" />
							<button id="btn-login" class="btn btn-lg btn-danger btn-block" type="button">
								로그인</button>
						<br>
						<!-- <div class="g-signin2" data-onsuccess="onSignIn"  style="width:auto;"></div> -->
						 <input type="button" id="gLoginBtn" value="Login With Google" style="width: 100%; height: 47px;"/>
						</div>
					</div>
				</div>
					
			</div>
			<!-- Footer -->
				<div class="modal-footer">BIBIBIT 대한민국 숙박정보 BnB</div>
		</div>
	</div>
</div>
<!-- 로그인 모달 끝 -->


<!-- 회원가입 선택 모달 시작 -->

<div class="modal fade" id="regchoicelayerpop">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- header title -->
				<h4 class="modal-title">회원가입하기</h4>
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<!-- body -->
			<div class="modal-body">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col col-md-4 col-lg-8">
							<button id="btn-regEmail" class="btn btn-lg btn-danger btn-block" type="button">
								이메일로 회원 가입</button>
							<button id="btn-regGoogle" class="btn btn-lg btn-danger btn-block" type="button">
								구글 계정으로 회원 가입</button>
						</div>
					</div>
				</div>
					
			</div>
			<!-- Footer -->
				<div class="modal-footer">BIBIBIT 대한민국 숙박정보 BnB</div>
		</div>
	</div>
</div>

<!-- 회원가입 선택 모달 끝 -->

<!-- 로그인 관련 스크립트 -->
<script>
	
$('#login-go').click(function(){
	
	var userCookie = '${cookieUserId}';

	/* if(${cookie.cookieUserId eq null}){
		$('#input_userId').val("");
	} */

	if(userCookie == null){
		$('#input_userId').val("");
	}
	
	$('#input_userPw').val("");
	$('#loginHidden').css("display","none");


});

$('#layerpop').on('shown.bs.modal', function(){

	if($('#input_userId').val() == null){
   		$('#input_userId').focus();
	}else{
		$('#input_userPw').focus();
	}
});


$('#input_userPw').keypress(function(event){
	if(event.which == 13){
		$('#btn-login').click();
		return false;
	}
});

$('#btn-login').click(function loginModal() {

          var userId = $('#input_userId').val();
          var userPw = $('#input_userPw').val();
          var rememberMe = $('#chk_rememberMe').is(':checked');
          var result = "";

          $.ajax({
              type : "POST",
              url : "${pageContext.request.contextPath}/login",
              data : {"userId" : userId,
            	  	  "userPw" : userPw,
            	  	  "rememberMe" : rememberMe},
              success : function(result) {
            	  $('#loginHidden').empty();
                if (result == 'loginFail') {
          			$('#loginHidden').css("display","");
          			$('#loginHidden').append("아이디와 비밀번호를 확인하세요");
                  } else if (result == 'userKeyConfirm'){
                	$('#loginHidden').css("display","");
            		$('#loginHidden').append("인증되지 않은 회원입니다. 이메일을 확인해주세요.");
                  } else if(result == 'google') {
                	$('#loginHidden').css("display","");
              		$('#loginHidden').append("구글을 통해 만든 계정이 이미 있습니다.<br> 구글로 로그인하세요.");
                  } else if(result == 'loginSuccess'){
                      location.href = '${pageContext.request.contextPath}/';
                  }
              }
          })
});


/*
// 구글 로그인 상태 체크
function chkGLoginStatus(){
	var gLoginBtn = $('#gLoginBtn');
	
	if(gauth.isSignedIn.get()){
		console.log('logined');
		var profile = gauth.currentUser.get().getBasicProfile();
		console.log(profile.getEmail());
	}else{
		console.log('unLogined');
		gLoginBtn.val('Login With Google');
	}
}
*/

// auth2.0 초기화 / 버튼설정
function init(){
	console.log('init');
	gapi.load('auth2', function() {
		console.log('auth2');
		window.gauth = gapi.auth2.init({
			 client_id: '173449746481-er69j4j9c3d2im90aprllmfr7jcpcs71.apps.googleusercontent.com'
		})
		gauth.then(function(){
			console.log('googleAuth Success');
			/* chkGLoginStatus(); */
		}, function(){
			console.log('googleAuth Fail');
		});
	});
}


$('#gLoginBtn').click(function(){
	
	// if(this.value == 'Login With Google'){
		gauth.signIn().then(function(){
			console.log('구글로그인 성공');
			/* chkGLoginStatus(); */
			
			var profile = gauth.currentUser.get().getBasicProfile();
			var gMail = profile.getEmail();
			var gName = profile.getName();
			var gPhoto = profile.getImageUrl();
			
			
			 $.ajax({
	              type : "POST",
	              url : "${pageContext.request.contextPath}/googleLogin",
	              data : {"gId" : gMail},
	              success : function(result) {
	            	$('#loginHidden').empty();
	              	console.log('구글로그인 ajax 결과 : ' + result);
	            	 if(result == 'googleLoginSuccess'){ // 구글아이디로 로그인 성공할경우
	              		
	            		 console.log('가입된 회원. 구글로그인 완료');
	            	   // 메인화면가기
	            		location.href = '${pageContext.request.contextPath}/';
	            	   
	               } else if(result == 'notGoogleUser'){ // 이미 동일아이디로 일반계정이 존재할경우
	            	   
	            	  // 일반계정으로 로그인 요청
	            	  $('#loginHidden').css("display","");
	            	  $('#loginHidden').append("일반 게정으로 가입되어 있습니다. 로그인해주세요.");
	            	   
	               } else if(result == 'googleUserReg'){ // 해당계정이 없는경우
	            	   
	            	   alert('로그인하신 구글 로그인 계정은 존재하지 않습니다. 회원 가입 하세요.');
	            	   // 구글계정용 회원가입폼 띄워주기
	            	   //location.href = '${pageContext.request.contextPath}/googleReg?gMail='+gMail;
	            	   $('#layerpop').modal('hide');
					   $('#regchoicelayerpop').modal();
					   
					   $('#btn-regEmail').click(function(){
							location.href = '${pageContext.request.contextPath}/userReg';
						});

					   $('#btn-regGoogle').click(function(){
							location.href = '${pageContext.request.contextPath}/googleReg?gMail='+gMail+'&gName='+gName+'&gPhoto='+gPhoto;
						});
	               }
	              }
	          });
		});
	/* } else {
		gauth.signOut().then(function(){
			console.log('gauth.signOut()');
			 chkGLoginStatus(); 
		});
	} */
});


/* function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	} */


	/* var xhr = new XMLHttpRequest();
	xhr.open('POST', 'googleLogin');
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.onload = function() {
	  console.log('Signed in as: ' + xhr.responseText);
	};
	xhr.send('gId=' + google_email); */
//}
	/* $.ajax({
              type : "POST",
              url : "googleLogin",
              data : {"gId" : google_email},
              success : function(result) {
              	alert(result);
            	 if(result == 'googleLoginSuccess'){ // 구글아이디로 로그인 성공할경우
              		
            	   // 메인화면가기
            		location.href = '${pageContext.request.contextPath}/';
            	   
               } else if(result == 'notGoogleUser'){ // 이미 동일아이디로 일반계정이 존재할경우
            	   
            	   // 로그인창 띄워주기 + 얼럿
            	  alert("다른 이메일로 가입되어 있습니다. 로그인해주세요.");
            	  location.href = '${pageContext.request.contextPath}/';
            	  loginModal();
            	  
            	   
               } else if(result == 'googleUserReg'){ // 해당계정이 없는경우
            	   
            	   // 구글계정용 회원가입폼 띄워주기
            	   location.href = '${pageContext.request.contextPath}/';
            	   
               }
              }
          });
 */

	
	//진행중
	
//});




</script>

<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

<!-- 로그인 스크립트 끝 -->
<div id="frame" style="position: absolute; right: 0px; bottom: 0px; z-index: -5; visibility: hidden">
	<div id="sidepanel">
		<div id="profile">
			<div class="wrap">
				<%--${loginUser.userPhoto}로 바껴야함--%>
				<img id="profile-img" src="${pageContext.request.contextPath}/resources/images/userphoto/nopic.jpg" class="online" alt=""/>
				<p>${loginUser.userName}</p>
			</div>
		</div>
		<div id="search1">
			<i class="fa fa-search" aria-hidden="true"></i>
			<input type="text" placeholder="Search contacts..."/>
		</div>
		<div id="contacts">
			<ul>
			</ul>
		</div>

	</div>
	<div class="content">
		<div class="contact-profile">
			<img id="con" src="" alt=""/>
			<p id="conname"></p>
			<div class="social-media">
				<i class="fa fa-instagram" aria-hidden="true" style="visibility: hidden"></i>
				<i class="fas fa-times-circle" aria-hidden="true" onclick="closee()"></i>
			</div>
		</div>
		<div class="messages">
			<ul>
			</ul>
		</div>
		<div class="message-input">
			<div class="wrap">
				<input type="text" id="message" placeholder="Write your message..."/>
				<button class=""><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
			</div>
		</div>
	</div>
</div>

<script>

    /* 스크롤따라 움직이는 Div */
    var currentPosition = parseInt($('#frame').css('top'));

    $(window).scroll(function() {
        var position = $(window).scrollTop();
        $('#frame').stop().animate({
            'top' : position + currentPosition + 'px'
        }, 500);
    });

function closee(){
        $('#frame').css('z-index',-6);
        $('#frame').css('visibility','hidden');
}
    $(".expand-button").click(function() {
        $("#profile").toggleClass("expanded");
        $("#contacts").toggleClass("expanded");
    });

    $("#status-options ul li").click(function() {
        $("#profile-img").removeClass();
        $("#status-online").removeClass("active");
        $("#status-away").removeClass("active");
        $("#status-busy").removeClass("active");
        $("#status-offline").removeClass("active");
        $(this).addClass("active");

        if($("#status-online").hasClass("active")) {
            $("#profile-img").addClass("online");
        } else if ($("#status-away").hasClass("active")) {
            $("#profile-img").addClass("away");
        } else if ($("#status-busy").hasClass("active")) {
            $("#profile-img").addClass("busy");
        } else if ($("#status-offline").hasClass("active")) {
            $("#profile-img").addClass("offline");
        } else {
            $("#profile-img").removeClass();
        };

        $("#status-options").removeClass("active");
    });



    $(".messages").animate({scrollTop: $('.messages')[0].scrollHeight}, "fast");

    function getDBMessage(userId, hostId, roomsId,name, photo){
        //photo로 바껴야함
        $('#con').attr('src','${pageContext.request.contextPath}/resources/images/userphoto/nopic.jpg');
        $('#conname').text(name);
        $('.messages ul').text('');
        messagehostId=hostId;//고정값이여야함
        messageuserId=userId;//고정값이여야함
        messageroomsId=roomsId;
        $.ajax({
            url: '${pageContext.request.contextPath}/chat/list/message?roomsId=' + roomsId + '&hostId=' + hostId + '&userId=' + userId,
            type: 'get',
            datatype: 'json',
            success: function (data) {
                $(data).each(function (key, value){
                    if ((value.userId == '${sessionScope.loginUser.userId}' && value.receive == 'H') || (value.hostId == '${sessionScope.loginUser.userId}' && value.receive == 'U')) {
                        $('<li class="replies"><p>' +value.messagecontent + '</p></li>').appendTo($('.messages ul'));
                        // $('<li>' + getTimeStamp(value.messageDate) + '</li>').appendTo($('.messages ul'));
                        $('.message-input input').val(null);
                        $('.contact.active .preview').html('<span>me : </span>' + value.messagecontent);
                    } else {
                        $('<li class="sent"><img src="'+ '${pageContext.request.contextPath}/resources/images/userphoto/nopic.jpg' +'" alt="" /><p>' + value.messagecontent + '</p></li>').appendTo($('.messages ul'));
                        //   $('<li>' + getTimeStamp(value.messageDate) + '</li>').appendTo($('.messages ul'));
                        $('.message-input input').val(null);
                        $('.contact.active .preview').html('<span>You : </span>' +value.messagecontent);
                    }
                });
                $(".messages").animate({scrollTop: $('.messages')[0].scrollHeight}, "fast");
                /*   $(".messages").animate({scrollTop: $(document).height()}, "fast");*/
            },
            error: function () {
                alert(error);
            }
        });
    }

    $("#profile-img").click(function () {
        $("#status-options").toggleClass("active");
    });

    connect();

    function connect() {
        sock = new SockJS('${pageContext.request.contextPath}/chat');
        sock.onopen = function () {
            console.log('open');
        };
        sock.onmessage = function (evt) {
            var data = evt.data;
            var obj = JSON.parse(data);
            appendMessage(obj);
        };
    }
    var messagehostId=null;
    var messageuserId=null;
    var messageroomsId=null;
    function send() {
        var msg = $("#message").val();
        console.log(msg);
        if (msg != "") {
            message = {};
            message.messagecontent = $("#message").val()
            message.hostId = messagehostId//고정값이여야함
            message.userId = messageuserId//고정값이여야함
            message.roomsId = messageroomsId//고정값이여야함
            message.sender = '${sessionScope.loginUser.userId}'
        }
        sock.send(JSON.stringify(message));
        $("#message").val("");
    }

    function appendMessage(obj) {
        console.log(obj);
        message = $("#message").val();

        if (obj.userId == messageuserId && obj.hostId == messagehostId && obj.roomsId == messageroomsId) {
            if (obj.messagecontent == '') {
                return false;
            } else {
                if (obj.sender == '${sessionScope.loginUser.userId}') {
                    $('<li class="replies"><p>' + obj.messagecontent + '</p></li>').appendTo($('.messages ul'));
                    //  $('<li>' + getTimeStamp(obj.messageDate) + '</li>').appendTo($('.messages ul'));
                    $('.message-input input').val(null);
                    $('.contact.active .preview').html('<span>me : </span>' + obj.messagecontent);
                } else {
                    //$('#con').attr('src')로 수정해야댐
                    $('<li class="sent"><img src="${pageContext.request.contextPath}/resources/images/userphoto/nopic.jpg" alt="" /><p>' + obj.messagecontent + '</p></li>').appendTo($('.messages ul'));
                    //  $('<li>' + getTimeStamp(obj.messageDate) + '</li>').appendTo($('.messages ul'));
                    $('.message-input input').val(null);
                    $('.contact.active .preview').html('<span>You : </span>' + obj.messagecontent);
                }

                $(".messages").animate({scrollTop: $(document).height()}, "fast");
            }
            $(".messages").animate({scrollTop: $('.messages')[0].scrollHeight}, "fast");
            $.ajax({
                url: '${pageContext.request.contextPath}/chat/list/ck?roomsId=' + obj.roomsId + '&hostId=' + obj.hostId + '&userId=' + obj.userId,
                type: 'get',
                datatype: 'json',
                success: function (data) {
                    var cnt = 0;
                    for (var i = 1; i < 5; i++) {
                        if ($('#list' + i).text() == '') {
                            cnt++
                        }
                    }
                    if (cnt == 0) {
                        $('#jchannotice').css('display', 'inline');
                    }
                },
                error: function () {
                    alert(error);
                }
            });
        }
    };

    $(document).ready(function () {
        $('.submit').click(function () {
            send();
        });

        $('#message').keypress(function (event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if (keycode == '13') {
                send();
            }
            event.stopPropagation();
        });
        $('#message').keyup(function (event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if (keycode == '13') {
                $("#message").val("");
            }
            event.stopPropagation();
        });
    });

    //# sourceURL=pen.js
</script>


<script>

    function getTimeStamp(datea) {
        var d = null;

        if (datea) {
            d = new Date(datea);
        } else {
            d = new Date();
        }
        var s =
            leadingZeros(d.getFullYear(), 4) + '-' +
            leadingZeros(d.getMonth() + 1, 2) + '-' +
            leadingZeros(d.getDate(), 2) + ' ' +
            leadingZeros(d.getHours(), 2) + ':' +
            leadingZeros(d.getMinutes(), 2);
        return s;
    }

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();

        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }
</script>
