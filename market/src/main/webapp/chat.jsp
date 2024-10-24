<%@ page import="java.util.List" %>
<%@ page import="information.ChatController" %>
<%@ page import="information.Chat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String itemIdParam = request.getParameter("item_id");
    int itemId = 0;
    if (itemIdParam != null && !itemIdParam.isEmpty()) {
        try {
            itemId = Integer.parseInt(itemIdParam);
        } catch (NumberFormatException e) {
            out.println("잘못된 아이템 ID입니다.");
            return;
        }
    } else {
        out.println("아이템 ID가 제공되지 않았습니다.");
        return;
    }

    ChatController chatController = new ChatController();
    List chatMessages = chatController.getChatsForItem(itemId);
%>
<html>
<head>
    <title>아이템 채팅</title>
</head>
<body>
    <h1>아이템 채팅</h1>
    <h2>채팅 메시지</h2>
    <ul>
        <% for (int i = 0; i < chatMessages.size(); i++) { %>
            <% Chat message = (Chat) chatMessages.get(i); %>
            <li><strong>보낸 사람 ID:</strong> <%= message.getSenderId() %> - <%= message.getMessage() %> <em>(<%= message.getSentAt() %>)</em></li>
        <% } %>
    </ul>

    <h2>메시지 보내기</h2>
    <form action="sendChat.jsp" method="post">
        <input type="hidden" name="item_id" value="<%= itemId %>" />
        <label for="sender_id">보낸 사람 ID:</label>
        <input type="text" id="sender_id" name="sender_id" required /><br/>
        <label for="receiver_id">받는 사람 ID:</label>
        <input type="text" id="receiver_id" name="receiver_id" required /><br/>
        <label for="message">메시지:</label><br/>
        <textarea id="message" name="message" required></textarea><br/>
        <input type="submit" value="메시지 보내기" />
    </form>
</body>
</html>