<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="" />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'" href="https://fonts.googleapis.com/css2?display=swap&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900&amp;family=Plus+Jakarta+Sans%3Awght%40400%3B500%3B700%3B800" />
    <title>chat</title>
    <link rel="icon" type="image/x-icon" href="data:image/x-icon;base64," />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
</head>
<style>
@font-face {
    font-family: 'TmoneyRoundWindExtraBold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.custom-font {
    font-family: 'TmoneyRoundWindExtraBold';
    font-size: 26px;
}
</style>
<body>
    <div class="relative flex size-full min-h-screen flex-col bg-white group/design-root overflow-x-hidden" style='font-family: "Plus Jakarta Sans", "Noto Sans", sans-serif;'>
        <div class="layout-container flex h-full grow flex-col">
            <header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-b-[#f0f2f4] px-10 py-3">
                <div class="flex items-center gap-4 text-[#111318]">
                    <div class="size-4">
                        <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"></svg>
                    </div>
					<h2 class="custom-font" style="color: #e78111;">
					    <a href="${pageContext.request.contextPath}/main" style="text-decoration: none; color: #e78111; display: inline-flex; align-items: center;">
					        <img src="resources/images/logo.png" style="width: 60px; height: auto; margin-right: 3px;">
					        연근 마켓
					    </a>
					</h2>
                </div>
				<div class="header-form flex gap-2 items-center">
				    <c:choose>
				        <c:when test="${not empty sessionScope.loggedInUser}">
				            <span class="text-sm font-bold">환영합니다, ${sessionScope.loggedInUser}님!</span>
				            <form action="${pageContext.request.contextPath}/logout" method="post" style="display: inline;">
				                <button type="submit" class="bg-[#f0f2f4] text-sm font-bold px-4 h-10 rounded-xl">로그아웃</button>
				            </form>
				            <button class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-xl h-10 px-4 bg-[#f0f2f4] text-[#111318] text-sm font-bold leading-normal tracking-[0.015em]" 
				                onclick="window.location.href='${pageContext.request.contextPath}/add'">
				                <span class="truncate">물품 등록</span>
				            </button>
				        </c:when>
				        <c:otherwise>
				            <button onclick="window.location.href='${pageContext.request.contextPath}/login'" class="bg-[#f0f2f4] text-sm font-bold px-4 h-10 rounded-xl">
				                로그인
				            </button>
				        </c:otherwise>
				    </c:choose>
				    <button class="flex max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-xl h-10 bg-[#f0f2f4] text-[#111318] gap-2 text-sm font-bold leading-normal tracking-[0.015em] min-w-0 px-2.5">
				        <div class="text-[#111318]" data-icon="ShoppingCart" data-size="20px" data-weight="regular">
				            <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" viewBox="0 0 256 256">
				                <path d="M222.14,58.87A8,8,0,0,0,216,56H54.68L49.79,29.14A16,16,0,0,0,34.05,16H16a8,8,0,0,0,0,16h18L59.56,172.29a24,24,0,0,0,5.33,11.27,28,28,0,1,0,44.4,8.44h45.42A27.75,27.75,0,0,0,152,204a28,28,0,1,0,28-28H83.17a8,8,0,0,1-7.87-6.57L72.13,152h116a24,24,0,0,0,23.61-19.71l12.16-66.86A8,8,0,0,0,222.14,58.87ZM96,204a12,12,0,1,1-12-12A12,12,0,0,1,96,204Zm96,0a12,12,0,1,1-12-12A12,12,0,0,1,192,204Zm4-74.57A8,8,0,0,1,188.1,136H69.22L57.59,72H206.41Z"></path>
				            </svg>
				        </div>
				    </button>
				</div>
            </header>
            <div class="px-40 flex flex-1 justify-center py-5">
                <div class="layout-content-container flex flex-col max-w-[960px] flex-1">
                    <div class="flex justify-between items-center px-4 pb-2 pt-4">
                        <h3 class="text-[#111318] text-lg font-bold leading-tight tracking-[-0.015em]">채팅</h3>
                    </div>
                    <div class="chat-window p-4 border border-gray-200 rounded-lg overflow-y-auto max-h-80 mb-4" id="chatWindow">
                        <!-- 실시간 채팅 메시지가 여기에 추가됩니다. -->
                    </div>
                    <div class="flex gap-2 items-center">
                        <input type="text" id="messageInput" class="flex-1 border border-gray-200 rounded-lg p-2" placeholder="메시지를 입력하세요...">
                        <button onclick="sendMessage()" class="bg-[#e78111] text-white px-4 py-2 rounded-lg">전송</button>
                    </div>
                </div>
            </div>
           <footer class="flex justify-center">
                <div class="flex max-w-[960px] flex-1 flex-col">
                    <footer class="flex flex-col gap-6 px-5 py-10 text-center @container">
                        <div class="flex flex-wrap items-center justify-center gap-6 @[480px]:flex-row @[480px]:justify-around">
                            <a class="text-[#636f88] text-base font-normal leading-normal min-w-40">Homepage</a>
                        </div>
                        <p class="text-[#636f88] text-base font-normal leading-normal">© 2024 lotus root market</p>
                    </footer>
                </div>
            </footer>
         </div>
     </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    const senderId = "${sessionScope.loggedInUser}";
    const receiverId = "<%= request.getParameter("id") %>"; // URL 파라미터로 전달된 id 사용
    const itemId = "<%= request.getParameter("item_id") %>"; // URL 파라미터로 전달된 item_id 사용

    // 서버에서 메시지 목록을 가져와서 채팅 창에 표시하는 함수
    function loadMessages() {
        $.get("${pageContext.request.contextPath}/getMessages", { itemId: itemId }, function(messages) {
            $('#chatWindow').empty(); // 이전 메시지 삭제
            messages.forEach(message => {
                const messageElement = `<div><strong>${message.sender_id}</strong>: ${message.message}</div>`;
                $('#chatWindow').append(messageElement);
            });
            $('#chatWindow').scrollTop($('#chatWindow')[0].scrollHeight); // 스크롤을 가장 아래로 이동
        });
    }

    // 메시지를 전송하는 함수
    function sendMessage() {
        const message = $('#messageInput').val();
        if (message.trim() === '') return;

        $.post("${pageContext.request.contextPath}/sendMessage", {
            itemId: itemId,
            senderId: senderId,
            receiverId: receiverId,
            message: message
        }, function(response) {
            if (response === 'success') {
                $('#messageInput').val('');
                loadMessages(); // 메시지를 보낸 후 즉시 메시지 목록을 갱신
            }
        });
    }

    // 페이지 로드 시 메시지를 주기적으로 갱신
    $(document).ready(function() {
        loadMessages(); // 초기 메시지 로드
        setInterval(loadMessages, 3000); // 3초마다 메시지 갱신
    });
</script>
</body>
</html>