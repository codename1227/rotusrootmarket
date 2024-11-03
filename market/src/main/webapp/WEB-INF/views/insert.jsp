<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 폼</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		    
		    .form-group1 {
		    display: flex;
		    flex-direction: column; /* Stack buttons vertically */
		    width: 100%; /* Full width */
		}
		
		.btn-full {
		    width: 100%; /* Button takes full width */
		    padding: 10px; /* Add some padding for better appearance */
		    margin: 5px 0; /* Margin between buttons */
		    background-color: #4CAF50; /* Change to desired button color */
		    color: white; /* Text color */
		    border: none; /* Remove default border */
		    border-radius: 5px; /* Rounded corners */
		    font-size: 16px; /* Increase font size */
		    cursor: pointer; /* Change cursor on hover */
		    transition: background-color 0.3s; /* Smooth background transition */
		}
		
		.btn-full:hover {
		    background-color: #45a049; /* Darker shade on hover */
		}
    
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }


        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 14px;
        }

        input[type="checkbox"] {
            margin-right: 5px;
        }

        button,
        input[type="submit"],
        input[type="reset"] {
            background-color: #e78111; /* Green */
            border: none;
            color: white;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover,
        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #e78111;
        }

        #errorMessage {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        #authTimer {
            margin-left: 10px;
            font-weight: bold;
            color: red;
        }
        .back {
		    position: absolute; /* 또는 fixed로 변경 가능 */
		    top: 10px;         /* 상단에서의 위치 (조정 가능) */
		    left: 10px;        /* 왼쪽에서의 위치 (조정 가능) */
		}
		
		
		.back_button {
		    background-color: transparent; /* 기본 배경색 없음 */
		    border: none;                  /* 기본 테두리 없음 */
		    color: inherit;                /* 부모 요소의 색상 사용 */
		    padding: 0;                   /* 기본 패딩 없음 */
		    text-align: center;           /* 중앙 정렬 */
		    text-decoration: none;        /* 기본 텍스트 장식 없음 */
		    font-size: 14px;              /* 기본 폰트 크기 */
		    cursor: pointer;              /* 포인터 커서 사용 */
		    transition: none;             /* 호버 시 배경색 변경 없음 */
		}
		
		/* 호버 효과를 원하신다면 아래와 같이 추가하실 수 있습니다 */
		.back_button:hover {
		    opacity: 0.8; /* 호버 시 약간 투명해지기 */
		}
		
		
		
    </style>
