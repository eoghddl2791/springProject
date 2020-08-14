<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#currentPaging {
	color: red;
	text-decoration: underline;
}
</style>
<form name="imageboardListForm">
<table border="1" cellspacing="0" cellpadding="4" rules="rows"
	frame="hsides" id="imageboardListTable">
	<tr>
		<td width="100" align="center"><input type="checkbox"
			onclick="checkAll()" id="all">번호</td>
		<td width="200" align="center">이미지</td>
		<td width="150" align="center">상품명</td>
		<td width="150" align="center">단가</td>
		<td width="100" align="center">개수</td>
		<td width="150" align="center">합계</td>
	</tr>
</table>
<div style="width: 900px;">
<div style="float: left;">
	<c:if test="${memId == 'admin' }">
		<input type="button" value="선택삭제" onclick="choiceDelete()">
	</c:if>
</div>
<div style="width: 830px; text-align: center; top: -100px; float: left; display: inline-block;">${boardPaging.pagingHTML }</div>
</div>
</form>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/springProject/imageboard/getImageboardList',
		data: 'pg=${pg}',
		dataType: 'json',
		success: function(data){
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>', {
					align: 'center',
					text: items.seq
				})).append($('<td/>', {
					align: 'center'
					}).append($('<img/>',{
						src: '../storage/'+items.image1,
						style: 'cursor: pointer; width: 70px; height: 70px;'
					}))
				).append($('<td/>', {
					align: 'center',
					text: items.imageName
				})).append($('<td/>', {
					align: 'center',
					text: items.imagePrice.toLocaleString()
				})).append($('<td/>', {
					align: 'center',
					text: items.imageQty.toLocaleString()
				})).append($('<td/>', {
					align: 'center',
					text: items.imageSum.toLocaleString()
				})).appendTo($('#imageboardListTable'))
			});
		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>
<script type="text/javascript">
	function boardPaging(pg) {
		location.href = "/miniProject/imageboard/imageboardList.do?pg=" + pg;
	}
	function checkAll(checkbox) {
		var check = document.getElementsByName("check");
		var rowcheck = check.length - 1;
		if (document.getElementById("all").checked) {
			for (var i = 0; i <= rowcheck; i++) {
				check[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowcheck; i++) {
				check[i].checked = false;
			}
		}
	}
	function choiceDelete() {
		let check = document.getElementsByName("check");
		let count = 0;
		for(i=0; i<check.length; i++){
			if(check[i].checked) count++;
		}
		
		if(count==0){
			alert("삭제할 항목을 선택해주세요");
		}else{
			if(confirm("정말로 삭제하시겠습니까?")){
				document.imageboardListForm.submit();
			}
		}
		
		//var result = confirm("정말삭제하시겠습니까?");
		/* if (result) {
			location.href = "../imageboard/imageboardDelete.do?seq=" + 0
			seq;
			break;
		} */
	}
</script>

















