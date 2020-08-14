<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="../css/member.css">
<form id="checkPostForm">
 <table border = "1" cellspacing="0" cellpadding="4" id="postTable">
  <tr>
  <th width="80">시도</th>
  <td width="100"><select name="sido" id="sido" style="width: 100px">
  <option value="" selected>시도선택</option>
  <option value="서울">서울</option>
  <option value="인천">인천</option>
  <option value="대전">대전</option>
  <option value="대구">대구</option>
  <option value="울산">울산</option>
  <option value="세종">세종</option>
  <option value="광주">광주</option>
  <option value="경기">경기</option>
  <option value="강원">강원</option>
  <option value="전남">전남</option>
  <option value="전북">전북</option>
  <option value="경남">경남</option>
  <option value="경북">경북</option>
  <option value="충남">충남</option>
  <option value="충북">충북</option>
  <option value="부산">부산</option>
  </select>
  <div id="sidoDiv"></div>
  </td>
  <th width="80">시.군.구</th>
  <td><input type="text" name="sigungu" id="sigungu" size="25">
  <div id="sigunguDiv"></div>
  </td>
  </tr>
  
  <tr>
  <th>도로명</th>
  <td colspan="3">
  <input type="text" name="roadname" id="roadname" size="30">
  <input type="button" id="postSearchBtn" value="검색">
  <div id="roadnameDiv"></div>
  </td>
  </tr>
  
  <tr>
  <th>우편번호</th>
  <th colspan="3">주소</th>
  </tr>
  <c:if test="${list != null }">
   <c:forEach var="zipcodeDTO" items="${list }">
   <c:set var="address" value="${zipcodeDTO.sido 
   } ${zipcodeDTO.sigungu
   } ${zipcodeDTO.yubmyundong
   } ${zipcodeDTO.ri
   } ${zipcodeDTO.roadname
   } ${zipcodeDTO.buildingname}"/>
   
  		<tr>
  		 <td align="center">${zipcodeDTO.zipcode }</td>
  		 <td colspan="3">
  		 <a id="addressA" href="#" onclick="checkPostClose('${zipcodeDTO.zipcode }','${address }')">${address }</a>
  		 </td>
  		</tr>
  		
  	</c:forEach>
  	</c:if>
 </table>
</form>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
























