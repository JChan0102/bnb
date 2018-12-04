<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/common/includeHead.jsp"%>
<%@ include file="/resources/common/Navbar.jsp"%>
<html>
<head>
<!-- include summernote css/js-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
    
<!-- <script>
$(document).ready(function() {
	$('#submitBtn').click(function() {
		$('#content').val($('#content').val().replace(/\n/g, '<br>'));
		$('#target').submit();
	});
});
</script> -->
</head>
<body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<div class="container">
<h2>포스팅하기</h2>
<hr>
<div class="panel panel-info">
 <form method="post">
<div class="panel-heading"><input type="text" name="title" placeholder="제목" />

<input type="hidden" name="userId" value="${loginUser.userId }" readonly />
<input type="hidden" name="nickName" value="${loginUser.nickName }" readonly/>
</div>

<div class="panel-body">
<textarea id="summernote" name="content"></textarea>
</div>
<input type="submit" value="입력">

</form>
</div>
</div>
<script>
$('#summernote').summernote({
	  height: 300,                 // set editor height
	  minHeight: null,             // set minimum height of editor
	  maxHeight: null,             // set maximum height of editor
	  focus: true                  // set focus to editable area after initializing summernote
	});
</script>


</body>
</html>