<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>mypage</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css2?family=Indie+Flower&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<!--AOS 라이브러리-->
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
<!--hover.css-->
<link href="../css/hover.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles1.css" rel="stylesheet" />
<!-- CSS only -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">


<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<div class="backgroundImg">
			<nav class="navBar">네비게이션 바</nav>
		</div>
		<div class="layer"></div>
	</header>
	<div class="profileImg_wrapper">
		<div class="profileCircle">
			<div class="userProfile">
				<img class="userProfileImg" src="../image/harin.jpg">
			</div>
		</div>
		<div class="userId">UserId_120329</div>
	</div>
	<!--content -->
	<input type="hidden" id="pg" value="1">
	<div class="content">
		<div class="content_wrapper">
			<div class="myInfo_wrapper">

				<div class="follow_wrapper">
					<div class="follower">
						<div class=" numberDiv">87</div>
						팔로우
					</div>
					<div class="following">
						<div class=" numberDiv">102</div>
						팔로잉
					</div>
					<div class="listCount">
						<div class=" numberDiv">102</div>
						<p>게시물</p>
					</div>
				</div>
				<button type="button" class="btn btn-outline-secondary"
					id="writeOptionBtn"
					style="font-size: 9px; border-radius: 20px; width: 100px;">글작성</button>
				<button type="button" class="btn btn-outline-secondary"
					style="font-size: 9px; border-radius: 20px; width: 100px;">회원정보수정</button>
				<button type="button" class="btn btn-outline-primary" id="followBtn"
					style="font-size: 9px; border-radius: 20px; width: 100px;">팔로우+</button>
				<input type="hidden" id="followCheck" value="uncheck">
				<input type="hidden" id="followValue" value="0">
			</div>

			<div class="myBlog_wrapper">
				<table id="tableHeadder">
					<tr>
						<th
							style="font-size: 9px; border-top: 2px solid; font-weight: bold; width: 8%; height: 30px;">여행기</th>
						<th style="border-top: 1px solid; width: 92%;"></th>
					</tr>
				</table>
				<div class="myblogList" data-aos="fade-up" data-aos-duration="3000">
					<!--첫번째 리스트-->
					<div id="myblog_feed" class="hvr-grow-shadow">
						<div class="myblog_img">
							<img class="listImg" src="../image/architecture.jpg" alt="">
						</div>
						<div class="myblog_info">
							<div class="myblog_subject">Lorem ipsum dolor sit amet,
								consectetur</div>
							<div class="myblog_content">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit, Lorem ipsum dolor sit amet,
								consectetur adipiscing elit.</div>
							<div class="myblog_userFunction">
								<div class="like">
									<i class="far fa-heart"></i>
								</div>
								<div class="reply">
									<i class="fas fa-comment-dots"></i>
								</div>
								<div class="myblog_travleDay">20.06.03~20.06.08</div>
							</div>
						</div>
					</div>
					<!--두번째 리스트-->
					<div id="myblog_feed" class="hvr-grow-shadow">
						<div class="myblog_img">
							<img class="listImg" src="../image/gyungju.jpg" alt="">
						</div>
						<div class="myblog_info">
							<div class="myblog_subject">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit.</div>
							<div class="myblog_content">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit, Lorem ipsum dolor sit amet,
								consectetur adipiscing elit.</div>
							<div class="myblog_userFunction">
								<div class="like">
									<i class="far fa-heart"></i>
								</div>
								<div class="reply">
									<i class="fas fa-comment-dots"></i>
								</div>
								<div class="myblog_travleDay">20.06.03~20.06.08</div>
							</div>
						</div>
					</div>
					<!--세번쨰 리스트-->
					<div id="myblog_feed" class="hvr-grow-shadow">
						<div class="myblog_img">
							<img class="listImg" src="../image/game.png" alt="">
						</div>
						<div class="myblog_info">
							<div class="myblog_subject">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit.</div>
							<div class="myblog_content">Lorem ipsum dolor sit amet,
								consectetur adipiscing elit, Lorem ipsum dolor sit amet,
								consectetur adipiscing elit.</div>
							<div class="myblog_userFunction">
								<div class="like">
									<i class="far fa-heart"></i>
								</div>
								<div class="reply">
									<i class="fas fa-comment-dots"></i>
								</div>
								<div class="myblog_travleDay">20.06.03~20.06.08</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer> </footer>
</body>
<!---->
<!------------- Modal --------------->
<div class="modal fade" id="followModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"></h4>
				<button type="button" class="close" data-dismiss="modal">×</button>

			</div>
			<div class="modal-body">
				<table class="modal_table" id="modal_table">
					<tr>
						<td style="width: 70px;"><img id="modal_userImg"
							src="../image/paris.jpg"></td>
						<td id="modal_userName">USER_Name</td>
						<td id="modal_userFollow"><button
								class="btn btn-outline-primary">팔로우
							</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="count" value="1"></div>
		</div>
	</div>
</div>
<!-- 글작성 BTN -->
<div class="modal fade" id="writeOptionModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<div class="bodyHeader">새로 만들기</div>
				<div class="writeOptionWrapper">
					<div class="travelsWriteWrapper">
						<div id="travelsWriteImg" class="hvr-grow-shadow">
							<i id="writeOptionImg" class="fas fa-suitcase"></i>
						</div>
						<div class="optionContentWrapper">
							<h5>여행기</h5>
							<div id="optionText">여행 기록을 코스별, 일정별로 깔끔하게 기록해보세요.</div>
						</div>
					</div>
					<div class="writeBlogWrapper">
						<div id="writeBlogImg" class="hvr-grow-shadow">
							<i id="writeOptionImg" class="far fa-edit"></i>
						</div>
						<div class="optionContentWrapper">
							<h5>M에세이</h5>
							<div id="optionText">여행을 자유롭게 나만의 에세이로 기록해보세요.</div>
						</div>
					</div>
				</div>
			</div>
			<div id="count" value="1"></div>
		</div>
	</div>
</div>
<!-- Bootstrap core JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Contact form JS-->
<script src="assets/mail/jqBootstrapValidation.js"></script>
<script src="assets/mail/contact_me.js"></script>
<!--AOS 라이브러리-->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>
<script>
	AOS.init({
		easing : 'ease-out-back',
		duration : 1000
	});
	
	/* $(document).ready(function(){
		$.ajax({
			type: 'post',
			url: '/springProject/member/likeCheck',
			data: 'pg='+$('#pg').val(),
			dataType: 'json',
			success: function(data){
				console.log(JSON.stringify(data));
				$.each(data.list, function(index, items){
					alert(items.board_seq);
					if(items.like_check == '0' || $('#likeValue'+items.board_seq).val() == ''){
						$('.like'+items.board_seq).html('<i class="far fa-heart"></i>');
						$('#likeCheck'+items.board_seq).val('unlike');
					}else if(items.like_check == '1'){
						$('.like'+items.board_seq).html('<i class="fas fa-heart" style="color:red;"></i>');
						$('#likeCheck'+items.board_seq).val('like');
					}
				}); //each
			}, // success
			error: function(err){
				console.log(err);
			} // error
		}); // ajax
	}); // $(document) */
	$(document).ready(function(){
		$.ajax({
			type: 'post',
			url: '/springProject/member/followCheck',
			data: {'follow_nickname' : 'UserId_120329'},
			dataType: 'json',
			success: function(data){
				
			},
			error: function(err){
				console.log(err);
			}
		});
	});
</script>
</html>























