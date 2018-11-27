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
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/canvas2image.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
      

        <style>     
            #test1 {                 
                border: 3px solid red;
                position: absolute;
            }

            #test2 {
                border: 3px solid yellow;
                position: absolute;
            }

            #test3 {
                border: 3px solid black;
                position: absolute;
                background-color: black;
            }

        </style>
    </head>

    <body>
        <%@ include file="/resources/common/includeHead.jsp"%>
            <%@ include file="/resources/common/Navbar.jsp"%>
                <div style="margin-left: 50px;">
                    <img style="width: 360px" src="${pageContext.request.contextPath}/resources/images/sample.png">
                    <h3>신분증을 위와 같이 촬영하여 등록해주세요.</h3>
                    <form id="fileform" action="">
                        <select style="display: none" name="type">
      <option value="TEXT_DETECTION">TEXT_DETECTION</option>
    </select><br />
                        <input type="file" name="fileField" id="upload_file"><br /><br />
                        <div id="holder" style="position: relative;"></div>
                        <input type="hidden" id="imgData" name="file">
                        <input style="display:none" type="submit" name="submit" value="Submit">
                    </form>

                    <code style="white-space:pre" id="results"></code>
                    <h1 id="host"></h1>
                </div>
<FORM>
  <INPUT type='BUTTON' value='버튼' onclick='html2img()'> <!-- 버튼 클릭 이벤트-->
</FORM>
       
 

