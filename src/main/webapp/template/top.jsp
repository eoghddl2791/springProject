<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>
	<img src="../image/github.png" width="50" height="50"
		onclick="location.href='/springProject/main/index'"
		style="cursor: pointer;">Spring MVC기반의 미니 프로젝트
</h2>
<c:choose>
	<c:when test="${memId != null }">
		<a href="/springProject/board/boardWriteForm">글쓰기</a>
		<c:if test="${memId !=null && memId == 'admin' }">
			<a href="/springProject/imageboard/imageboardWriteForm">이미지등록</a>
		</c:if>
	</c:when>
</c:choose>
<a href="/springProject/board/boardList">목록</a>
<a href="/springProject/imageboard/imageboardList">이미지목록</a>
<a href="/springProject/member/mypage">마이페이지</a>