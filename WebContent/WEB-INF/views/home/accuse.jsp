<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">
div {
	
}

#container {
	text-align: center;
}

#item {
	display: inline-block;
	background-color: #D8D8D8;
	width: 200px;
	height: 260px;
	/* 	border: 1px solid black;  */
	margin: 40px;
	text-align: center;
	padding: 10px;
}

.btnAccuse {
	margin: 0 105px;
}
</style>
<hr>




<div id="container">

	<div id="container">
		<h2>
			<Strong>신고</Strong>
		</h2>
	</div>

	<hr>
	<br> <br>
	<div id="container">
		<h2>
			<Strong>허위매물 피해사례를 신고하세요</Strong>
		</h2>
	</div>

	<div id="container">
		<small style="color: #6E6E6E"> 피해사례 등록시, 방캅스에 해당 공인 중개사 정보와 해당
			매물의 정보가 공유됩니다. </small>
	</div>
	<br> <br>



	<div id="item">
		<br>
		<h4>
			<Strong>허위/과장 매물</Strong>
		</h4>
		<hr>
		해당 매물이 존재하지 않아 거래가 불가능한 경우<br>
		<br> 매물등록내용을 사실과 다르게 올리거나 과장하는 경우<br>

	</div>




	<div id="item">
		<br>
		<h4>
			<Strong>불량 매물</Strong>
		</h4>
		<hr>
		해당 매물이 불법건축물 또는 전입 신고가 불가능한 경우 <br>
		<br>
		<br>
		<br>
	</div>



	<div id="item">
		<br>
		<h4>
			<Strong>사기 의심 매물</Strong>
		</h4>
		<hr>
		매물 답사 전 선입금을 요구하는 경우 <br>
		<br>
		<br>
		<br>

	</div>
	<br>
	<a href="/accuse/write?accuseType=허위/과장매물"><button class="btnAccuse">신고하기</button></a>
	<a href="/accuse/write?accuseType=불량 매물"><button class="btnAccuse">신고하기</button></a>
	<a href="/accuse/write?accuseType=사기 의심 매물"><button class="btnAccuse">신고하기</button></a>
</div>




<jsp:include page="/WEB-INF/views/layout/footer.jsp" />