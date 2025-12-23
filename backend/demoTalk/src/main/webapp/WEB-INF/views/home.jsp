<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>


<input id="name" placeholder="name"><br>
<input id="msg" placeholder="message">
<button onclick="send()">Send</button>

<%--<div id="chat_head" class="chatting">--%>
<%--    <h3>톡</h3>--%>
<%--    <button type="button" class="btn_close_chat" title="채팅 종료하기"><i></i>종료</button>--%>
<%--</div>--%>
<%--<!--// 00.채팅창:head-->--%>

<%--<ul id="chat"></ul>--%>

<%--<!-- 00.채팅창:컨텐츠영역-->--%>
<%--<div id="chat_body">--%>

<%--    <c:forEach var="balloon" items="${balloons}">--%>
<%--        <div class="balloons">--%>
<%--            <c:forEach var="section" items="${balloon.sections}">--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${section.type == 'text'}">--%>
<%--                        <div class="section text">--%>
<%--                            <div class="cont">${section.data}</div>--%>
<%--                        </div>--%>
<%--                    </c:when>--%>
<%--                    <c:when test="${section.type == 'file'}">--%>
<%--                        <div class="section file">--%>
<%--                            <img src="${section.data}" alt="${section.comment}"/>--%>
<%--                        </div>--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <div class="section null">message null</div>--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>

<%--    </c:forEach>--%>
<%--</div>--%>
<%--<!--// 00.채팅창:컨텐츠영역 -->--%>

<%--<!-- 00.채팅창:bottom -->--%>
<%--<div id="chat_bottom">--%>
<%--    <div class="emo-view"><!-- active -->--%>
<%--        <p class="img">--%>
<%--            <img src="" alt=""/>--%>
<%--        </p>--%>
<%--        <a href="#n" class="close"><span class="blind">닫기</span></a>--%>
<%--    </div>--%>


<%--    <div class="textarea_area">--%>
<%--        <div class="btn_image_send_area">--%>
<%--            <button type="button" class="btn_send_image" title="이미지 보내기">이미지 보내기</button>--%>
<%--        </div>--%>
<%--        <textarea class="form_text"--%>
<%--                  placeholder="메시지를 입력해주세요."--%>
<%--                  data-placeholder="메시지를 입력해주세요." id="autosize_form01"></textarea>--%>
<%--        <div class="btn_send_area">--%>
<%--            <button type="button" class="btn_send out" title="메세지 보내기" id="btn_send">메세지 보내기</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>

<script>
    let stomp;
    const chat = document.getElementById("chat");

    function connect(){
        const socket = new SockJS("/ws");
        stomp = Stomp.over(socket);

        stomp.connect({}, () => {
            stomp.subscribe("/topic/chat", (data)=>{
                const msg = JSON.parse(data.body);
                const li = document.createElement("li");
                li.innerText = msg.message;
                chat.appendChild(li);
            })
        })
    }

    function send(){
        stomp.send("/app/send", {}, JSON.stringify({
            // sender: document.getElementById("name").value,
            message: document.getElementById("msg").value
        }))
    }

    connect();
</script>

</body>
</html>