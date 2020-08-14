<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form id="loginForm">
	<h3>
		<center>로그인</center>
	</h3>
	<table align="center">
		<tr>
			<td width="70px" align="center">아이디</td>
			<td><input type="text" name="id" id="loginId">
				<div id="idResult" style="display: none;"></div>
			</td>
		</tr>

		<tr>
			<td align="center">비밀번호</td>
			<td><input type="password" name="pwd" id="loginPwd">
				<div id="pwdResult" style="display: none;"></div>
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="2"><input type="button" value="로그인"
				id="loginBtn"> <input type="button"
				value="회원가입" onclick="location.href='/springProject/member/writeForm'">
		</tr>
	</table>
	<br><br>
	<div style="text-align: center" id="loginResultDiv"></div>
</form>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>





