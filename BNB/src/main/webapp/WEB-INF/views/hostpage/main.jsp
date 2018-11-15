<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mypage</title>
    <%@ include file="/resources/common/includeHead.jsp"%>
</head>
<body style="background-color: #EEEEEE;">
<%@ include file="/resources/common/Navbar.jsp"%>



<div class="row justify-content-center">
    <div class="col-2">
        <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">예약현황</a>
            <a class="list-group-item list-group-item-action" id="list-profid" data-toggle="list" href="#list-profi" role="tab" aria-controls="profile">내방보기</a>
            <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">사용자평가</a>
            <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">호스트게시판</a>
            <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">인출</a>
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
                        <c:forEach var="room"  items="${myroomlist}">
                            <div  onclick="myroomlistselect('${room.roomsId}')" >
                                룸 번호 ( ${room.roomsId} )  <span class="badge badge-pill badge-primary">${room.reservationCount}</span>
                            </div>
                            <div class="dis" style="display: none" id="myroom${room.roomsId}"></div>
                        </c:forEach>

                        <script>
                            function myroomlistselect(roomsid) {
                                $('.dis').css('display','none');
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/hostpage/getreser?roomsId='+roomsid,
                                    type: 'get',
                                    datatype: 'json',
                                    success: function (data) {
                                        var str='';
                                        $(data).each(function (key, value){
                                            str+='<img style="width:30px; height:30px" src="${pageContext.request.contextPath}/resources/images/userphoto/nopic.jpg" alt="" />'
                                            +value.userName+'('+value.userId+')'+ value.checkIn.substring(0,9)
                                                +' ~ '+value.checkOut.substring(0,9) +' '+value.price+ '<button class="btn" onclick="rescancle('+value.reservationNum+')">예약 취소</button> <br>'
                                        });
                                        $('#myroom'+roomsid).html(str);
                                        $('#myroom'+roomsid).css('display','block')
                                        },
                                    error: function () {
                                        alert(error);
                                    }
                                });

                            }
                            function rescancle(reservationNum) {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/hostpage/delreser?Idx='+reservationNum,
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
                <div class="col-md-4">
                    <div class="card mb-4 box-shadow">
                        <img class="card-img-top">
                        <div class="card-body">
                            <p class="card-text">
                                18<br>서울특별시 종로구 교남동<br>
                                \0
                                -
                                \0
                                /박<br>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">
                                </small>
                                <div class="btn-group">
                                    <a
                                            href="/rooms/viewRooms?roomsId=18&hostId=test@test.com"><button
                                            type="button" class="btn btn-sm btn-outline-secondary ml-1">View</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">

            </div>
            <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">...</div>
            <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">...</div>
        </div>

    </div>
</div>

</body>
<html>

