<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/miniProject/member/checkId.do">
${requestScope.id }는 사용불가능합니다.<br>
아이디<input type="text" size="20" name="id">
<input type="submit" value="검색">
</form>
</body>
</html>