<image id="theimage" style="position: relative;"></image>

    </body>
    
    <script type="text/javascript">
        var temp;
        var check = 0;
		var ratio = 0;
		
 		function  html2img(){     
			  var canvas ="";
			  html2canvas($("#holder"), {
			  onrendered: function(canvas) {
			  // canvas is the final rendered <canvas> element
			   /* document.getElementById("theimage").src = canvas.toDataURL();      */ 
			   /* document.body.appendChild(canvas);  가린 신분증 이미지 파일 보여주기 */
			   
			   var url = canvas.toDataURL();
			   
	/*            $("<a>", {
	             href: url,
	             download: "${loginUser.userId}.png" 
	           })
	           .on("click", function() {$(this).remove()})
	           .appendTo("body")[0].click()     */ 
			   	
			     /* Canvas2Image.saveAsPNG(canvas); */
			     
			  }
			  });
			  alert(document.getElementById("holder").innerHTML);
		}
		
		
        $(function() {
            $("#upload_file").on('change', function() {
                /* $('#img').attr("src", ""); */
                $('#fileform').submit();
                temp = this;
            });
        });

        function readURL(input) {
            $('#img').remove();
            $('#results').text('');
            $('#results').html('<button id="hostSubmit">호스트 신청하기</button>');
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    var img = new Image();      
                    img.src = e.target.result;
                    img.width = 360; 
                    console.log(ratio);
                    $('#holder').append('<img style="width: 360px; z-index:999" id="img" src="' + e.target.result + '" alt="뭐야ㅡㅡ" />');
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        /**
         * Displays the results.       
         */
        function displayJSON(data) {
            //  var contents = JSON.stringify(data, null, 4);
            //  $('#results').text(contents);
            //  var evt = new Event('results-displayed');
            //  evt.results = contents.description;

            var str = data.responses[0].fullTextAnnotation.text;
            var trimStr = str.replace(/ /gi, ""); // 모든 공백을 제거
            var tempName = '';
            var tempDob = '';
            /* console.log(trimStr);
            console.log(data.responses[0].textAnnotations); */

            $.ajax({
                async: false,
                url: '${pageContext.request.contextPath}/textDetection',
                type: 'GET',
                datatype: 'json',
                data: {
                    "userId": "${loginUser.userId}"
                },
                success: function(data) {
                    tempDob = data.birth.substring(2, 10).replace(/-/gi, '');
                    tempName = data.userName;
                }
            });
            
            ratio = data.responses[0].fullTextAnnotation.pages[0].width / 360;
            console.log(ratio);
            
            $(data.responses[0].textAnnotations).each(
                function(key, value) {
                    
                    /* console.log(value.description.substring(0, 6)); */
                    if (check <= 2 && value.description == tempName) {
                        tempName = '';

                        var nameWidth = value.boundingPoly.vertices[2].x - value.boundingPoly.vertices[0].x + 12;
                        var nameHeight = value.boundingPoly.vertices[2].y - value.boundingPoly.vertices[0].y + 12;

                        $('#holder').append('<div id="test1" style="z-index:999";></div>');  
                        $('#test1').css("left", "" + (value.boundingPoly.vertices[0].x)/ratio -4 + "px");     
                        $('#test1').css("top", "" + (value.boundingPoly.vertices[0].y)/ratio -4 + "px");
                        $('#test1').css("width", "" + nameWidth/ratio + "px");
                        $('#test1').css("height", "" + nameHeight/ratio + "px");
                        check++;
                        /* return false; */
                    }
                    if (check <= 2 && value.description.substring(0, 6) == tempDob) {
/*                         var identityWidth = ((value.boundingPoly.vertices[2].x - value.boundingPoly.vertices[0].x + 12) / 2) * 0.92;
                        var identityHeight = value.boundingPoly.vertices[2].y - value.boundingPoly.vertices[0].y + 12; */
                        var identityWidth = (value.boundingPoly.vertices[2].x - value.boundingPoly.vertices[0].x)/2;   
                        var identityHeight = value.boundingPoly.vertices[2].y - value.boundingPoly.vertices[0].y + 12;
                        
                        console.log(value.boundingPoly.vertices);
                        console.log(value.boundingPoly.vertices[2].x - value.boundingPoly.vertices[0].x);         
                        $('#holder').append('<div id="test2" style="z-index:999"></div>');
                        $('#test2').css("left", "" + (value.boundingPoly.vertices[0].x)/ratio -5 + "px");
                        $('#test2').css("top", "" + (value.boundingPoly.vertices[0].y)/ratio -4 + "px");
                        $('#test2').css("width", "" + identityWidth/ratio + "px");
                        $('#test2').css("height", "" + identityHeight/ratio + "px");
                        $('#holder').append('<div id="test3" style="z-index:999"></div>');     
                        $('#test3').css("left", "" + ((value.boundingPoly.vertices[0].x)/ratio -4 ) * 3.35 + "px");      
                        $('#test3').css("top", "" + (value.boundingPoly.vertices[0].y)/ratio -4 + "px");
                        $('#test3').css("width", "" + identityWidth/ratio + "px");
                        $('#test3').css("height", "" + identityHeight/ratio + "px");
                        check++;
                    }
                    
                });
            if (check < 2) {    
                $('#img').remove();
                $('#test1').remove();
                $('#test2').remove();
                $('#test3').remove();
                $('#results').text('사진을 다시 업로드 해주세요.');
            } else if (check == 2) {        
                readURL(temp);
                check = 0;
            }

            $('#hostSubmit').on("click", function(){
      		  var canvas ="";
    		  html2canvas($("#holder"), {
    		  onrendered: function(canvas) {
    		   /* document.body.appendChild(canvas);  가린 신분증 이미지 파일 보여주기 */
    		   var url = canvas.toDataURL("image/png");
    		   $("#imgData").val(url);
    		   
    		  }
    		  });
            	 $.ajax({
                     url: '${pageContext.request.contextPath}/textDetection',
                     type: 'POST',
                     datatype: 'json',
                     data: {
                         "userId": "${loginUser.userId}"
                         /* "imgData" :  */
                     },
                     success: function(data) {
                         if (data == 1) {
                             $('#results').text('');
                             $('#host').html('호스트가 되신걸 축하합니다.<br> 호스트페이지에서 방등록을 하실수 있습니다.<br><br> 3초후 호스트페이지로 이동합니다.');
                             setTimeout(function() {
                                 window.location.href = '${pageContext.request.contextPath}/hostpage/main'
                             }, 3000);

                         } else {
                             $('#results').text('죄송합니다. 다시 시도해주세요.');
                         }
                     }
                 });
            });
            function hostSubmit() {
/*                 if ((trimStr.indexOf(tempName)) != -1 && trimStr.indexOf(tempDob) != -1) { */       
                    $.ajax({
                        url: '${pageContext.request.contextPath}/textDetection',
                        type: 'POST',
                        datatype: 'json',
                        data: {
                            "userId": "${loginUser.userId}"
                        },
                        success: function(data) {
                            if (data == 1) {
                                $('#results').text('');
                                $('#host').html('호스트가 되신걸 축하합니다.<br> 호스트페이지에서 방등록을 하실수 있습니다.<br><br> 3초후 호스트페이지로 이동합니다.');
                                setTimeout(function() {
                                    window.location.href = '${pageContext.request.contextPath}/hostpage/main'
                                }, 3000);

                            } else {
                                $('#results').text('죄송합니다. 다시 시도해주세요.');
                            }
                        }
                    });

               /*  } else {
                    $('#results').text('사진을 다시 업로드 해주세요.');
                } */
            }
        }
        
        
        

    </script>

    </html>
