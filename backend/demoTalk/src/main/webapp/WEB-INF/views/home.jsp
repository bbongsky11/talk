<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>


<%--<input id="name" placeholder="name"><br>--%>
<%--<input id="msg" placeholder="message">--%>
<%--<button onclick="send()">Send</button>--%>

<%--&lt;%&ndash;<div id="chat_head" class="chatting">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <h3>톡</h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <button type="button" class="btn_close_chat" title="채팅 종료하기"><i></i>종료</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!--// 00.채팅창:head-->&ndash;%&gt;--%>

<%--&lt;%&ndash;<ul id="chat"></ul>&ndash;%&gt;--%>

<%--&lt;%&ndash;<!-- 00.채팅창:컨텐츠영역-->&ndash;%&gt;--%>
<%--&lt;%&ndash;<div id="chat_body">&ndash;%&gt;--%>

<%--&lt;%&ndash;    <c:forEach var="balloon" items="${balloons}">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="balloons">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <c:forEach var="section" items="${balloon.sections}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <c:when test="${section.type == 'text'}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="section text">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="cont">${section.data}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <c:when test="${section.type == 'file'}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="section file">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img src="${section.data}" alt="${section.comment}"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="section null">message null</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;    </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!--// 00.채팅창:컨텐츠영역 -->&ndash;%&gt;--%>

<%--&lt;%&ndash;<!-- 00.채팅창:bottom -->&ndash;%&gt;--%>
<%--&lt;%&ndash;<div id="chat_bottom">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="emo-view"><!-- active -->&ndash;%&gt;--%>
<%--&lt;%&ndash;        <p class="img">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <img src="" alt=""/>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <a href="#n" class="close"><span class="blind">닫기</span></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>


<%--&lt;%&ndash;    <div class="textarea_area">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="btn_image_send_area">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <button type="button" class="btn_send_image" title="이미지 보내기">이미지 보내기</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <textarea class="form_text"&ndash;%&gt;--%>
<%--&lt;%&ndash;                  placeholder="메시지를 입력해주세요."&ndash;%&gt;--%>
<%--&lt;%&ndash;                  data-placeholder="메시지를 입력해주세요." id="autosize_form01"></textarea>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="btn_send_area">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <button type="button" class="btn_send out" title="메세지 보내기" id="btn_send">메세지 보내기</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>


<%--<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>--%>

<%--<script>--%>
<%--    let stomp;--%>
<%--    const chat = document.getElementById("chat");--%>

<%--    function connect(){--%>
<%--        const socket = new SockJS("/ws");--%>
<%--        stomp = Stomp.over(socket);--%>

<%--        stomp.connect({}, () => {--%>
<%--            stomp.subscribe("/topic/chat", (data)=>{--%>
<%--                const msg = JSON.parse(data.body);--%>
<%--                const li = document.createElement("li");--%>
<%--                li.innerText = msg.message;--%>
<%--                chat.appendChild(li);--%>
<%--            })--%>
<%--        })--%>
<%--    }--%>

<%--    function send(){--%>
<%--        stomp.send("/app/send", {}, JSON.stringify({--%>
<%--            // sender: document.getElementById("name").value,--%>
<%--            message: document.getElementById("msg").value--%>
<%--        }))--%>
<%--    }--%>

<%--    connect();--%>
<%--</script>--%>

<%--</body>--%>
<%--</html>--%>