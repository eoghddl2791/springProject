$('#boardWriteBtn').click(function(){
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
		/*
		$.ajax({
			type: 'post',
			url: '/springProject/board/boardWrite',
			data: $('#boardWriteForm').serialize(),
			success: function(){
				alert("글쓰기 완료!!");
				location.href='/springProject/board/boardList';
			},
			error: function(err){
				console.log(err);
			}
		});
		*/
		document.forms[0].submit();
	}
});
