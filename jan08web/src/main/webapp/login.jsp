<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>
<style>
body {
    background: #f5f5f5;
    background-size: 50px 50px;
    background-image: linear-gradient(45deg, #eee 25%, transparent 25%, transparent 75%, #eee 75%, #eee 100%), linear-gradient(45deg, #eee 25%, white 25%, white 75%, #eee 75%, #eee 100%);
}

.container {
    width: 100%;
    margin: 0 auto;
}

header {
    background-color: #00c73c;
    padding: 10px;
    text-align: center;
}

.main {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}

.mainStyle {
    background-color: #fff;
    padding: 40px; /* 전체적인 padding 조절 */
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.login {
    margin: 0 auto;
    width: 320px;
    min-height: 100px;
    background-color: #fff;
    padding: 20px;
    box-sizing: border-box;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 8px;
}

#welcomeText {
    font-size: 30px; /* 텍스트 크기 조절 */
    color: #00c73c;
    font-weight: bold;
    margin-bottom: 20px; /* 위치 조절 */
    animation: blinkText 1s infinite;
}

.login input {
    width: 100%;
    height: 40px;
    text-align: left;
    color: #333;
    margin-bottom: 15px;
    box-sizing: border-box;
    padding: 10px; /* 내부 padding 조절 */
    border: 1px solid #ccc;
    border-radius: 4px;
}

.login button {
    width: 100%;
    height: 40px;
    color: #fff;
    font-size: 18px; /* 버튼 폰트 크기 조절 */
    background-color: #00c73c;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-bottom: 5px; /* 로그인 버튼과 초기화 버튼 간의 간격 조절 */
}

.login button:hover {
    background-color: #009032;
}

/* 초기화 버튼 스타일 추가 */
.login button[type="reset"] {
    color: #00c73c; /* 글자색은 메뉴와 같은 색상 */
    background-color: white; /* 테두리 안쪽 배경색 흰색으로 설정 */
    border: 1px solid #00c73c; /* 테두리 색상 */
    margin-right: 5px;
}

.login a {
    display: block;
    margin-top: 20px; /* 간격 조절 */
    font-size: 18px; /* 링크 폰트 크기 조절 */
    color: #00c73c;
    text-decoration: none;
}

.login a:hover {
    text-decoration: underline;
}

#errorMSG {
    color: red;
    font-size: 16px; /* 오류 메시지 폰트 크기 조절 */
    margin-top: 10px;
}

@keyframes blinkText {
    0% {
        opacity: 0;
    }
    50% {
        opacity: 1;
    }
    100% {
        opacity: 0;
    }
}


    </style>

    <!-- 이하 script 부분 생략 -->
</head>
<body>
    <div class="container">
        <header>
            <%@ include file="menu.jsp"%>
        </header>
        <div class="main">
            <div class="mainStyle">
                <article>
                    <div class="login">
                        <div id="welcomeText">始めまして!</div>
                        <form name="loginForm" action="./login" method="post" onsubmit="return validateForm()">
                            <input type="text" name="id" placeholder="아이디를 입력하세요.">
                            <input type="password" name="pw" placeholder="패스워드를 입력하세요.">
                            <button type="reset">초기화</button>
                            <button type="submit">로그인</button>
                            <div id="errorMSG"></div>
                        </form>
                        <a href="./join">회원가입</a>
                    </div>
                </article>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function err() {
        let errBox = document.querySelector("#errorMSG");
        errBox.innerHTML = "<marquee>올바른 아이디와 패스워드를 입력하세요.</marquee>";
        errBox.style.color = 'blue';
        errBox.style.fontSize = "12pt";
    }
</script>
	<c:if test="${param.error ne null }">
		<script type="text/javascript">
			err()
		</script>
	</c:if>
	<footer>
	<c:import url="footer.jsp"/>
	</footer>
</body>
</html>