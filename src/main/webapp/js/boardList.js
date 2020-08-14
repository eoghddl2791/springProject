$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/springProject/board/getBoardList',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>', {
					align: 'center',
					text: items.seq
				})).append($('<td/>', {
					}).append($('<a/>', {
						id: 'subjectA',
						href: '#',
						align: 'center',
						text: items.subject,
						class: items.seq+''
					}))
				).append($('<td/>', {
					align: 'center',
					text: items.name
				})).append($('<td/>', {
					align: 'center',
					text: items.logtime
				})).append($('<td/>', {
					align: 'center',
					text: items.hit
				})).appendTo($('#boardListTable'));
				
				//답글
				for(i=0; i<items.lev; i++){
					$('.'+items.seq).before('&ensp;');
				}
				if(items.pseq != 0){
					$('.'+items.seq).before($('<img/>', {
						src: '../image/reply.gif'
					}));
				}
				
			}); // each
			
			//페이징처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			//로그인 여무 & 작성한 글 확인
			$('#boardListTable').on('click', '#subjectA', function(){
				//alert($(this).prop('tabName'));
				
				if(data.memId == null){
					alert('먼저 로그인 하세요');
				}else{
					var seq = $(this).attr('class');
					var pg = data.pg;
					location.href='/springProject/board/boardView?seq='+seq+'&pg='+pg;
				}
			
			});
		},
		error: function(err){
			console.log(err);
		}
	});
});

$('#searchBtn').click(function(event, str){
	if(str != 'continue'){
		$('input[name=pg]').val(1);
	}
	if($('#keyword').val() == ''){
		alert('검색어를 입력하세요');
	}else{
		$.ajax({
			type: 'post',
			url: '/springProject/board/boardSearch',
			data: {'pg': $('input[name=pg]').val(),
				   'search' : $('#search').val(),
				   'keyword': $('#keyword').val()},
			dataType: 'json',
			success: function(data){
				//alert(JSONstringify(data));
				$('#boardListTable tr:gt(0)').remove();
				$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>', {
					align: 'center',
					text: items.seq
				})).append($('<td/>', {
					align: 'center',
					text: items.subject
				})).append($('<td/>', {
					align: 'center',
					text: items.name
				})).append($('<td/>', {
					align: 'center',
					text: items.logtime
				})).append($('<td/>', {
					align: 'center',
					text: items.hit
				})).appendTo($('#boardListTable'));
			}); // each
			
			//페이징처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			},
			error: function(err){
				console.log(err);
			}
		}); //ajax
	}
});