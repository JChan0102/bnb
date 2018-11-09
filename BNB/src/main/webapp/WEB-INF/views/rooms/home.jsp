<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body>

	<%@ include file="/resources/common/Navbar.jsp"%>
	<!-- Begin page content -->

	<main role="main" class="container">
	<h1>방리스트</h1>
	<form method="post">
		<input type="text" id="avail_adults" name="avail_adults"
			class="form-control"><input type="submit"
			class="btn btn-danger" value="검색">
	</form>
	<a href="${pageContext.request.contextPath}/rooms/registerRooms">방입력</a>
	<br>
	<c:forEach items="${rooms}" var="item" varStatus="status">




		<div class="card" style="width: 18rem;">
			<img class="card-img-top" src="..." alt="Card image cap">
			<div class="card-body">
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
			</div>
		</div>



		<a
			href="${pageContext.request.contextPath}/rooms/modifyRooms?roomsId=${item.roomsId}">${item.roomsId}/${item.hostId}
			방수정</a>
		<br>
		<a
			href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId=${item.roomsId}">${item.roomsId}/${item.hostId}
			방보기</a>
		<br>
	</c:forEach> <br>
	에어비앤비 트립 기준에 부합하려면... 그 분야에 대한 풍부한 지식과 열정을 가진 호스트가 진행합니다. 게스트가 체험에 직접
	참여하거나 완전히 몰입할 수 있어야 합니다. 쉽게 접할 수 없는 특별한 장소나 커뮤니티를 방문합니다. 호스트의 독특한 시각을
	담고 있어야 합니다. 에어비앤비 트립에 해당되지 않는 것 다음은 에어비앤비 트립 기준에 맞지 않습니다. 친밀감이 부족한 대규모
	투어 호스트가 누구인지 분명하지 않은 이벤트 단순한 서비스(예: 공항을 오가는 교통편) 게스트가 스스로 쉽게 찾을 수 있는 것
	다음 </main>
</body>
</html>