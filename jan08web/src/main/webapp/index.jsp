<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="./css/index.css" rel="stylesheet"/>
<link href="./css/menu.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>

	<header>
		<%@ include file="menu.jsp"%>
		<!-- jsp:은 출력 결과만 화면에 나옵니다. -->
	</header>
	<div class="main">
		<article>
			<img alt="login" src="./img/2222.png">
		</article>
		<article>
			<c:import url="menu.jsp"/>
			<br>
		</article>
	</div>
	<footer>
	<c:import url="footer.jsp"/>
	</footer>
</body>
</html>