<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">
div {
	
}

#container {
	text-align: center;
}

#item {
	display: inline-block;
	background-color: #FDB813;
	width: 200px;
	height: 260px;
	/* 	border: 1px solid black;  */
	margin: 40px;
	text-align: center;
	padding: 10px;
	border-radius: 10px;
	color: white;
}

.btnAccuse {
	margin: 0 105px;
}

#board {
	display: inline-block;
	padding: 20px;
	margin: 10px;
	float: none;
	padding: 20px;
}
.title{
	background-color : #0066B2;
	height : 14px;
}

</style>
<hr>

<script type="text/javascript">
	function loginPlease() {
		alert("로그인 해주세요");
	}
</script>


<div id="container">

	<div id="container">
		<h2>
			<Strong>
			<img src ="/resources/img/accuse.png" width="30" height="30">&nbsp;&nbsp;신고</Strong>
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




	<div id="board">
		<div id="item">
			<h4>
			<br>
				<Strong>허위/과장 매물</Strong>
			</h4>
			<hr>
			해당 매물이 존재하지 않아 거래가 불가능한 경우<br> <br> 매물등록내용을 사실과 다르게 올리거나
			과장하는 경우<br><br>
		</div>
		<div>
			<c:if test="${login }">
				<a href="/accuse/write?accuseType=허위/과장매물">
				<button class="btn btn-primary" type="submit">신고하기</button></a>
			</c:if>
			<c:if test="${empty login }">
				<a href="#myModal" data-toggle="modal">
				<button	class="btnAccuse btn btn-primary" onclick="loginPlease();">신고하기</button></a>
			</c:if>

			<br> <br>
		</div>
	</div>



	<div id="board">
		<div id="item">
			<br>
			<h4>
				<Strong>불량 매물</Strong>
			</h4>
			<hr>
			해당 매물이 불법건축물 또는 전입 신고가 불가능한 경우 <br> <br> <br> <br>
		</div>
		<div>
			<c:if test="${login }">
				<a href="/accuse/write?accuseType=불량 매물">
				<button class="btn btn-primary" type="submit">신고하기</button></a>
			</c:if>
			<c:if test="${empty login }">
				<a href="#myModal"data-toggle="modal"><button
						class="btnAccuse btn btn-primary" onclick="loginPlease();">신고하기</button></a>
			</c:if>
			<br><br> 
		</div>
	</div>



	<div id="board">
		<div id="item">
			<br>
			<h4>
				<Strong>사기 의심 매물</Strong>
			</h4>
			<hr>
			매물 답사 전 선입금을 요구하는 경우 <br> <br> <br> <br>

		</div>
		<br>

		<div>
			<c:if test="${login }">
				<a href="/accuse/write?accuseType=사기 의심 매물">
				<button class="btn btn-primary" type="submit">신고하기</button></a>
			</c:if>
			<c:if test="${empty login }">
				<a href="#myModal" data-toggle="modal">
				<button class="btnAccuse btn btn-primary" onclick="loginPlease();">신고하기</button></a>
			</c:if>
						<br><br>
		</div>
	</div>



</div>
<br><br><br>



<jsp:include page="/WEB-INF/views/layout/footer.jsp" />