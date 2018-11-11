<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>방 예약하기</title>
<link rel="stylesheet" href="resources/css/style-umki.css">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

</head>

<body class="umkibody">
<form action="${pageContext.request.contextPath}/reservation/do">
	<div class="wrapperr">
		<input type="text" id="datepicker" placeholder=" 체크인 " readonly="true" />
		<i class="ion-calendar"></i>
	</div>
	<div class="wrapperr">
		<input type="text" id="return" placeholder=" 체크아웃 " readonly="true">
		<i class="ion-calendar"></i>
	</div>
	
		<input type="submit" value="예약하기"/>
	
</form>
	<script>
        
    	var impossible = new Array();
    	var re;
    	var now = new Date();
    	
        function temp(){
            $.ajax({
            	async : false,
                url: '${pageContext.request.contextPath}/reservation/possible',
                type: 'GET',
                datatype: 'json',
                data: {
                	"roomsId": 3
                },
                success: function(data) {
                    $(data).each(
                        function(key, value) {
                       		day = value.day;
                       		inyy = Number(value.checkIn.substring(0, 4));
                        	inmm = Number(value.checkIn.substring(5, 7));
                        	indd = Number(value.checkIn.substring(8, 10));
	                        if(inmm!=12){
                        	for(i=0; i<day; i++){
                        		impossible.push(new Date(inyy, inmm-1, indd+i));         
                        	}
	                        } else if (inmm==12){
                        	for(i=0; i<day; i++){
                        		impossible.push(new Date(inyy+1, 0-1, indd+i));         
                        	}
	                        }
                        });
                }
            });
        }
        
        temp();
        
            $(function() {
                $("#datepicker").datepicker();
                
            });

            $.datepicker.setDefaults({
                closeText: "닫기",
                prevText: "이전달",
                nextText: "다음달",
                currentText: "오늘",
                monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                    "7월", "8월", "9월", "10월", "11월", "12월"
                ],
                monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
                    "7월", "8월", "9월", "10월", "11월", "12월"
                ],
                dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
                dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
                dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
                weekHeader: "주",
                dateFormat: "yy년 mm월 dd일",
                firstDay: 0,
                isRTL: false,
                showMonthAfterYear: true,
                yearSuffix: "년"
            })

            $("#datepicker").datepicker({
                showAnim: 'drop',
                minDate: 0,
                onSelect: function(selected, event) {
                    window.parent.postMessage(selected, "*");
                },
                beforeShowDay: function(date) {
                	    
                    $(impossible).each(
                            function(key, value) {
                            	    
                            	if(String(date) == String(value) &&
                            			(value.getFullYear() == now.getFullYear() && 
                            			value.getMonth() >= now.getMonth() && 
                            			value.getDate() >= now.getDate())
                            	){
                                	re = [false, "not", ""];
                                	return false;    
                                }else if(value.getFullYear() > now.getFullYear() && String(date) == String(value) ){
                                	re = [false, "not", ""];
                                	return false;       
                                }else {
                                	re = [true];
                                	return true;
                                }
                            });
                    
                    return re;
                },
                onClose: function(selected) {
                    var year = Number(selected.substring(0, 4));
                    var month = Number(selected.substring(6, 8));
                    var date = Number(selected.substring(10, 12));   
                    var checkIn = new Date(year, month - 1, date);
                    var checkIn2 = new Date(year, month - 1, date+1);
                    console.log(typeof selected);
                    
                    if(selected != ""){
                    $.ajax({
                    	async : false,
                        url: '${pageContext.request.contextPath}/reservation/possibleDuration',
                        type: 'GET',
                        data: {
                        	"checkIn": checkIn,
                        	"now" : now,
                        	"roomsId": 3
                        },   
                        datatype: 'json',
                        success: function(data) {        
                        	$(data).each(
                                    function(key, value) {
                                     	 $('#return').datepicker("option", "maxDate", "+"+value+"d");
                                    });  
                        }
                    });

                    $('#return').datepicker("option", "minDate", checkIn2);
                    }
                    temp();
                  	            
                },
                
                onChangeMonthYear : function(){
                	impossible = [];
                	temp();
                }
                    
            });


            $("#return").datepicker({
                showAnim: 'drop',
                minDate: new Date(),
                onSelect: function(selected, event) {

                    window.parent.postMessage(selected, "*");
                }
            
            });

        </script>
</body>

</html>
