<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/common/includeHead.jsp"%>


<h1 class="page_title color5">Host Community</h1>

<script>
$(document).ready(function() {
	$('#submitBtn').click(function() {
		$('#bContent').val($('#bContent').val().replace(/\n/g, '<br>'));
		$('#target').submit();
	});
});
</script>
<form method="post" id="target">
	<table width="100%"
		style="border-top: 2px solid #547980; border-bottom: 2px solid #547980;">
		<tr>
			<th width="100">작성자</th>
			<td><input type="text" value="" name="bUserId" size="50"
				class="form-control"required="required"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="bTitle" size="50"
				class="form-control" required="required"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="bContent" name="bContent" rows="10"
					class="form-control" required="required"></textarea></td>
		</tr>
	</table>
	<br> <input type="button" id="submitBtn" value="입력" class="btn btn-dark">
</form>

