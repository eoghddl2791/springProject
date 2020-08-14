<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;회원가입</h3>
<form name="writeForm" method="post" action="/springProject/member/write">
	<table border="1" cellspacing="0" cellpadding="4">
		<tr>
			<td width="70" align="center">이름</td>
			<td><input type="text" size="20" name="name" id="name"
				placeholder="이름입력">
				<div id="nameResult" style="display: none;"></div></td>
		</tr>
		<tr>
			<td width="70" align="center">아이디</td>
			<td><input type="text" size="25" name="id" id="id" placeholder="아이디 입력" onkeypress="inputId();">
			    <input type="hidden"name="idDuplication" id="idDuplication" value="idUncheck">
				<div id="idWriteResult" style="display: none;"></div></td>
		</tr>
		<tr>
			<td width="70" align="center">비밀번호</td>
			<td><input type="password" size="35" name="pwd">
				<div id="pwdWriteResult" style="display: none;"></div></td>
		</tr>
		<tr>
			<td width="70" align="center">재확인</td>
			<td><input type="password" size="35" name="repwd">
				<div id="rePwdWriteResult" style="display: none;"></div></td>
		</tr>
		<tr>
			<td width="70" align="center">성별</td>
			<td><input type="radio" value="0" name="gender" checked>남자
				<input type="radio" value="1" name="gender">여자</td>
		</tr>

		<tr>
			<td width="70" align="center">이메일</td>
			<td><input type="text" name="email1" size="15"> @ <input
				type="email" name="email2" size="15" list="defaultEmails"
				placeholder="직접 입력"> <datalist id="defaultEmails">
					<option value="naver.com">
					<option value="gmail.com">
					<option value="daum.net">
				</datalist></td>
		</tr>

		<tr>
			<td width="70" align="center">핸드폰</td>
			<td><select name="tel1" style="width: 50px;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="019">019</option>
			</select> - <input type="text" name="tel2" size="4"> - <input
				type="text" name="tel3" size="4"></td>
		</tr>

		<tr>
			<td width="70" align="center">주소</td>
			<td>
			<input type="text" size="7" name="zipcode" id="zipcode"readonly> 
			<input type="button" value="우편번호검색" id="checkPost"><br> 
			<input type="text" name="addr1" id="addr1" size="50" placeholder="주소" readonly><br>
			<input type="text" name="addr2" id="addr2" size="50" placeholder="상세 주소"><br>
		</tr>

		<tr>
			<td align="center" colspan="2"><input type="button" value="회원가입"
				id="writeBtn"> <input type="reset"
				value="다시작성"></td>
		</tr>
	</table>
</form>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>