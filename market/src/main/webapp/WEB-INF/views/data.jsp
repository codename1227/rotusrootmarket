<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="" />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'" href="https://fonts.googleapis.com/css2?display=swap&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900&amp;family=Plus+Jakarta+Sans%3Awght%40400%3B500%3B700%3B800" />
    <title>Item Details</title>
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
<script>
    function openMessagePopup() {
        window.open('${pageContext.request.contextPath}/message', 'MessagePopup', 'width=500,height=600,resizable=yes');
    }
</script>
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
				            <!-- 로그인된 경우, 사용자 ID 표시 및 로그아웃 버튼 -->
				            <span class="text-sm font-bold">환영합니다, ${sessionScope.loggedInUser}님!</span>
				            <form action="${pageContext.request.contextPath}/logout" method="post" style="display: inline;">
				                <button type="submit" class="bg-[#f0f2f4] text-sm font-bold px-4 h-10 rounded-xl">로그아웃</button>
				            </form>
				
				            <!-- 로그인 상태일 때만 "물품 등록" 버튼 표시 -->
<button class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-xl h-10 px-4 bg-[#f0f2f4] text-[#111318] text-sm font-bold leading-normal tracking-[0.015em] gap-2"
        onclick="window.location.href='${pageContext.request.contextPath}/add'">
    <img src="resources/images/register.png" alt="물품 등록 아이콘" class="w-7 h-7" />
    <span class="truncate">물품등록</span>
</button>
				
				        </c:when>
				        <c:otherwise>
				            <!-- 로그인되지 않은 경우, 로그인 버튼 표시 -->
				            <button onclick="window.location.href='${pageContext.request.contextPath}/login'" class="bg-[#f0f2f4] text-sm font-bold px-4 h-10 rounded-xl">
				                로그인
				            </button>
				        </c:otherwise>
				    </c:choose>
				    
<button class="flex max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-xl h-10 bg-[#f0f2f4] text-[#111318] gap-2 text-sm font-bold leading-normal tracking-[0.015em] min-w-0 px-2.5"
        onclick="openMessagePopup()">
    <img src="resources/images/message.png" alt="쪽지 아이콘" class="w-10 h-10" />
</button>
					
				</div>
            </header>
            <div class="px-40 flex flex-1 justify-center py-5">
                <div class="layout-content-container flex flex-col max-w-[960px] flex-1">
                    <div class="flex justify-between items-center px-4 pb-2 pt-4">
                        <h3 class="text-[#111318] text-lg font-bold leading-tight tracking-[-0.015em]">물품 상세 정보</h3>
                    </div>
					<div class="flex gap-8 p-4 border rounded-lg">
					    <div class="w-1/2 rounded-xl overflow-hidden" style="max-width: 400px; max-height: 400px; aspect-ratio: 1/1;">
					        <img src="${pageContext.request.contextPath}/resources/images/${item.image}" class="w-full h-full object-contain" />
					    </div>
					    <div class="w-1/2 flex flex-col justify-between">
					        <div class="flex flex-col items-start gap-4">
					            <h4 class="text-[#111318] text-xl font-bold">${item.title}</h4>
					            <p class="text-[#636f88] text-base font-normal leading-normal">${item.description}</p>
					        </div>
					        <div class="flex flex-col items-start gap-2 mt-8">
					            <p class="text-[#111318] text-lg font-bold">Price: $${item.price}</p>
					            <p class="text-[#636f88] text-sm font-normal leading-normal">Created At: ${item.created_at}</p>
					        </div>
					    </div>
					</div>
					<div class="flex justify-end mt-4 gap-4">
					    <c:choose>
					        <c:when test="${not empty sessionScope.loggedInUser}">
					            <c:if test="${sessionScope.loggedInUser == item.id}">
					                <button class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-xl h-10 px-4 bg-[#f0f2f4] text-[#111318] text-sm font-bold leading-normal tracking-[0.015em]" onclick="window.location.href='${pageContext.request.contextPath}/edit?item_id=${item.item_id}'">
					                    <span class="truncate">수정하기</span>
					                </button>
									<form action="${pageContext.request.contextPath}/items/delete" method="post" style="display: inline;">
									    <input type="hidden" name="item_id" value="${item.item_id}" />
									    <button type="submit" onclick="return confirm('삭제하시겠습니까?');" class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-xl h-10 px-4 bg-[#f0f2f4] text-[#111318] text-sm font-bold leading-normal tracking-[0.015em]">
									        <span class="truncate">삭제하기</span>
									    </button>
									</form>
					            </c:if>
					        </c:when>
					    </c:choose>
					</div>
                </div>
            </div>
            <footer class="flex justify-center">
                <div class="flex max-w-[960px] flex-1 flex-col">
                    <footer class="flex flex-col gap-6 px-5 py-10 text-center @container">
                        <div class="flex flex-wrap items-center justify-center gap-6 @[480px]:flex-row @[480px]:justify-around">
                            <a class="text-[#636f88] text-base font-normal leading-normal min-w-40">Detailed page</a>
                        </div>
                        <p class="text-[#636f88] text-base font-normal leading-normal">© 2024 lotus root market</p>
                    </footer>
                </div>
            </footer>
        </div>
    </div>
</body>
</html>
