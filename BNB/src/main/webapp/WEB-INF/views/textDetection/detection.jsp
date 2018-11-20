<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Cloud Vision Demo</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/key.js"></script>  									  
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>
<body>
<%@ include file="/resources/common/includeHead.jsp"%>
<%@ include file="/resources/common/Navbar.jsp"%>

<h1>신분증을 등록해주세요.</h1>
  <form id="fileform" action="">
    <select style="display: none" name="type">
      <option value="TEXT_DETECTION">TEXT_DETECTION</option>
    </select><br />
    <input type="file" name="fileField"><br /><br />
    <input type="submit" name="submit" value="Submit">
  </form>    

  <code style="white-space:pre" id="results"></code>
  <h1 id="host"></h1>
</body>
<script type="text/javascript">
/**
 * Displays the results.
 */
function displayJSON (data) {
//  var contents = JSON.stringify(data, null, 4);
//  $('#results').text(contents);
//  var evt = new Event('results-displayed');
//  evt.results = contents.description;
	
  var str = data.responses[0].fullTextAnnotation.text;
  var trimStr = str.replace(/ /gi, ""); // 모든 공백을 제거
  var tempName = '';
  var tempDob = '';
  
  $.ajax({
	  async: false,
      url: '${pageContext.request.contextPath}/textDetection',
      type: 'GET',
      datatype: 'json',
      data: {    
          "userId": "${loginUser.userId}"
      },
      success: function(data) {
    	  tempDob = data.birth.substring(2,10).replace(/-/gi,'');                         
    	  tempName = data.userName;
      }
  });

  if((trimStr.indexOf(tempName)) != -1 && trimStr.indexOf(tempDob) != -1 ){
	  $.ajax({
		 url: '${pageContext.request.contextPath}/textDetection',
		 type: 'POST',
		 datatype: 'json',
		 data: {
			 "userId": "${loginUser.userId}"
		 },
		 success: function(data) {
			 if(data == 1){
				 $('#results').text('');
				 $('#host').html('호스트가 되신걸 축하합니다.<br> 호스트페이지에서 방등록을 하실수 있습니다.<br><br> 2초후 호스트페이지로 이동합니다.');
				 setTimeout(function() { 
					 window.location.href = '${pageContext.request.contextPath}/hostpage/main'
				 }, 2000);
				 
			 } else{
				 $('#results').text('죄송합니다. 다시 시도해주세요.');
			 }
		 }
	  });
	  
  }else{
	  $('#results').text('사진을 다시 업로드 해주세요.');
  }
}
</script>
</html>


