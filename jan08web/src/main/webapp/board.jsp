<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>
<style type = "text/css">
table {
	width: 900px;
	height: 400px;
	border-collapse: collapse;
}
tr:hover{
	background-color: yellow;
}
th{
	background-color: red;
	border-bottom: 2px solid black;
	color: white;
}
td{
	border-bottom: 1px solid red;
	text-align: center;
}
.title{
	text-align: left;
	width: 50%
}
.w1{
	width: 10%;
}
.w2{
	width: 20%;
}
footer{
	position: fixed;
	bottom: 0;
	width: 100%;
	height: 30px;
/*  
	background-color: blue;
	color: white;
*/	
}
.title a{
	text-decoration: none;
}
.title a:visited{
	color: black;
}
.title a:link{
	color: black;
}
.title a:hover{
	color: white;
}
.paging{
	margin: 0 auto;
	width: 600px;
	height: 30px;
	margin-top: 10px;
	line-height: 30px;
	text-align: center;
}
.currentBtn{
	background-color: red;
	color: white;
}
@keyframes blink {
  0% {
    opacity: 1;
  }
  25% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  75% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}

span {
  font-weight: small;
  color: red;
  animation: blink 2s infinite; /* 2초 간격으로 무한 반복 */
  font-size: small;
}

</style>
</head>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
				<!--for문 연습해보기<br>
					<c:forEach items="${list }" var="e" varStatus="s">
						${e.no } / ${s.first } / ${s.last } / ${s.index } / ${s.count } / ${s.step }<br>
					</c:forEach> -->
				</article>
				<article><c:choose><c:when test="${fn:length(list) gt 0 }">
							<table>
								<tr>
									<th>番号</th>
									<th>題目</th>
									<th>作成者</th>
									<th>日数</th>
									<th>照会数</th>
								</tr><c:forEach items="${list }" var="row">
									<tr>
										<td class="w1">${row.no }</td>
										<td class="title">
										<a href="./detail?page=${page }&no=${row.no }">${row.title }&nbsp;
										<c:if test="${row.comment gt 2 }"><span>HOT</span></c:if>
										<c:if test="${row.comment ne 0 }">
										<span>[${row.comment }]</span></c:if></a>
										</td>
										<td class="w2">${row.write }</td>
										<td class="w1">${row.date }</td>
										<td class="w1">${row.count }</td>
									</tr>
								</c:forEach>
							</table>
							<c:set var="totalPage" value="${totalCount / 10 }"/>
							<fmt:parseNumber integerOnly="true" value="${totalPage }" var="totalPage"/>
							<c:if test="${totalCount % 10 gt 0 }">
								<c:set var="totalPage" value="${totalPage + 1 }"/>
							</c:if>
							 <c:set var="startPage" value="1"/>
							 <c:if test="${page gt 5 }">
							 	<c:set var="startPage" value="${page - 5 }"/>
							 </c:if>
							 
							 <c:set var="endPage" value="${startPage + 9 }"/>
							 <c:if test="${endPage gt totalPage }">
							 	<c:set var="endPage" value="${totalPage }"/>
							 </c:if>
							
							
							<div class="paging">
								<button onclick="paging(1)">⏮️</button>
								<button <c:if test="${page - 10 lt 1 }">disabled="disabled"</c:if> onclick="paging(${page - 10 })">◀️</button>
								<c:forEach begin="${startPage }" end="${endPage }" var="p">
									<button <c:if test="${page eq p }">class="currentBtn"</c:if> onclick="paging(${p })">${p }</button>
								</c:forEach>
								<button <c:if test="${page + 10 gt totalPage }">disabled="disabled"</c:if> onclick="paging(${page + 10 })">▶️</button>
								<button onclick="paging(${totalPage })">⏭️</button>
							</div>
						</c:when>
						<c:otherwise>
							<h1>出力する値がありません。</h1>
							<img alt="board" src="./img/안돼.png">
						</c:otherwise>
					</c:choose>
					<c:if test="${sessionScope.mname ne null }">
					<button onclick="url('./write')">作成</button>
					${sessionScope.mname }さん、お会いできて嬉しいです。
					</c:if>
				</article>
			<!--<article>
				    <fmt:requestEncoding value="UTF-8" />
					<fmt:setLocale value="ko_kr" />
					<fmt:formatNumber value="3.14" type="number" />
					<fmt:parseNumber value="3.14" integerOnly="true" />

					<c:set var="nowDate" value="<%=new Date()%>" />
					${nowDate } <br>
					<fmt:formatDate type="time" value="${nowDate }" />
					<br>
					<fmt:formatDate type="date" value="${nowDate }" />
					<br>
					<fmt:formatDate type="both" value="${nowDate }" />
					<br>
					<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
						value="${nowDate }" />
					<br>
					<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium"
						value="${nowDate }" />
					<br>
					<fmt:formatDate type="both" dateStyle="long" timeStyle="long"
						value="${nowDate }" />
					<br>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${nowDate }" />

				</article>
				<article>
					fn이용해서 자료형 데이터 길이 뽑아내기 ${fn:length(list) }<br>



				</article> -->
			</div>
		</div>
		<footer><c:import url="footer.jsp"/></footer>
	</div>
	<script type="text/javascript">
		function paging(no){
			location.href="board?page="+no;
		}
	</script>
</body>
</html>