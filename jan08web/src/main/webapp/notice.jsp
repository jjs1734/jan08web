<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>notice</title>
    <link href="./css/index.css" rel="stylesheet"/>
    <link href="./css/menu.css" rel="stylesheet"/>
    <script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>
    <header>
        <%@ include file="menu.jsp"%>
    </header>
    <div class="main">
        <div class="mainStyle">
        <article>
            <h1>공지사항</h1>
            <!-- 클라이언트 IP 주소를 출력합니다. -->
        </article>
        <article>
            <!-- 기존의 내용 -->
        </article>
        <article>
            <!-- 기존의 내용 -->
        </article>
    </div>
    </div>
    <footer>
        <c:import url="footer.jsp"/>
    </footer>
</body>
</html>
