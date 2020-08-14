<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" name="imageboardWriteForm" id="imageboardWriteForm">
	<table border="1" cellspacing="0" cellpadding="4">
		<tr>
			<td>상품코드</td>
			<td><input type="text" value="img_" name="imageId" id="imageId">
			<div id="imageIdDiv"></div>
			</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td><input type="text" name="imageName" id="imageName" placeholder="상품명입력">
			<div id="imageNameDiv"></div>
			</td>
		</tr>
		<tr>
			<td>단가</td>
			<td><input type="number" name="imagePrice" id="imagePrice" placeholder="단가입력">
			<div id="imagePriceDiv"></div>
			</td>
		</tr>
		<tr>
			<td>갯수</td>
			<td><input type="number" name="imageQty" id="imageQty" placeholder="갯수 입력">
			<div id="imageQtyDiv"></div>
			</td>
		</tr>
		<tr>
			<td>내용입력</td>
			<td><textarea rows="10" cols="30" placeholder="내용입력"
					name="imageContent" id="imageContent"></textarea>
			<div id="imageContentDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="file" value="파일전송" name="img" id="image1" size="60"><!-- submit을 쓸려고 name속성을 잡는다. -->
			<div id="image1Div"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="file" value="파일전송" name="img" id="image2" size="60"><!-- submit을 쓸려고 name속성을 잡는다. -->
			<div id="image1Div"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="file" value="파일전송" name="img[]" id="image3" size="60" multiple><!-- submit을 쓸려고 name속성을 잡는다. -->
			<div id="image1Div"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button"
				value="이미지등록" id="imageboardWriteBtn"> <input
				type="reset" value="다시작성"></td>
		</tr>
	</table>
</form>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$('#imageboardWriteBtn').click(function(){
	$('#imageIdDiv').empty();
	$('#imageNameDiv').empty();
	$('#imagePriceDiv').empty();
	$('#imageQtyDiv').empty();
	$('#imageContentDiv').empty();
	$('#image1Div').empty();
	
	if($('#imageId').val() == 'img_' || $('#imageId').val() == ''){
		$('#imageIdDiv').text('상품코드를 입력하세요');
		$('#imageIdDiv').css('color', 'red');
		$('#imageIdDiv').css('font-size', '8pt');
		$('#imageIdDiv').css('font-weight', 'bold');
	}else if($('#iamgeName').val() == ''){
		$('#iamgeNameDiv').text('상품이름를 입력하세요');
		$('#iamgeNameDiv').css('color', 'red');
		$('#iamgeNameDiv').css('font-size', '8pt');
		$('#iamgeNameDiv').css('font-weight', 'bold');
	}else if($('#iamgePrice').val() == ''){
		$('#iamgePriceDiv').text('상품단가를 입력하세요(숫자만 입력)');
		$('#iamgePriceDiv').css('color', 'red');
		$('#iamgePriceDiv').css('font-size', '8pt');
		$('#iamgePriceDiv').css('font-weight', 'bold');
	}else if($('#imageQty').val() == ''){
		$('#imageQtyDiv').text('상품갯수를 입력하세요(숫자만 입력)');
		$('#imageQtyDiv').css('color', 'red');
		$('#imageQtyDiv').css('font-size', '8pt');
		$('#imageQtyDiv').css('font-weight', 'bold');
	}else if($('#imageContent').val() == ''){
		$('#imageContentDiv').text('상품내용을 입력하세요');
		$('#imageContentDiv').css('color', 'red');
		$('#imageContentDiv').css('font-size', '8pt');
		$('#imageContentDiv').css('font-weight', 'bold');
	}else{
		//document.imageboardWriteForm.submit();
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false, //문자열로 주소값이 아닌 내가 원하는 타입으로 들어간다.
			contentType: false, 
			url: '/springProject/imageboard/imageboardWrite',
			data: new FormData($('#imageboardWriteForm')[0]),
			success: function(){
				alert("저장완료!!");
				location.href="../imageboard/imageboardList"
			},
			error: function(err){
				console.log(err);
			}
			
		});
	}
});
</script>









