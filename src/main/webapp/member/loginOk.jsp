<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<center>${memName}님이 로그인하셨습니다.</center>
<table align="center">
<tr>
 <td align="center">
  <input type="button" value="로그아웃" onclick="location.href='/springProject/member/logout'">
  <input type="button" value="회원정보수정" onclick="location.href='/springProject/member/modifyForm'">
 </td>
</tr>
</table>