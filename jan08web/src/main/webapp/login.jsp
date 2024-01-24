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
	background-color: white;
}

.login {
	margin: 0 auto;
	width: 320px;
	min-height: 100px;
	background-color: red;
	padding: 10px;
	box-sizing: border-box;
	text-align: center;
}

.login input {
	width: 100%;
	height: 30px;
	text-align: left;
	color: red;
	margin-bottom: 10px;
	box-sizing: border-box;
}

.login button {
	width: 45%;
	height: 30px;
	color: red;
	font-size: large;
}

h1 {
	text-align: center;
	color: red;
}
</style>
<script type="text/javascript">
	function err() {
		let errBox = document.querySelector("#errorMSG");
		errBox.innerHTML = "<marquee>올바른 아이디와 패스워드를 입력하세요.</marquee>";
		errBox.style.color = 'blue';
		errBox.style.fontSize = "12pt";
	}
</script>
</head>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<!--<h1>login</h1>-->
					<img alt="login" src="./img/yahoo2.png">
					<c:if test="${param.error ne null}">
						<script type="text/javascript">
							alert("올바른 아이디와 패스워드를 입력하세요.");
						</script>
					</c:if>
					<div class="login">
						<form action="./login" method="post">
							<input type="text" name="id" placeholder="아이디를 입력하세요."> <input
								type="password" name="pw" placeholder="패스워드를 입력하세요.">
							<button type="reset">初期化</button>
							<button type="submit">ログイン</button>
							<div id="errorMSG"></div>
						</form>
						<a href="./join">회원가입</a>
					</div>
				</article>
			</div>
		</div>
	</div>
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