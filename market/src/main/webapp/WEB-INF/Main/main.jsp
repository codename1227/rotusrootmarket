<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<style>
    /* 기본 스타일 설정 */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    } 
    /* 헤더 스타일 */
    #header {
        background-color: #f8f9fa;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    #header .logo {
        font-size: 24px;
        font-weight: bold;
    }
    #header .user-info {
        font-size: 16px;
    }
    #header .user-info a {
        margin-left: 10px;
        color: #007bff;
        text-decoration: none;
    }
    /* 광고 섹션 스타일 */
    #ad-section {
        background-color: #e9ecef;
        padding: 20px;
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        color: #333;
    }
    /* 메인 컨텐츠 스타일 */
    #main-content {
        padding: 20px;
        font-size: 16px;
    }
</style>
</head>
<body>

<!-- 헤더 -->
<div id="header">
    <div class="logo">로고</div>
    <div class="user-info">
        <span>로그인 정보: 사용자님</span>
        <a href="logout.do">로그아웃</a>
    </div>
</div>

<!-- 광고 섹션 -->
<div id="ad-section">
    광고 배너가 표시됩니다.
</div>

<!-- 메인 컨텐츠 -->
<div id="main-content">
    <h2>메인 컨텐츠</h2>
    <p>여기에 주요 콘텐츠가 들어갑니다. 새로운 상품, 인기 상품, 추천 상품 등을 표시할 수 있습니다.</p>
</div>

</body>
</html>
