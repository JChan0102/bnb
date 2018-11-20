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
  <form id="fileform" action="">
    <select style="display: none" name="type">
      <option value="TEXT_DETECTION">TEXT_DETECTION</option>
    </select><br />
    <input type="file" name="fileField"><br /><br />
    <input type="submit" name="submit" value="Submit">
  </form>    

  <code style="white-space:pre" id="results"></code>
</body>
</html>
