<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form name="boardWriteForm" id="boardWriteForm" method="post" action="/springProject/board/boardWrite">
<h3>글쓰기</h3>
<table border="1" cellspacing="0" cellpadding="4">
 <tr>
  <td width="70" align="center">제목</td>
  <td>
  <input type="text" name="subject" id="subject" size="58" placeholder="제목입력">
  <div id="subjectDiv"></div>
  </td>
 </tr>
 <tr>
  <td align="center">내용</td>
  <td><textarea cols="65" rows="15" placeholder="내용 입력" name="content" id="content" style="resize:none;"></textarea>
  <div id="contentDiv"></div>
  </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="button" value="글쓰기" id="boardWriteBtn">
   <input type="reset" value="다시작성">
  </td>
 </tr>
</table>
</form>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/board.js"></script>