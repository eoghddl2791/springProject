//로그인
$('#loginBtn').click(function(){
	/*
	 * if(document.loginForm.id.value == ""){ alert("아이디를 입력해주세요"); }else
	 * if(document.loginForm.pwd.value == ""){ alert("비밀번호를 입력해주세요") }else {
	 * document.loginForm.submit(); }
	 */
	if ($('#loginId').val() == "") {
		$('#idResult').html('아이디를 입력해주세요');
		$('#idResult').css('font-weight', 'bold');
		$('#idResult').css('font-size', '8pt');
		$('#idResult').css('color', 'red');
		$('#idResult').css('display', 'block');
		$('#pwdResult').css('display', 'none');
	} else if ($('#loginPwd').val() == "") {
		$('#pwdResult').html('비밀번호를 입력해주세요');
		$('#pwdResult').css('font-weight', 'bold');
		$('#pwdResult').css('font-size', '8pt');
		$('#pwdResult').css('color', 'red');
		$('#pwdResult').css('display', 'block');
		$('#idResult').css('display', 'none');
	} else {
		$.ajax({
			type: 'post',
			url: '/springProject/member/login',
			data: {'id' : $('#loginId').val(),  'pwd' : $('#loginPwd').val()},
			dataType : 'text',
			success : function(data){
				//alert(data);
				if(data == 'success'){
					location.href = '/springProject/main/index';
				
				}else if(data == 'fail'){
					$('#loginResultDiv').html('로그인 실패');
					$('#loginResultDiv').css('font-weight', 'bold');
					$('#loginResultDiv').css('font-size', '10pt');
					$('#loginResultDiv').css('color', 'red');
					$('#loginResultDiv').css('display', 'block');
					
				}
			},
			eroor : function(err){
				console.log(err);
			}
		});
	}

});

//회원가입
$('#writeBtn').click(function(){ 
	$('#nameResult').empty();
	$('#idWriteResult').empty();
	$('#pwdWriteResult').empty();
	$('#rePwdWriteResult').empty();
	// if(document.writeForm.name.value == "") {
	if (document.getElementById("name").value == "") {
		$('#nameResult').html('이름을 입력해주세요.');
		$('#nameResult').css('font-weight', 'bold');
		$('#nameResult').css('font-size', '8pt');
		$('#nameResult').css('color', 'red');
		$('#nameResult').css('display', 'block');
		document.writeForm.name.focus();
	} else if (document.writeForm.id.value == "") {
		$('#idWriteResult').html('아이디을 입력해주세요.');
		$('#idWriteResult').css('font-weight', 'bold');
		$('#idWriteResult').css('font-size', '8pt');
		$('#idWriteResult').css('color', 'red');
		$('#idWriteResult').css('display', 'block');
		document.writeForm.id.focus();
	} else if (document.writeForm.pwd.value == "") {
		$('#pwdWriteResult').html('비밀번호를 입력해주세요.');
		$('#pwdWriteResult').css('font-weight', 'bold');
		$('#pwdWriteResult').css('font-size', '8pt');
		$('#pwdWriteResult').css('color', 'red');
		$('#pwdWriteResult').css('display', 'block');
		document.writeForm.pwd.focus();
	} else if (document.writeForm.repwd.value == "") {
		$('#rePwdWriteResult').html('비밀번호 재확인을 입력해주세요.');
		$('#rePwdWriteResult').css('font-weight', 'bold');
		$('#rePwdWriteResult').css('font-size', '8pt');
		$('#rePwdWriteResult').css('color', 'red');
		$('#rePwdWriteResult').css('display', 'block');
		document.writeForm.repwd.focus();
	} else if (document.writeForm.pwd.value != document.writeForm.repwd.value) {
		$('#rePwdWriteResult').html('비밀번호가 일치하지 않습니다.');
		$('#rePwdWriteResult').css('font-weight', 'bold');
		$('#rePwdWriteResult').css('font-size', '8pt');
		$('#rePwdWriteResult').css('color', 'red');
		$('#rePwdWriteResult').css('display', 'block');
	} else if ($('#idDuplication').val() != "idCheck") {
		$('#idWriteResult').html('아이디 중복 체크를 해주세요.');
		$('#idWriteResult').css('font-weight', 'bold');
		$('#idWriteResult').css('font-size', '8pt');
		$('#idWriteResult').css('color', 'red');
		$('#idWriteResult').css('display', 'block');
		$('#id').focus();
	} else {
		$('form[name=writeForm]').submit();
	}
});

