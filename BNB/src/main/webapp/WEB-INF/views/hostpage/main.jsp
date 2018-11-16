<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mypage</title>
    <%@ include file="/resources/common/includeHead.jsp" %>
</head>
<body style="background-color: #EEEEEE; overflow-x: hidden">
<%@ include file="/resources/common/Navbar.jsp" %>


<div class="row justify-content-center">
    <div class="col-2">
        <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list"
               href="#list-home" role="tab" aria-controls="home">예약현황</a>
            <a class="list-group-item list-group-item-action" onclick="viewMyroomList()" id="list-profid"
               data-toggle="list" href="#list-profi" role="tab" aria-controls="profile">내방보기</a>
            <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list"
               href="#list-profile" role="tab" aria-controls="profile" onclick="eval()">사용자평가</a>
            <a class="list-group-item list-group-item-action" id="list-messages-list"
               href="${pageContext.request.contextPath}/host" >호스트게시판</a>
            <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list"
               href="#list-settings" role="tab" aria-controls="settings">인출</a>
            <a class="list-group-item list-group-item-action" id="list-settings-li" data-toggle="list"
               href="#list-settings" role="tab" aria-controls="settings">통계</a>
        </div>
    </div>
    <div class="col-8">
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
                <c:choose>
                    <c:when test="${empty myroomlist}">
                        방이 없네요 ㅎㅎㅎ
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="room" items="${myroomlist}">
                            <div onclick="myroomlistselect('${room.roomsId}')">
                                룸 번호 ( ${room.roomsId} ) <span
                                    class="badge badge-pill badge-primary">${room.reservationCount}</span>
                            </div>
                            <div class="dis" style="display: none" id="myroom${room.roomsId}"></div>
                        </c:forEach>

                        <script>
                            function myroomlistselect(roomsid) {
                                $('.dis').css('display', 'none');
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/hostpage/getreser?roomsId=' + roomsid,
                                    type: 'get',
                                    datatype: 'json',
                                    success: function (data) {
                                        var str = '';
                                        var today = new Date();
                                        today.setDate(today.getDate() + 5);
                                        $(data).each(function (key, value) {
                                            var year = value.checkIn.substr(0, 4);
                                            var month = value.checkIn.substr(5, 2);
                                            var day = value.checkIn.substr(8, 2);
                                            var date = new Date(year, month, day);
                                            date.setMonth(date.getMonth() - 1);
                                            str += '<img style="width:30px; height:30px" src="${pageContext.request.contextPath}/resources/images/userphoto/nopic.jpg" alt="" />'
                                                + value.userName + '(' + value.userId + ')' + value.checkIn.substring(0, 10)
                                                + ' ~ ' + value.checkOut.substring(0, 10) + ' ' + value.price;
                                            if (date > today) {
                                                str += '<button class="btn" onclick="rescancle(' + value.reservationNum + ')">예약 취소</button> <br>';
                                            } else {
                                                str += '<br>';
                                            }

                                        });
                                        $('#myroom' + roomsid).html(str);
                                        $('#myroom' + roomsid).css('display', 'block')
                                    },
                                    error: function () {
                                        alert(error);
                                    }
                                });

                            }

                            function rescancle(reservationNum) {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/hostpage/delreser?Idx=' + reservationNum,
                                    type: 'get',
                                    datatype: 'json',
                                    success: function (data) {
                                    },
                                    error: function () {
                                        alert(error);
                                    }
                                });
                            }
                        </script>

                    </c:otherwise>
                </c:choose>
            </div>
            <div class="tab-pane fade" id="list-profi" role="tabpanel" aria-labelledby="list-messages-list">
                <div id="llllist" class="row">


                </div>

                <script>
                    function viewMyroomList() {
                        $('#llllist').html('');
                        str = '<div class="col-md-3"> <div class="card mb-3 box-shadow"> <img class="card-img-top">' +
                            '<div class="card-body"> <img class="card-img-top"> <p class="card-text" style="font-size: 3.0em; text-align: center" ><i class="fas fa-plus"></i> </p>' +
                            ' <div class="d-flex justify-content-between align-items-center"><small class="text-muted">' +
                            '  </small>' +
                            '<div class="btn-group">' +
                            '<a href="${pageContext.request.contextPath}/rooms/registerRooms"><button type="button" class="btn btn-sm btn-outline-secondary ml-1">new</button></a>' +
                            ' </div></div></div></div> </div>';
                        var output = '';
                        // http://fruitdev.tistory.com/174
                        $.ajax({
                            type: 'GET',
                            url: '${pageContext.request.contextPath}/rooms/getRoomsList?page=1&hostId=${loginUser.userId}',
                            dataType: 'JSON',
                            success: function (data) {
                                console.log(data);

                                if (data.roomsList.length == 0) {
                                    $('#llllist')
                                        .html(
                                            '<tr><td class="border-top-0 text-center align-middle">해당하는 숙소가 없습니다 \' ㅅ\');;</td></tr>');
                                } else {
                                    for (i = 0; i < data.roomsList.length; i++) {
                                        output += '<div class="col-md-3">';
                                        output += '<div class="card mb-3 box-shadow">';
                                        output += '<img class="card-img-top">';
                                        output += '<div class="card-body">';
                                        output += '	<p class="card-text">';
                                        output += '		' + data.roomsList[i].roomsId
                                            + '<br>'
                                            + data.roomsList[i].address
                                            + '<br>';
                                        output += '			'
                                            + data.roomsList[i].price_weekdays
                                            + ' - '
                                            + data.roomsList[i].price_weekend
                                            + '/박';
                                        output += '	</p>';
                                        output += '		<div class="d-flex justify-content-between align-items-center">';
                                        output += '			<small class="text-muted">';
                                        for (j = 0; j < data.reviewSummary.length; j++) {
                                            if (data.roomsList[i].roomsId == data.reviewSummary[j].roomsId) {
                                                for (k = 0; k <= data.reviewSummary[j].avgScope; k++) {
                                                    output += '★';
                                                }
                                                output += ' ('
                                                    + data.reviewSummary[j].reviewCount
                                                    + ')';
                                            }
                                        }
                                        output += '			</small>';
                                        output += '			<div class="btn-group">';
                                        if ('${loginUser.userId}' !== ''
                                            && data.roomsList[i].hostId == '${loginUser.userId}') {
                                            output += '					<a href="${pageContext.request.contextPath}/rooms/modifyRooms?roomsId=';
                                            output += '					'
                                                + data.roomsList[i].roomsId
                                                + '&_hostId='
                                                + data.roomsList[i].hostId
                                                + '">';
                                            output += '					<button type="button" class="btn btn-sm btn-outline-secondary ml-1">Edit</button></a>';
                                        }
                                        output += '				<a href="${pageContext.request.contextPath}/rooms/viewRooms?roomsId='
                                            + data.roomsList[i].roomsId;
                                        output += '				&hostId='
                                            + data.roomsList[i].hostId + '">';
                                        output += '				<button type="button" class="btn btn-sm btn-outline-secondary ml-1">View</button></a>';
                                        output += '			</div>';
                                        output += '</div>';
                                        output += '</div>';
                                        output += '</div>';
                                        output += '</div>';
                                    }
                                    if (data.paging.currentPageNo < data.paging.lastPageNo) {
                                        // 출력할 것이 남은 경우
                                        $('#page').val(data.paging.nextPageNo);
                                    } else {
                                        $('#page').val(-1);
                                    }
                                    str = str + output
                                }
                                $('#llllist').html(str);
                            },
                            error: function (error) {
                                console.log("error : " + error);
                            }
                        });


                    }


                </script>


            </div>
            <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                <div class="row" id="evalu" >
                    <div class="col-12 row justify-content-center" id="noteval" style="margin-bottom: 70px;">

                        </div>
                    <div class="col-12 row justify-content-center"  id="yeseval">
                    </div>

                </div>
                <script>
                    function eval() {

                        $('#noteval').html('');
                        $('#yeseval').html('');
                        var str1 = '';
                        var str2='';

                        $.ajax({
                            url: '${pageContext.request.contextPath}/hostpage/eval',
                            type: 'get',
                            datatype: 'json',
                            success: function (data) {
                                if(data[0].length!=0){
                                    $(data[0]).each(function (key, value) {
                                        str1 +='<div class="col-12 row justify-content-center">' +
                                            '<div class="col-md-1"  style="margin-bottom: 30px;"><img width="80px" src="${pageContext.request.contextPath}/resources/images/userphoto/nopic.jpg"></div>' +
                                            '<div class="col-md-7">'+value.checkIn.substr(0,10)+' ~ '+ value.checkOut.substr(0,10)+ '에 '+value.roomsId+'방을 이용한 사용자 '+value.userName+'('+value.userId+')님을 평가해주세요!</div>' +
                                            '<div class="col-md-2"><button onclick="writee('+value.reservationNum+')">평가하기</button></div>' +
                                            '  </div>'
                                    });

                                } else{
                                        str1+= '<p style="text-align: center">평가할 사용자가 없습니다!</p>'
                                }
                               if(data[1].length!=0){

                                   $(data[1]).each(function (key, value) {
                                       str2 +='<div class="col-12 row justify-content-center">' +
                                           '<div class="col-md-1"  style="margin-bottom: 30px;"><img width="80px" src="${pageContext.request.contextPath}/resources/images/userphoto/nopic.jpg"></div>' +
                                           '<div class="col-md-7"><p>['+value.reservationNum+'] ' +value.checkIn.substr(0,10)+' ~ '+ value.checkOut.substr(0,10)+ '에 '+value.roomsId+'방을 이용한 사용자 '+value.userName+'('+value.userId+')님을 평가했습니다.</p>'
                                       +value.evaluationContent+
                                           '<p style="text-align: right">'+value.evaluationDate.substr(0,10)+'</p> </div>' +
                                           '<div class="col-md-2"><button onclick="moddiy('+value.reservationNum+')">수정하기</button></div>' +
                                           '</div>'

                                   });
                               }
                            $('#noteval').html(str1);
                            $('#yeseval').html(str2);
                            },
                            error: function () {
                                alert(error);
                            }
                        });




                    }
                   function writee(reservationNum){
                       $('#yeseval').html('');
                       $('#noteval').html('');
                        var str = '<div class="col-12 row justify-content-center"> <div class="col-md-7 form-group"><label for="evalcontent">예약번호 : '+reservationNum+'</label> ' +
                       '<textarea class="form-control" rows="10" id="evalcontent"></textarea><input type="button" onclick="inserteval('+reservationNum+')" class="form-control" value="작성하기"> </div></div>'
                       $('#noteval').html(str);
                   }
                    function moddiy(num){
                        $('#yeseval').html('');
                        $('#noteval').html('');
                        $.ajax({
                            url: '${pageContext.request.contextPath}/hostpage/eval/select',
                            type: 'post',
                            data: {
                                reservationNum:num
                            },
                            datatype: 'json',
                            success: function (data) {
                                $('#yeseval').html('');
                                $('#noteval').html('');
                                var str = '<div class="col-12 row justify-content-center"> <div class="col-md-7 form-group"><label for="evalcontent">예약번호 : '+data.reservationNum+'</label> ' +
                                    '<textarea class="form-control" rows="10" id="evalcontent" >'+data.evaluationContent+'</textarea><input type="button" onclick="realmodi('+data.reservationNum+')" class="form-control" value="작성하기"> </div></div>'
                                $('#noteval').html(str);
                            },
                            error: function () {
                                alert(error);
                            }
                        });

                    }
                    function realmodi(num){
                        var msg = $('#evalcontent').val();
                        if(msg!=''){
                            $.ajax({
                                url: '${pageContext.request.contextPath}/hostpage/eval/modi',
                                type: 'post',
                                data: {
                                    reservationNum:num,
                                    evaluationContent:msg
                                },
                                datatype: 'json',
                                success: function (data) {
                                    eval();
                                },
                                error: function () {
                                    alert(error);
                                }
                            });
                        }else{
                            eval();
                        }
                    }


                    function inserteval(num) {
                        var msg = $('#evalcontent').val();
                        if(msg!=''){
                        $.ajax({
                            url: '${pageContext.request.contextPath}/hostpage/eval/write',
                            type: 'post',
                            data: {
                                reservationNum:num,
                                evaluationContent:msg
                            },
                            datatype: 'json',
                            success: function (data) {
                                eval();
                            },
                            error: function () {
                                alert(error);
                            }
                        });
                    }else{
                        eval();
                    }
                    }

                </script>

            </div>
            <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">...</div>
            <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">...</div>
        </div>

    </div>
</div>

</body>
<html>

