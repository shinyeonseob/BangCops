<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/admin/adminheader.jsp" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
<style type="text/css">
body {
	background: #e2eaef;
	font-family: "Open Sans", sans-serif;
}

h2 {
	color: #000;
	font-size: 26px;
	font-weight: 300;
	text-align: center;
	text-transform: uppercase;
	position: relative;
	margin: 30px 0 60px;
}

h2::after {
	content: "";
	width: 100px;
	position: absolute;
	margin: 0 auto;
	height: 4px;
	border-radius: 1px;
	background: #7ac400;
	left: 0;
	right: 0;
	bottom: -20px;
}

.carousel {
	margin: 50px auto;
	padding: 0 70px;
}

.carousel .item {
	color: #747d89;
	min-height: 325px;
	text-align: center;
	overflow: hidden;
}

.carousel .thumb-wrapper {
	padding: 25px 15px;
	background: #fff;
	border-radius: 6px;
	text-align: center;
	position: relative;
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.2);
}

.carousel .item {
	height: 120px;
	margin-bottom: 20px;
	width: 100%;
	position: relative;
}

.carousel .item img {
	max-width: 100%;
	max-height: 100%;
	display: inline-block;
	position: absolute;
	bottom: 0;
	margin: 0 auto;
	left: 0;
	right: 0;
}

.carousel .item h4 {
	font-size: 18px;
}

.carousel .item h4, .carousel .item p, .carousel .item ul {
	margin-bottom: 5px;
}

.carousel .thumb-content .btn {
	color: #7ac400;
	font-size: 11px;
	text-transform: uppercase;
	font-weight: bold;
	background: none;
	border: 1px solid #7ac400;
	padding: 6px 14px;
	margin-top: 5px;
	line-height: 16px;
	border-radius: 20px;
}

.carousel .thumb-content .btn:hover, .carousel .thumb-content .btn:focus
	{
	color: #fff;
	background: #7ac400;
	box-shadow: none;
}

.carousel .thumb-content .btn i {
	font-size: 14px;
	font-weight: bold;
	margin-left: 5px;
}

.carousel .carousel-control {
	height: 44px;
	width: 40px;
	background: #7ac400;
	margin: auto 0;
	border-radius: 4px;
	opacity: 0.8;
}

.carousel .carousel-control:hover {
	background: #78bf00;
	opacity: 1;
}

.carousel .carousel-control i {
	font-size: 36px;
	position: absolute;
	top: 50%;
	display: inline-block;
	margin: -19px 0 0 0;
	z-index: 5;
	left: 0;
	right: 0;
	color: #fff;
	text-shadow: none;
	font-weight: bold;
}

.carousel .item-price {
	font-size: 13px;
	padding: 2px 0;
}

.carousel .item-price strike {
	opacity: 0.7;
	margin-right: 5px;
}

.carousel .carousel-control.left i {
	margin-left: -2px;
}

.carousel .carousel-control.right i {
	margin-right: -4px;
}

.carousel .carousel-indicators {
	bottom: -50px;
}

.carousel-indicators li {
	background: rgba(0, 0, 0, 0.2);
}

.carousel-indicators li.active {
	background: rgba(0, 0, 0, 0.6);
}

.carousel .wish-icon {
	position: absolute;
	right: 10px;
	top: 10px;
	z-index: 99;
	cursor: pointer;
	font-size: 16px;
	color: #abb0b8;
}

.carousel .wish-icon .fa-heart {
	color: #ff6161;
}

.star-rating li {
	padding: 0;
}

.star-rating i {
	font-size: 14px;
	color: #ffc000;
}

.board {
text-align: center;
}
.community {
	width: 25%;
    display: inline-block;
    margin: 0 20px;
}
</style>
</head>
<body>
		<div class="row">
			<h2>
				<b>커뮤니티 게시글 관리</b>
			</h2><br>
			
			<div class="board">
			<div id="myCarousel" class="carousel slide" data-ride="carousel"
				data-interval="0">
						<div class="community">
							<div class="thumb-wrapper">
							<div onclick="location.href='/admin/community/board?boardno=3'">
							<h2>공지사항</h2></div>
								<span class="wish-icon"><i class="fa fa-heart-o"></i></span>
							</div>
						</div>
						<div class="community">
							<div class="thumb-wrapper">
							<div onclick="location.href='/admin/community/board?boardno=1'">
							<h2>자유 게시판</h2></div>
								<span class="wish-icon"><i class="fa fa-heart-o"></i></span>
							</div>
						</div>
						<div class="community">
							<div class="thumb-wrapper">
							<div onclick="location.href='/admin/community/board?boardno=2'">
							<h2>이용후기 게시판</h2></div>
								<span class="wish-icon"><i class="fa fa-heart-o"></i></span>
							</div>
						</div>
			</div>
			</div>
			</div>
			
			<br><br>
		
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
