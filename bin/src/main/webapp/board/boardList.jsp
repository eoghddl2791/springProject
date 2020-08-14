<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
#subjectA:link {
	color: black;
	text-decoration: none;
}

#subjectA:visited {
	color: black;
	text-decoration: none;
}

#subjectA:hover {
	color: green;
	text-decoration: underline;
}

#subjectA:active {
	color: black;
	text-decoration: none;
}

#paging {
	color: black;
	text-decoration: none;
	cursor:pointer;
}

#currentPaging {
	color: red;
	text-decoration: underline;
}

</style>

	<input type="hidden" id="pg" value="${pg }">
	<h3>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;글목록</h3>
	<table border="1" cellspacing="0" cellpadding="4" frame="hsides"
		rules="rows" id="boardListTable">
		<tr>
			<th width="100">글번호</th>
			<th width="300">제목</th>
			<th width="100">작성자</th>
			<th width="100">작성일</th>
			<th width="100">조회수</th>
		</tr>
		
	</table>
	<div style="width: 640px; text-align: center;" id="boardPagingDiv"></div><br>
<form name="boardsearch" id="boardsearch">
	<input type="hidden" name="pg" value="1">
	<div style="text-align: center; width: 640;">
	   <select name="search" id="search" style="width:100px;  height:23px;">
	  	<option value="subject">제목</option>
	  	<option value="name">작성자</option>
	   </select>
	   <input type="search" name="keyword" id="keyword" value="${keyword }" placeholder="검색">
	   <input type="button" id="searchBtn" value="검색">
	 </div>
</form>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/boardList.js?var=1"></script>
<script type="text/javascript">
window.onload=function(){
	if('${search}'=='제목' || '${search}'=='작성자'){
		document.boardList.search.value='${search}';
	}
	var search = document.boardsearch.search.value;
}

function isLogin(memId,seq,pg){
	if(memId==""){
		alert("먼저 로그인 하세요");
	}else{
		location.href="/springProject/board/boardView?pg="+pg+"&seq="+seq;
	}
}

function boardPaging(pg){
	if($('#keyword').val() == ""){
		location.href="boardList?pg="+pg;
	}else{
		/* location.href="boardSearch?pg="+pg+"&search="+search+"&keyword="+encodeURIComponent(keyword); */
		
		$('input[name=pg]').val(pg);
		$('#searchBtn').trigger('click', 'continue');
	}
}
</script>






















