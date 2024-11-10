<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chat with ${receiverId}</title>
    <style>
        body, html {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        .popup-container {
            display: flex;
            flex-direction: column;
            width: 100%;
            height: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 1.2em;
            font-weight: bold;
            text-align: center;
            padding-bottom: 10px;
            border-bottom: 1px solid #ccc;
            margin-bottom: 10px;
        }
        .back_button {
            background: none;
            border: none;
            cursor: pointer;
            padding: 0;
            display: flex;
            align-items: center;
        }
        .back_button img {
            width: 24px;
            height: 24px;
        }
        .chat-container {
            flex: 1;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            background-color: #ffffff;
            overflow-y: auto;
            overflow-x: hidden;
            margin-bottom: 10px;
        }
        .message {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin: 5px 0;
        }
        .message.sender {
            align-items: flex-end;
        }
        .message-content {
            max-width: 60%;
            padding: 8px 12px;
            border-radius: 10px;
            background-color: #f1f1f1;
            font-size: 0.9em;
            word-wrap: break-word;
            position: relative;
        }
        .message.sender .message-content {
            background-color: #d1e7dd;
            text-align: right;
        }
        .message.receiver .message-content {
            background-color: #f8d7da;
            text-align: left;
        }
        .timestamp {
            font-size: 0.8em;
            color: #999;
            margin-top: 2px;
            text-align: right;
        }
        .input-container {
            display: flex;
            gap: 5px;
            margin-top: 10px;
        }
        .input-container textarea {
            flex: 1;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            resize: none;
            font-size: 0.9em;
            box-sizing: border-box;
        }
        .send-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            height: auto;
        }
        .send-button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        // 페이지 로드 시 스크롤을 맨 아래로 이동
        window.onload = function() {
            var chatContainer = document.querySelector(".chat-container");
            chatContainer.scrollTop = chatContainer.scrollHeight;
        };

        // message.jsp로 이동하는 뒤로가기 기능
        function goBack() {
            window.location.href = '${pageContext.request.contextPath}/message';
        }
    </script>
</head>
<body>

<div class="popup-container">
    <div class="header">
        <button type="button" class="back_button" onclick="goBack()">
	        <img src="resources/images/back.png" alt="뒤로가기">
	    </button>
        <span>${receiverId} 채팅방</span>
    </div>

    <div class="chat-container">
        <c:forEach var="msg" items="${messageHistory}">
            <div class="message ${msg.sender_id == loggedInUser ? 'sender' : 'receiver'}">
                <span class="message-content">
                    <span class="username">${msg.sender_id == loggedInUser ? '나' : '상대'}:</span>
                    ${msg.content}
                </span>
                <span class="timestamp">${msg.timestamp}</span>
            </div>
        </c:forEach>
    </div>

    <form action="sendMessage" method="post" class="input-container">
        <input type="hidden" name="sender_id" value="${loggedInUser}">
        <input type="hidden" name="receiver_id" value="${receiverId}">

        <textarea id="content" name="content" rows="2" placeholder="메시지를 입력하세요..."></textarea>
        <button type="submit" class="send-button">보내기</button>
    </form>
</div>

</body>
</html>