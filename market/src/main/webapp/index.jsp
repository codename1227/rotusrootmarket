<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="information.Item" %>
<%@ page import="information.ItemController" %>

<%
    ItemController itemController = new ItemController();
    List<Item> items = itemController.getAllItems();
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>아이템 목록</title>
</head>
<body>
    <h2>아이템 목록</h2>
    <table border="1">
        <tr>
            <th>아이템 ID</th>
            <th>사용자 ID</th>
            <th>제목</th>
            <th>설명</th>
            <th>가격</th>
        </tr>
        
        <% for (Item item : items) { %>
            <tr>
                <td><%= item.getItemId() %></td>
                <td><%= item.getUserId() %></td>
                <td><%= item.getTitle() %></td>
                <td><%= item.getDescription() %></td>
                <td><%= item.getPrice() %> 원</td>
            </tr>
        <% } %>
    </table>
</body>
</html>
