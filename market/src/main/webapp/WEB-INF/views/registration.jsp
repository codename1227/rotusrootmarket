<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="" />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'" href="https://fonts.googleapis.com/css2?display=swap&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900&amp;family=Plus+Jakarta+Sans%3Awght%40400%3B500%3B700%3B800" />
    <title>Registration</title>
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
                    <h2 class="text-[#111318] text-lg font-bold leading-tight tracking-[-0.015em]">Lotus Root Market - 물품 등록</h2>
                </div>
            </header>
            <div class="px-40 flex flex-1 justify-center py-5">
                <div class="layout-content-container flex flex-col max-w-[600px] flex-1">
                    <h3 class="text-[#111318] text-lg font-bold leading-tight tracking-[-0.015em] px-4 pb-2 pt-4">물품 등록</h3>
                    <form action="${pageContext.request.contextPath}/items/add" method="post" class="flex flex-col gap-4 p-4 border rounded-lg">
                        <div class="flex flex-col gap-2">
                            <label for="title" class="text-[#111318] text-base font-medium">물품명</label>
                            <input type="text" id="title" name="title" class="border px-3 py-2 rounded-md" placeholder="물품 제목을 입력하세요" required />
                        </div>
                        <div class="flex flex-col gap-2">
                            <label for="description" class="text-[#111318] text-base font-medium">물품 설명</label>
                            <textarea id="description" name="description" class="border px-3 py-2 rounded-md" rows="4" placeholder="물품 설명을 입력하세요" required></textarea>
                        </div>
                        <div class="flex flex-col gap-2">
                            <label for="price" class="text-[#111318] text-base font-medium">가격 (₩)</label>
                            <input type="number" id="price" name="price" class="border px-3 py-2 rounded-md" min="1" placeholder="가격을 입력하세요" required />
                        </div>
                        <div class="flex flex-col gap-2">
                            <label for="imagePath" class="text-[#111318] text-base font-medium">이미지 경로</label>
                            <input type="text" id="image" name="image" class="border px-3 py-2 rounded-md" placeholder="이미지 경로를 입력하세요" />
                        </div>
                        <button type="submit" class="mt-4 bg-blue-500 text-white py-2 px-4 rounded-md">물품 등록하기</button>
                    </form>
                </div>
            </div>
            <footer class="flex justify-center">
                <div class="flex max-w-[600px] flex-1 flex-col">
                    <footer class="flex flex-col gap-6 px-5 py-10 text-center @container">
                        <div class="flex flex-wrap items-center justify-center gap-6 @[480px]:flex-row @[480px]:justify-around">
                            <a class="text-[#636f88] text-base font-normal leading-normal min-w-40">registrationpage</a>
                        </div>
                        <p class="text-[#636f88] text-base font-normal leading-normal">© 2024 lotus root market</p>
                    </footer>
                </div>
            </footer>
        </div>
    </div>
</body>
</html>
