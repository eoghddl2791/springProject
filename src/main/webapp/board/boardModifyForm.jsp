<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="boardModifyForm" id="boardModifyForm">
<input type="hidden" name="seq" id="seq" value="${seq }">
<input type="hidden" name="pg" id="pg" value="${pg }">
<h3>글수정</h3>
<table border="1" cellspacing="0" cellpadding="4">
 <tr>
  <td width="70" align="center">제목</td>
  <td><input type="text" name="subject" id="subject" size="58">
  <div id="subjectDiv"></div></td>
 </tr>
 <tr>
  <td align="center">내용</td>
  <td>
  <textarea cols="65" rows="15" placeholder="내용 입력" name="content" id="content" style="resize:none;"></textarea>
  <div id="contentDiv"></div>
  </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="button" value="글수정" id="boardModifyBtn">
   <input type="reset" value="다시작성">
  </td>
 </tr>
</table>
</form>
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
			
			$('#subject').val(data.boardDTO.subject);
			$('#content').val(data.boardDTO.content);
			
		},
		error: function(){
			console.log(err);
		}
	});
});

$('#boardModifyBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	if($('#subject').val() == ""){
		$('#subjectDiv').text('제목을 입력해주세요');
		$('#subjectDiv').css('color', 'red');
		$('#subjectDiv').css('font-size', '8pt');
		$('#subjectDiv').css('font-weight', 'bold');
	}else if($('#content').val() == ""){
		$('#contentDiv').text('내용을 입력해주세요');
		$('#contentDiv').css('color', 'red');
		$('#contentDiv').css('font-size', '8pt');
		$('#contentDiv').css('font-weight', 'bold');
	}else{
		$.ajax({
			type: 'post',
			url: '/springProject/board/boardModify',
			data: $('#boardModifyForm').serialize(),
			success: function(){
				alert("글수정 완료");
				location.href = '/springProject/board/boardList?pg='+$('#pg').val();
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});

</script>