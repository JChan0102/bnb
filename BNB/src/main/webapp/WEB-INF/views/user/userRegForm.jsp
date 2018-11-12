<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body>
	<%@ include file="/resources/common/includeHead.jsp"%>
	<%@ include file="/resources/common/Navbar.jsp"%>


	<div id="userRegForm">
		<!-- Begin page content -->
		<div role="main" class="hyeon-container">
			<div class="row justify-content-md-center">
				<div class="col col-md-6 col-lg-5">
				
				<div class="hyeon-title"><h2>회원가입</h2></div>
				
					<form method="post" enctype="multipart/form-data">
					
						<input type="email" name="userId" class="form-control hyeon-reg-input" placeholder="이메일 주소" />
		
						<input type="password" id="uerPw-1" name="userPw" class="form-control hyeon-reg-input" placeholder="비밀번호 설정" />
						
						<input type="password" id="uerPw-2" class="form-control hyeon-reg-input" placeholder="비밀번호 확인" />
						<input type="text" name="userName" class="form-control hyeon-reg-input" placeholder="이름" />
						
						<div>
						<p style="font-weight: bold;">생일</p>
						<p>회원 가입을 하시려면 만 18세 이상이어야 합니다.<br>
						생일은 다른 회원에게는 공개되지 않습니다.</p>
						</div>
						<div>
						<select name="month" class="hyeon-form-control hyeon-left">
					 		<option>월</option>
								<c:forEach begin="1" end="12" var="month" >
									<option>${month}</option>
								</c:forEach>
						</select>
						
						<select name="day" class="hyeon-form-control">
					 		<option>일</option>
								<c:forEach begin="1" end="31" var="day" >
									<option>${day}</option>
								</c:forEach>
						</select>
						
						<select id="select-year" name="year" class="hyeon-form-control hyeon-right">
					    	<option value="">년도</option>

      						    <c:set var="today" value="<%=new java.util.Date()%>" />

          						<fmt:formatDate value="${today}" pattern="yyyy" var="nowYear"/> 

         						<c:forEach begin="0" end="120" var="i">

           							<option><c:out value="${nowYear - i}" /></option>

          						</c:forEach>

						</select>
						</div>
						<div> </div>
						<button class="btn btn-lg btn-danger btn-block" type="submit">회원가입</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
<!-- 	<script>
		$(document).ready(function(){
			var date = new Date();
			var nowYear = date.getHullYear();
			var lastYear = nowYear - 120;
			$('#select-year').prepend("<option>년도</option>")
			
			for(var i=nowYear; i<lastYear; i--){
				$('#select-year').prepend("<option>"+i+"년</option>")
			}
			
			
		});
	
	
	</script> -->
<!-- 	<div id="userRegForm">
		<form method="post" enctype="multipart/form-data">
			아이디(이메일 ) : <input type="email" name="userId" required /><br>
			비밀번호 설정 : <input type="password" name="userPw" required /><br>
			이름 : <input type="text" name="userName" required /><br> 사진 : <input
				type="file" name="photoFile" /><br> <input type="hidden"
				name="host" value=1 /><br> <input type="hidden" name="admin"
				value=1 /><br> <input type="hidden" name="userKey"
				value="asd123" /><br> <input type="hidden" name="userCheck"
				value=1 /><br> <input type="hidden" name="point" value=0 /><br>
			<input type="hidden" name="disabled" value=1 /><br> <select
				name="month">
				<option>월</option>
				<option>1</option>
			
			</select> <input type="text" name="day" placeholder="일" /> <input type="text"
				name="year" placeholder="년(4자리)" />
			<textarea name="userInfo" cols="30" placeholder="자기소개"></textarea>
			<br> <input type="submit" value="가입하기" />
		</form>
	</div> -->
</body>
</html>