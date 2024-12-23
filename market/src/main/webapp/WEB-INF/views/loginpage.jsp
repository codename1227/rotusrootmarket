<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<style>

@font-face {
    font-family: 'TmoneyRoundWindExtraBold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.custom-font {
    font-family: 'TmoneyRoundWindExtraBold';
}

* {
	padding: 0;
	margin: 0;
	border: none;
}

body {
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
	background-color: #F8F8F8;
	color: #333;
}

.login-wrapper {
	width: 400px;
	height: 80%;
	padding: 25px;
	box-sizing: border-box;
	background-color: #fff;
	border-radius: 6px;
}

.login-wrapper>h2 {
	font-size: 24px;
	color: #000000; 
	margin-bottom: 20px;
}

#login-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#login-form>input::placeholder {
	color: #D2D2D2;
}

#login-form>input[type="submit"], #login-form>input[type="button"] {
	margin-top: 13px; 
	margin-bottom: 0px; 
	color: #fff;
	font-size: 16px;
	background-color: #e78111;
	border-radius: 6px;
}

#login-form>input[type="submit"] {
	margin-right: 20px; 
}


#login-form>input[type="checkbox"] {
	display: none;
}

#login-form>label {
	display: inline-block;
	position: relative;
	padding-left: 26px;
	cursor: pointer;
	color: #999999;
}

#login-form>label::before {
	content: "";
	display: inline-block;
	width: 16px;
	height: 16px;
	border: 1px solid #999999;
	border-radius: 3px;
	background-color: #fff;
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
}

#login-form>input[type="checkbox"]:checked+label::before {
	content: "✔";
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 12px;
	color: #000;
}
</style>
</head>
<body>
	<div class="login-wrapper">
		<h2 class="custom-font" style="color: #e78111;">
		    <a href="${pageContext.request.contextPath}/main" style="text-decoration: none; color: #e78111;">
		        <img src="resources/images/logo.png" style="width: 50px; height: auto; vertical-align: middle;">
		        연근 마켓
		    </a>
		</h2>
		<img src="resources/images/main.png" style="width: 250px; height: auto; margin-left:40px;">
		<form id="login-form" action="login" method="post"
			class="d-flex align-items-center">
			<input type="text" name="id" maxlength="50" placeholder="아이디"
				value="${rememberedId}"> <input type="password"
				name="passwd" maxlength="16" placeholder="비밀번호"> <input
				type="checkbox" id="remember-check" name="remember-check"> <label
				for="remember-check">아이디를 저장하시겠습니까?</label> <input type="submit"
				value="로그인"> <input type="button" value="회원가입"
				onclick="location.href='insert'">
		</form>
	</div>

	<c:if test="${not empty error}">
		<script>
			alert("${error}");
		</script>
	</c:if>
</body>
</html>
