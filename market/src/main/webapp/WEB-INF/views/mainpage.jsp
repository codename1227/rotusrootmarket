<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="" />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'" href="https://fonts.googleapis.com/css2?display=swap&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900&amp;family=Plus+Jakarta+Sans%3Awght%40400%3B500%3B700%3B800" />
    <title>mainpage</title>
    <link rel="icon" type="image/x-icon" href="data:image/x-icon;base64," />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
</head>
<body>
    <div class="relative flex size-full min-h-screen flex-col bg-white group/design-root overflow-x-hidden" style='font-family: "Plus Jakarta Sans", "Noto Sans", sans-serif;'>
        <div class="layout-container flex h-full grow flex-col">
            <header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-b-[#f0f2f4] px-10 py-3">
                <div class="flex items-center gap-4 text-[#111318]">
                    <div class="size-4">
                        <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"></svg>
                    </div>
                    <h2 class="text-[#111318] text-lg font-bold leading-tight tracking-[-0.015em]">lotus root market</h2>
                </div>
                <div class="flex gap-2">
                    <button class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-xl h-10 px-4 bg-[#f0f2f4] text-[#111318] text-sm font-bold leading-normal tracking-[0.015em]">
                        <span class="truncate">Sign in</span>
                    </button>
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
                    <h3 class="text-[#111318] text-lg font-bold leading-tight tracking-[-0.015em] px-4 pb-2 pt-4">거래 목록</h3>
                    <div class="grid grid-cols-[repeat(auto-fit,minmax(158px,1fr))] gap-3 p-4">
                    
                        <div class="flex flex-wrap gap-3 pb-3">
                            <c:forEach var="item" items="${items}">
                                <div class="flex flex-col gap-2 p-4 border rounded-lg flex-1 min-w-[200px] max-w-[300px]">
                                    <div class="w-full bg-center bg-no-repeat aspect-square bg-cover rounded-xl" style="background-image: url('https://cdn.usegalileo.ai/stability/a469ecb7-9ea2-45e5-ba75-55bdba0b350d.png');"></div>
                                    <div>
                                        <p class="text-[#111318] text-base font-medium leading-normal">${item.title}</p>
                                        <p class="text-[#636f88] text-sm font-normal leading-normal">$${item.price}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                    </div>
                </div>
            </div>
            <footer class="flex justify-center">
                <div class="flex max-w-[960px] flex-1 flex-col">
                    <footer class="flex flex-col gap-6 px-5 py-10 text-center @container">
                        <div class="flex flex-wrap items-center justify-center gap-6 @[480px]:flex-row @[480px]:justify-around">
                            <a class="text-[#636f88] text-base font-normal leading-normal min-w-40" href="#">Homepage</a>
                        </div>
                        <p class="text-[#636f88] text-base font-normal leading-normal">© 2024 lotus root market</p>
                    </footer>
                </div>
            </footer>
        </div>
    </div>
</body>
</html>