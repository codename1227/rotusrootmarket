<%@ page import="information.ChatController" %>
<%@ page import="information.Chat" %>
<%
    int itemId = Integer.parseInt(request.getParameter("item_id"));
    int senderId = Integer.parseInt(request.getParameter("sender_id"));
    int receiverId = Integer.parseInt(request.getParameter("receiver_id"));
    String message = request.getParameter("message");

    Chat chatMessage = new Chat(itemId, senderId, receiverId, message);
    ChatController chatController = new ChatController();
    chatController.sendMessage(chatMessage);

    response.sendRedirect("itemChat.jsp?item_id=" + itemId);
%>
