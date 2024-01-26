<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav>
	<ul>
		<li onclick="url('./')">ホーム</li>
		<li onclick="url('./board')">掲示板</li>
		<li onclick="url('./qna')">ヘルプ</li>
		<li onclick="url('./notice')">公知事項</li>
		<li onclick="url('./bootstrap')">ブートストラップ</li>
		<li onclick="url('./info')">情報</li>
		<li onclick="url('./team')">team</li>
		<li onclick="url('./coffee')">コーヒー</li>
		<c:choose>
			<c:when test="${sessionScope.mname eq null }">
				<li onclick="url('./login')">ログイン</li>
			</c:when>
			<c:otherwise>
				<li onclick="url('./myInfo')">${sessionScope.mname }さん</li>
				<li onclick="url('./logout')">ログアウト</li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${sessionScope.mgrade eq '9' }">
		<li onclick="url('./admin')">관리자</li>
			</c:when>
			</c:choose>
	</ul>
</nav>