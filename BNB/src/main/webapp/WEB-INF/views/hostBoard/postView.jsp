<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물보기</title>
</head>
<body>
<%@ include file="/resources/common/includeHead.jsp"%>
<%@ include file="/resources/common/Navbar.jsp"%>

<div class="container" style="margin-bottom:100px;">
	<h1>POST VIEW!</h1>
	<hr>
	<div class="table-responsive">
		<div style="height:40px; border-bottom:1px solid lightgrey;">
			<div style="float:left; margin-left:10px;"><h3>${post.title }</h3></div>
			<c:if test="${loginUser.userId eq post.userId }">
				<div style="float:right; margin-right:10px;"><a class="btn btn-outline-primary" role="button" onclick="return confirm('정말 삭제하시겠습니까?');" href="${pageContext.request.contextPath}/hostBoard/deletePost?postNo=${post.postNo}">삭제</a></div>
				<div style="float:right; margin-right:10px;"><a class="btn btn-outline-primary" role="button" href="${pageContext.request.contextPath}/hostBoard/modifyPost?postNo=${post.postNo}">수정</a></div>
			</c:if>
		
		</div>
		<div style="text-align: justify;">
			<div style="float:left;">${post.nickName}</div>
			<div style="float:right;"><fmt:formatDate value="${post.date}" pattern="yyyy-MM-dd HH:mm" /></div>
		</div>
		

		<div style="padding:10px; margin-top:50px;">${post.content }</div>

		<hr>
		<div style="float:right; height: 50px; margin-right:10px;"><a class="btn btn-outline-primary" role="button" href="${pageContext.request.contextPath}/hostBoard">목록</a></div>
		
		<div class="card card-default" style="margin-top:70px;">
			<div class="form-group">
				<input id="postNo" type="hidden" value="${post.postNo }">
				<input id="nickName" type="text" class="form-control" style="float:left;" value="${loginUser.nickName }" readonly />
				<textarea id="commentContent" class="form-control" style="height:100px;"></textarea>
				<a class="btn btn-outline-primary" role="button" id="commentBtn" href="#">댓글달기</a>
				<!-- <input type="submit" value="댓글달기" style="float:right;"> -->
			</div>
		</div>
		
		<div id="commentListDiv" class="card card-default">
			
			<c:if test="${commentList.isEmpty()}">
			<div class="card card-body">
				댓글이 없습니다.				
			</div>
			</c:if>
		
			<c:if test="${commentList ne null }">
			<c:forEach var="comment" items="${commentList}">
			<div class="card card-body">
				작성자 : ${comment.nickName } <br>
				작성일 : <fmt:formatDate value="${comment.commentDate }" pattern="yyyy-MM-dd HH:mm" /><br>
				내용 : ${comment.commentContent } <br>
				<c:if test="${comment.nickName eq loginUser.nickName}">
				<hr>
					<div style="float:right; ">
						<a class="btn btn-outline-primary" role="button" href="#" onclick="modifyComment(${comment.commentNo})">수정</a>
						<a class="btn btn-outline-primary" role="button" href="#" onclick="deleteComment(${comment.commentNo})">삭제</a>
					</div>
				</c:if>
			</div>
			</c:forEach>
			</c:if>
			
		</div>
		
	</div>
</div>
</body>

<script>
// 댓글달기 클릭시 댓글 인서트-뷰 ajax 조회수 변동 없어야함
$('#commentBtn').click(function(){
	
	var postNo = $('#postNo').val();
	var nickName = $('#nickName').val();
	var commentContent = $('#commentContent').val();
	var commentListStr = '';
	
	console.log('postNo : ' + postNo);
	console.log('nickName : ' + nickName);
	console.log('commentContent : ' + commentContent);
	
	$.ajax({
		url : '${pageContext.request.contextPath}/hostBoard/writeComment',
		type : 'post',
		data : {
					'postNo' : postNo,
					'nickName' : nickName,
					'commentContent' : commentContent
		},
		//dataType : 'json',
		success : function(commentList){
			console.log(commentList);
			$('#commentListDiv').empty();
			
			for(var i = 0; i<commentList.length; i++){
				commentListStr += '<div class="card card-body">' + 
								  '작성자 : ' + commentList[i].nickName + '<br>' +
								  '작성일 : ' + commentList[i].commentDate + '<br>' + 
								  '내용 : ' + commentList[i].commentContent + '<br>' +
								  '<hr>' + 
								  '<div style="float:right; ">' +
								  '<a class="btn btn-outline-primary" role="button" href="#" onclick="modifyComment('+commentList[i].commentNo+')">수정</a>' +
								  '<a class="btn btn-outline-primary" role="button" href="#" onclick="deleteComment('+commentList[i].commentNo+')">삭제</a>' +
								  '</div>' +
								  '</div>';
			}
			
			$('#commentListDiv').html(commentListStr);
			
		} // success 끝
		
	});/* ajax끝 */
	
});



// 댓글삭제 클릭시 - 댓글 딜리트 처리-댓글뷰로 ajax 처리: 조회수 변동 없어야함
function deleteComment(commentNo){
	
	var postNo = $('#postNo').val();
	var commentListStr = '';
	
	$.ajax({
		url : '${pageContext.request.contextPath}/hostBoard/deleteComment',
		type : 'post',
		data : {
				'commentNo' : commentNo,
				'postNo' : postNo
				},
		success : function(commentList){
			$('#commentListDiv').empty();
			
			for(var i = 0; i<commentList.length; i++){
				commentListStr += '<div class="card card-body">' + 
								  '작성자 : ' + commentList[i].nickName + '<br>' +
								  '작성일 : ' + commentList[i].commentDate + '<br>' + 
								  '내용 : ' + commentList[i].commentContent + '<br>' +
								  '<hr>' + 
								  '<div style="float:right; ">' +
								  '<a class="btn btn-outline-primary" role="button" href="#" onclick="modifyComment('+commentList[i].commentNo+')">수정</a>' +
								  '<a class="btn btn-outline-primary" role="button" href="#" onclick="deleteComment('+commentList[i].commentNo+')">삭제</a>' +
								  '</div>' +
								  '</div>';
			}
			
			$('#commentListDiv').html(commentListStr);
		}
		
	});
	
}



</script>

</html>