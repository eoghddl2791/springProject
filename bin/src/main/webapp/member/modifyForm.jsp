<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="memberDTO" value="${requestScope.memberDTO }"></c:set>
<h3>회원정보수정</h3>
<form name="modifyForm" id="modifyForm" method="post" action="/springProject/member/modify">
<table border="1" cellspacing="0" cellpadding="4">
 <tr>
  <td width="100" align="center"><font color="red">*</font>이름</td>
  <td><input type="text" size="20" name="name" id="name" value="${memberDTO.name }">
  <div id="nameResult" style="display: none;"></div></td>
 </tr>
 
 <tr>
  <td align="center"><font color="red">*</font>아이디</td>
  <td>
  <input type="text" size="25" name="id" readonly value="${memberDTO.id }"  onkeypress="inputId();">
  <input type="button" value="중복체크" onclick="checkId()">
  </td>
 </tr>
 
 <tr>
  <td align="center"><font color="red">*</font>비밀번호</td>
  <td><input type="password" size="35" name="pwd">
  <div id="pwdWriteResult" style="display: none;"></div></td>
 </tr>
 
 <tr>
  <td align="center"><font color="red">*</font>재확인</td>
  <td><input type="password" size="35" name="repwd">
  <div id="rePwdWriteResult" style="display: none;"></div></td>
 </tr>
 
 <tr>
  <td align="center">성별</td>
  <td>
  <input type="radio" value="0" name="gender">남자
  <input type="radio" value="1" name="gender">여자
  </td>
 </tr>
 
 <tr>
  <td align="center">이메일</td>
  <td>
   <input type="text" name="email1" id="email1" size="15" value="${memberDTO.email1 }"> @
   <input type="email" name="email2" id="email2" size="15" list="defaultEmails" value="${memberDTO.email2 }">
   <datalist id="defaultEmails">
    <option value="naver.com">
    <option value="gmail.com">
    <option value="daum.net">
   </datalist>
  </td>
 </tr>
 
 <tr>
  <td align="center">핸드폰</td>
  <td>
  <select name="tel1" id="tel1" value="${memberDTO.tel1 }" style="width: 50px;">
   <option value="010">010</option>
   <option value="011">011</option>
   <option value="019">019</option>
  </select> -
  <input type="text" name="tel2" value="${memberDTO.tel2 }" size="4"> -
  <input type="text" name="tel3" value="${memberDTO.tel3 }" size="4">
  </td>
 </tr>
 
 <tr>
  <td align="center">주소</td>
  <td>
   <input type="text" size="7" name="zipcode" id="zipcode" value="${memberDTO.zipcode }" readonly>
   <input type="button" value="우편번호검색" onclick="checkPost()"><br>
   <input type="text" name="addr1" id="addr1" size="50" placeholder="주소" value="${memberDTO.addr1 }" readonly><br>
   <input type="text" name="addr2" id="addr2" size="50" placeholder="상세 주소" value="${memberDTO.addr2 }"><br>
 </tr>
  
 <tr>
  <td align="center" colspan="2">
   <input type="button" value="회원정보수정" id="modifyBtn">
   <input type="reset" value="다시작성">
  </td>
 </tr>
</table>
</form>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
window.onload=function(){
	document.modifyForm.gender[${memberDTO.gender }].checked=true;
	
	//document.getElementById('email1').value = '${memberDTO.email1 }';
	document.modifyForm.email2.value = ${memberDTO.email2 };
	
	//document.getElementById('tel1').value = '${memberDTO.tel1 }';
	document.modifyForm.tel1.value = ${memberDTO.tel1 };
}
</script>