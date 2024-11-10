<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Message Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #e0e0e0; /* 전체 배경 회색 */
        }
        .container {
            width: 90%;
            max-width: 350px; /* 컨테이너 최대 너비를 줄임 */
            padding: 15px;
            background-color: #f4f4f4; /* 컨테이너 배경 연한 회색 */
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            text-align: center; /* 컨테이너 내 요소 가운데 정렬 */
        }
        h2 {
            color: #333;
            margin-bottom: 15px;
            font-size: 1.2em;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: center; /* 테이블 셀 내용 가운데 정렬 */
            border-bottom: 1px solid #bbb;
            font-size: 0.9em;
        }
        th {
            background-color: #888;
            color: white;
            font-weight: bold;
        }
        tr:hover {
            background-color: #d0d0d0;
        }
        td a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }
        td a:hover {
            color: #555;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>메시지 보내기</h2>
    <table>
        <tr>
            <th>ID</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <c:if test="${user.id != loggedInUser}">
                <tr>
                    <td><a href="sendMessage?receiverId=${user.id}" target="_self">${user.id}</a></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</div>

</body>
</html>