</head>
<body>
	<div class="back">
	    <button type="button" class="back_button" onclick="goBack()">
	        <img src="resources/images/back.png" style="width: 30px; height: auto; vertical-align: middle;">
	    </button>
	</div>
    <div class="container">
    <h2 class="custom-font" style="color: #e78111;">
        <img src="resources/images/logo.png" style="width: 50px; height: auto; vertical-align: middle;">
        정보 입력해주세요
    </h2>
        <form name="frm1" method="post" action="insert" accept-charset="UTF-8" onsubmit="return validateForm()">
            <div class="form-group">
                <input type="text" name="id" id="id" placeholder="아이디" required onblur="checkId()" >
            </div>
            <div class="form-group">
				<input type="password" name="passwd" id="passwd" placeholder="비밀번호" required>
            </div>
            <div class="form-group">
                <input type="text" name="email" id="email" placeholder="이메일" required>
            </div>
            <div class="form-group">
                <input type="text" name="name" id="name" placeholder="이름" required>
            </div>
            <div class="form-group">
                <input type="text" name="authNum" id="authNum" placeholder="인증번호" required>
                <span id="authTimer"></span> <!-- 타이머 표시 -->            
                <button type="button" onclick="sendAuthEmail()">인증 이메일 발송</button>
                <button type="button" onclick="checkAuthCode()">인증 확인</button>
            </div>
            <div class="form-group">
                <input type="checkbox" id="agreeCheckbox">이용약관 및 개인정보 수집에 동의합니다.</input>
            </div>
            <div id="errorMessage"></div>
			<div class="form-group1" style="text-align: center; width: 100%;">
			    <input type="reset" value="다시입력" class="btn-full">
			    <input type="submit" id ="submit" value="가입하기" class="btn-full">
			</div>
        </form>
    </div>

    <script>
    
    $(document).ready(function() {
        $('#submit').on('click', function(e) {  // 괄호 수정
            // 입력 필드의 값 가져오기
            var id = $('#name').val();

            // 입력된 ID를 콘솔에 출력합니다.
            console.log("입력된 ID:", id);
        });
    });

    
    	var id = document.getElementById('id').value;  
    
        var isAuthVerified = false; // 이메일 인증 상태 변수

         function validateForm() {
            var id = document.getElementById('id').value;
            var passwd = document.getElementById('passwd').value;
            var email = document.getElementById('email').value;
            var name = document.getElementById('name').value;
            var agreeCheckbox = document.getElementById('agreeCheckbox').checked;

            if (!id || !passwd || !email || !name) {
                alert('모든 필수 항목을 입력해주세요.');
                return false;
            }

            if (!agreeCheckbox) {
                alert('약관에 동의해주세요.');
                return false;
            }

            if (!isAuthVerified) { // 이메일 인증 확인
                alert('이메일 인증을 먼저 해주세요.');
                return false;
            }

            return true;
        } 

        function checkId() {
            var id = document.getElementById('id').value;
            if (id) {
                var xhr = new XMLHttpRequest();
                xhr.open('GET', '/checkId?id=' + id, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        if (xhr.responseText == 'true') {
                            alert('아이디가 이미 존재합니다.');
                        }
                    }
                };
                xhr.send(null);
            }
        }

        function sendAuthEmail() {
            var email = $('#email').val();
            if (email) {
                $.ajax({
                    url: '/market/sendMail',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ email: email }),
                    success: function (response) {
                        alert('인증 이메일이 발송되었습니다. 인증 번호를 입력해주세요.');
                        startAuthTimer(3 * 60); // 3분 타이머 시작
                    },
                    error: function(xhr) {
                        alert('이메일 발송 중 오류가 발생했습니다.');
                    }
                });
            } else {
                alert('이메일을 입력해주세요.');
            }
        }

        function startAuthTimer(duration) {
            var timer = duration, minutes, seconds;
            var timerDisplay = $('#authTimer'); // 타이머 표시할 요소 선택
            timerDisplay.text(formatTime(timer)); // 초기 타이머 설정

            var interval = setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                timerDisplay.text(formatTime(timer)); // 남은 시간 업데이트

                if (--timer < 0) {
                    clearInterval(interval);
                    timerDisplay.text("시간 초과"); // 시간 초과 시 메시지 표시
                    $('#authNum').prop('disabled', true); // 인증 번호 입력 비활성화
                }
            }, 1000);
        }

        function checkAuthCode() {
            var email = $('#email').val();
            var authNum = $('#authNum').val();

            if (email && authNum) {
                $.ajax({
                    url: '/market/mailauthCheck',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ email: email, authNum: authNum }),
                    success: function (response) {
                        // 인증이 성공적으로 완료되었을 때
                        alert('인증이 완료되었습니다!');
                        isAuthVerified = true; // 인증 상태를 true로 설정
                    },
                    error: function (xhr) {
                        alert('인증 코드가 잘못되었습니다.');
                    }
                });
            } else {
                alert('이메일과 인증 번호를 입력해주세요.');
            }
        }

        function formatTime(time) {
            var minutes = Math.floor(time / 60);
            var seconds = time % 60;
            return minutes + "분 " + (seconds < 10 ? "0" + seconds : seconds) + "초"; // 포맷팅
        }
        
        function goBack() {
            window.history.back();
        }
        
    </script>
</body>
</html>
