<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<form name="boardViewForm">
<input type="hidden" name="seq" id="seq" value="${seq }">
<input type="hidden" name="pg" id="pg" value="${pg }">

 <table border="1" cellspacing="0" cellpadding="4" frame="hsides" rules="rows">
  <tr>
   <th colspan="3"><span id="subjectSpan"></span></th>
  </tr>
  <tr>
   <td width="100" align="center">글번호: <span id="seqSpan"></span></td>
   <td width="200" align="center">작성자: <span id="nameSpan"></span></td>
   <td width="100" align="center">조회수: <span id="hitSpan"></span></td>
  </tr>
  <tr>
   <td colspan="3" height="200" valign="top"><pre><span id="contentSpan"></span></pre></td>
  </tr>
 
 </table>
</form>
 <input type="button" value="목록" onclick="location.href='boardList?pg=${pg}'">
 <input type="button" value="답글" onclick="mode(3)">

<span id="boardViewSpan">
 <input type="button" value="글수정" onclick="mode(1)">
 <input type="button" value="글삭제" onclick="mode(2)">
</span>


<script type="text/javascript">
function mode(num){
	if(num == 1){//글수정
		document.boardViewForm.method = 'post';
		document.boardViewForm.action = 'boardModifyForm';
		document.boardViewForm.submit();
		
	}else if(num == 2){//글삭제
		alert("asdf");
		if(confirm("삭제하시겠습니까?")){
			document.boardViewForm.method = 'post';
			document.boardViewForm.action = 'boardDelete';
			document.boardViewForm.submit();
		}
		
	}else if(num == 3){//답글
		document.boardViewForm.method = 'post';
		document.boardViewForm.action = 'boardReplyForm';
		document.boardViewForm.submit();
		
	}
}
</script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/springProject/board/getBoardView',
		data: 'seq='+$('#seq').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#subjectSpan').text(data.boardDTO.subject);
			$('#seqSpan').text(data.boardDTO.seq);
			$('#nameSpan').text(data.boardDTO.name);
			$('#hitSpan').text(data.boardDTO.hit);
			$('#contentSpan').text(data.boardDTO.content);
			
			if(data.memId == data.boardDTO.id){
				$('#boardViewSpan').show();
			}else{
				$('#boardViewSpan').hide();
			}
			
		},
		error: function(){
			console.log(err);
		}
	});
});
</script>





