//중복체크
$('#id').focusout(function(){//포커스를 나왔을때 이벤트 발생
	let id = $('#id').val();
	if (id == "") {
		$('#idWriteResult').html('먼저 아이디를 입력하세요.');
		
		$('#idWriteResult').css('font-weight', 'bold');
		$('#idWriteResult').css('font-size', '8pt');
		$('#idWriteResult').css('color', 'red');
		$('#idWriteResult').css('display', 'block');
		$('#nameResult').css('display', 'none');
		$('#pwdWriteResult').css('display', 'none');
		$('#rePwdWriteResult').css('display', 'none');
		$('#id').focus();
	} else {
		$.ajax({
			type: 'post',
			url: '/springProject/member/checkId',
			data: 'id='+id,
			dataType: 'text',
			success: function(data){
				//alert(data);
				if(data == "non_exist"){
					$('#idWriteResult').text('사용가능');
					$('#idWriteResult').css('color', 'blue');
					$('#idWriteResult').css('font-weight', 'bold');
					$('#idWriteResult').css('font-size', '8pt');
					$('#idDuplication').val('idCheck');
					alert($('#idDuplication').val());
				}else if(data == 'exist'){
					$('#idWriteResult').text('사용불가');
					$('#idWriteResult').css('color', 'red');
					$('#idWriteResult').css('font-weight', 'bold');
					$('#idWriteResult').css('font-size', '8pt');
				}
				
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});

function inputId() {
	document.writeForm.idDuplication.value = "idUncheck"
}

$('#checkPost').click(function(){
	window.open("/springProject/member/checkPost", "", "width=500 height=500 scrollbars=yes");
});

$('#postSearchBtn').click(function(){
	$('#sidoDiv').empty();
	$('#sigunguDiv').empty();
	$('#roadnameDiv').empty();
	
	if($('#sido').val() == ''){
		$('#sidoDiv').text('시도 선택');
		$('#sidoDiv').css('color', 'red');
		$('#sidoDiv').css('font-weight', 'bold');
		$('#sidoDiv').css('font-size', '8pt');
	}else if($('#sido').val() != '세종' && $('#sigungu').val() == ''){
		$('#sigunguDiv').text('시군구 입력');
		$('#sigunguDiv').css('color', 'red');
		$('#sigunguDiv').css('font-weight', 'bold');
		$('#sigunguDiv').css('font-size', '8pt');
	}else if($('#roadname').val() == ''){
		$('#roadnameDiv').text('도로명 입력');
		$('#roadnameDiv').css('color', 'red');
		$('#roadnameDiv').css('font-weight', 'bold');
		$('#roadnameDiv').css('font-size', '8pt');
	}
	$.ajax({
		type: 'post',
		url: '/springProject/member/postSearch',
		//data: 'sido='+$('#sido').val()+'&sigungu='+$('#sigungu').val()+'&roadname='+$('#roadname').val(),
		data: $('#checkPostForm').serialize(),
		dataType: 'json',
		success: function(data){
			//console.log(data.list);
			$('#postTable tr:gt(2)').remove();
			
			$.each(data.list, function(index, items){
				var address = items.sido + ' ' + items.sigungu + ' ' + items.yubmyundong + ' ' + items.ri + ' ' + items.roadname + ' ' + items.buildingname;
				address = address.replace(/null/g, ''); // address에 null값이 있으면 전부 '' 으로 바꿔라 (g는 모든것이라는 뜻이다.)
				$('<tr/>').append($('<td/>', {
					align: 'center',
					text: items.zipcode
				})).append($('<td/>', {
					colspan: '3',
				}).append($('<a/>', {
					href: '#',
					text: address,
					id: 'addressA'
				}))
				).appendTo($('#postTable'));
				//<tr/>는 테그를 열고닫고를 다한다. appendTo는 부모에게 붙인다.
			});//each
			
			//a테그를 클릭했을때
			$('a').click(function(){
				//alert($(this).parent().prev().text());
				
				$('#zipcode', opener.document).val($(this).parent().prev().text());
				$('#addr1', opener.document).val($(this).text());
				$('#addr2', opener.document).focus();
				window.close();
			});
			
			
		},//success
		error: function(err){
			console.log(err);
		}
		
	});
});

function checkPostClose(zipcode, address) {
	/*
	 * opener.document.forms[0].zipcode.value = zipcode;
	 * opener.document.forms[0].addr1.value = address; window.close();
	 * opener.document.forms[0].addr2.focus();
	 */
	opener.document.getElementById("zipcode").value = zipcode;
	opener.document.getElementById("addr1").value = address;
	window.close();
	opener.document.getElementById("addr2").addr2.focus();
}

//회원정보수정
$('#modifyBtn').click(function(){
	$('#nameResult').empty();
	$('#idWriteResult').empty();
	$('#pwdWriteResult').empty();
	$('#rePwdWriteResult').empty();
	// if(document.writeForm.name.value == "") {
	if (document.getElementById("name").value == "") {
		$('#nameResult').html('이름을 입력해주세요.');
		$('#nameResult').css('font-weight', 'bold');
		$('#nameResult').css('font-size', '8pt');
		$('#nameResult').css('color', 'red');
		$('#nameResult').css('display', 'block');
		document.writeForm.name.focus();
	} else if (document.writeForm.pwd.value == "") {
		$('#pwdWriteResult').html('비밀번호를 입력해주세요.');
		$('#pwdWriteResult').css('font-weight', 'bold');
		$('#pwdWriteResult').css('font-size', '8pt');
		$('#pwdWriteResult').css('color', 'red');
		$('#pwdWriteResult').css('display', 'block');
		document.writeForm.pwd.focus();
	} else if (document.writeForm.repwd.value == "") {
		$('#rePwdWriteResult').html('비밀번호 재확인을 입력해주세요.');
		$('#rePwdWriteResult').css('font-weight', 'bold');
		$('#rePwdWriteResult').css('font-size', '8pt');
		$('#rePwdWriteResult').css('color', 'red');
		$('#rePwdWriteResult').css('display', 'block');
		document.writeForm.repwd.focus();
	} else if (document.writeForm.pwd.value != document.writeForm.repwd.value) {
		$('#rePwdWriteResult').html('비밀번호가 일치하지 않습니다.');
		$('#rePwdWriteResult').css('font-weight', 'bold');
		$('#rePwdWriteResult').css('font-size', '8pt');
		$('#rePwdWriteResult').css('color', 'red');
		$('#rePwdWriteResult').css('display', 'block');
	} else {
		$.ajax({
			type: 'post',
			url: '/springProject/member/modify',
			data: $('#modifyForm').serialize(),
			success: function(){
				alert('회원 정보 수정 완료');
				location.href='/springProject/main/index';
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});
