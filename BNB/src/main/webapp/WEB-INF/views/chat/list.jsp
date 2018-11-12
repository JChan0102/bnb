<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%@ include file="/resources/common/includeHead.jsp" %>
</head>
<body id="mainback">

<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

<!-- Modal -->

    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Modal Header</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <p>Some text in the modal.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>










<script>

    function getTimeStamp(datea) {
        var d = null;
        console.log(typeof datea);
        if (datea) {
            d = new Date(datea);
        } else {
            d = new Date();
        }
        var s =
            leadingZeros(d.getFullYear(), 4) + '-' +
            leadingZeros(d.getMonth() + 1, 2) + '-' +
            leadingZeros(d.getDate(), 2) + ' ' +
            leadingZeros(d.getHours(), 2) + ':' +
            leadingZeros(d.getMinutes(), 2);
        return s;
    }

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();

        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }
</script>
<%@ include file="/resources/common/Navbar.jsp" %>
<div class="row">
    <div class="col-2">
        <c:forEach var="list" items="${chatRoomList}">
            <a href="${pageContext.request.contextPath}/chat/list?roomsId=${list.roomsId}&hostId=${list.hostId}&userId=${list.userId}">
                <div class="jchanList">
                    <c:choose>
                        <c:when test="${list.userId eq loginUser.userId}">
                            ${list.hostId}와의 채팅<br>
                            방 번호 : ${list.roomsId}
                        </c:when>
                        <c:otherwise>
                            ${list.userId}와의 채팅<br>
                            방 번호 : ${list.roomsId}
                        </c:otherwise>
                    </c:choose>
                </div>
            </a>
        </c:forEach>
    </div>
    <div class="col-8">
        <c:if test="${!empty lists}">
            <div class="col-12">
                <div class="col-11"
                     style="margin: 0 auto; border: 1px solid #01D1FE; height: 700px; border-radius: 10px; overflow:scroll"
                     id="chatArea">
                    <div id="chatMessageArea" style="margin-top : 10px; margin-left:10px;"></div>
                </div>
            </div>
            <c:forEach var="item" items="${lists}">
                <script>
                    if (('${item.userId}' == '${sessionScope.loginUser.userId}' && '${item.receive}' == 'H') || ('${item.hostId}' == '${sessionScope.loginUser.userId}' && '${item.receive}' == 'U')) {
                        $("#chatMessageArea").append("<div class='row justify-content-end' style = 'height : auto; margin-top : 5px;'>" +
                            "<div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'>" +
                            "</div>" +
                            "<div class = 'col-6 ' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>${item.messagecontent}</span></div>" +
                            "<div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >" + getTimeStamp('${item.messageDate}') + "</span></div></div>")
                    } else {
                        $("#chatMessageArea").append("<div class='row justify-content-start' style = 'height : auto; margin-top : 5px;'>" +
                            "<div class='col-1' style = 'float:right; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='/displayFile?fileName=${userImage}&directory=profile' style = 'width:50px; height:50px; '>" +
                            "</div>" +
                            "<div class = 'col-6' style = ' background-color:gray; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>${item.messagecontent}</span></div>" +
                            "<div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >" + getTimeStamp('${item.messageDate}') + "</span></div></div></div>"
                        );
                    }

                    $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);

                </script>
            </c:forEach>

            <!-- 채팅 입력창 -->
            <div class="col-12" style="margin-top: 20px; margin-bottom: 15px;">
                <div class="col-12" style="float: left">
			<textarea class="form-control"
                      style="border: 1px solid #01D1FE; height: 65px; float: left; width: 80%"
                      placeholder="Enter ..." id="message"></textarea>
                    <span style="float: right; width: 18%; height: 65px; text-align: center; background-color: #01D1FE; border-radius: 5px;">
				<a style="margin-top: 30px; text-align: center; color: white; font-weight: bold;"
                   id="sendBtn"><br>전송</a>
			</span>
                </div>

            </div>
            <script type="text/javascript">

                connect();

                function connect() {
                    sock = new SockJS('${pageContext.request.contextPath}/chat');
                    sock.onopen = function () {
                        console.log('open');
                    };
                    sock.onmessage = function (evt) {
                        var data = evt.data;
                        console.log(data);
                        var obj = JSON.parse(data);
                        console.log(obj);
                        appendMessage(obj);
                    };
                }


                function send() {
                    var msg = $("#message").val();
                    if (msg != "") {
                        message = {};
                        message.messagecontent = $("#message").val()
                        message.hostId = '${chatroom.hostId}'//고정값이여야함
                        message.userId = '${chatroom.userId}'//고정값이여야함
                        message.roomsId = '${chatroom.roomsId}'//고정값이여야함
                        message.sender = '${sessionScope.loginUser.userId}'
                    }


                    sock.send(JSON.stringify(message));
                    $("#message").val("");
                }


                function appendMessage(obj) {
                    if (obj.userId == '${chatroom.userId}' && obj.hostId == '${chatroom.hostId}' && obj.roomsId == '${chatroom.roomsId}') {
                        if (obj.messagecontent == '') {
                            return false;
                        } else {
                            if (obj.sender == '${sessionScope.loginUser.userId}') {
                                $("#chatMessageArea").append("<div class='row justify-content-end' style = 'height : auto; margin-top : 5px;'>" +
                                    "<div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'>" +
                                    "</div>" +
                                    "<div class = 'col-6 ' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>" + obj.messagecontent + "</span></div>" +
                                    "<div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >" +
                                    getTimeStamp(obj.messageDate)
                                    + "</span></div></div>")
                            } else {
                                $("#chatMessageArea").append("<div class='row justify-content-start' style = 'height : auto; margin-top : 5px;'>" +
                                    "<div class='col-1' style = 'float:right; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='/displayFile?fileName=${userImage}&directory=profile' style = 'width:50px; height:50px; '>" +
                                    "</div>" +
                                    "<div class = 'col-6' style = ' background-color:gray; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>" + obj.messagecontent + "</span></div>" +
                                    "<div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >" + getTimeStamp(obj.messageDate) + "</span></div></div></div>"
                                );
                            }

                            $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
                        }
                        $.ajax({
                            url: '${pageContext.request.contextPath}/chat/list/ck?roomsId=' + obj.roomsId + '&hostId=' + obj.hostId + '&userId=' + obj.userId,
                            type: 'get',
                            datatype: 'json',
                            success: function (data) {
                                var cnt = 0;
                                for (var i = 1; i < 5; i++) {
                                    if ($('#list' + i).text() == '') {
                                        cnt++
                                    }

                                }
                                if (cnt == 0) {
                                    $('#jchannotice').css('display', 'inline');
                                }
                            },
                            error: function () {
                                alert(error);
                            }
                        });
                    }
                }

                $(document).ready(function () {
                    $('#message').keypress(function (event) {
                        var keycode = (event.keyCode ? event.keyCode : event.which);
                        if (keycode == '13') {
                            send();
                        }
                        event.stopPropagation();
                    });
                    $('#message').keyup(function (event) {
                        var keycode = (event.keyCode ? event.keyCode : event.which);
                        if (keycode == '13') {
                            $("#message").val("");
                        }
                        event.stopPropagation();
                    });

                    $('#sendBtn').click(function () {
                        send();
                    });
                    /* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
                });


            </script>

        </c:if>
    </div>
</div>


</body>
</html>