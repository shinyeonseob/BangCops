<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<!--그림 리스트로 보이는 화면 -->

<script type="text/javascript">
	var curPage = 1;
	var totalPage = "${paging.totalPage}";
	var loading = false;
</script>

<style type="text/css">
div {contain list-conta
	
}

.list-container {
	text-align: center;
	width: 100%;
}
</style>

<!--Pattern HTML-->
<div id="pattern" class="pattern">
	<ul class="list img-list">
		<li><a href="#" class="inner">
				<div class="list-container">
					<img src="http://placehold.it/300x300" alt="Image Alt Text" />
				</div>
				<div class="list-container">
					<h6>신고사이트 :</h6>
					<h6>지역 :</h6>
					<h6>가격 :</h6>
					<h6>신고된 부동산 :</h6>
					<h6>중개사명 :</h6>
					<h6>전화번호 :</h6>
				</div>
		</a></li>

		<!--End Pattern HTML-->


		<div class="list-container">
			<br>
			<br>
			<br>
			<br>
			<h3>검색한 결과""구의 신고된 허위매물 목록입니다.</h3>
		</div>


		<br>
		<br>
		<br>
		<br>
		<br>
		
		
		<div id="floater">
			<div class="list-container">
				<div class="col-xs-6 col-md-3">
					<div class="thumbnail">
						<img src="/resources/img/logo.png" alt="허위매물정보">
						<!--       //로고부분 넣는 실제로 들어가야함 -->
						<div class="caption">

							<h6>신고사이트 :${list.Url}</h6>
							<h6>지역 : ${city } ${gu }</h6>
							<h6>가격 : ${depos }</h6>
							<h6>신고된 부동산 :</h6>
							<h6>중개사명 :</h6>
							<h6>전화번호 :</h6>
							<p>
								<a href="#" class="btn btn-primary" role="button">상세보기</a>
							</p>
							
			<c:forEach items="${ list }" var="al">
			<h6>${al.asite }</h6>
			<h6>${al.city }시{al.gu }구{al.dong }동</h6>
			<h6>보증금 : ${al.deposit } 월세 : {al.price}</h6>
			<h6>${al.property }</h6>
			<h6>${al.agent }</h6>
			<h6>${al.phoneno }</h6>
			</c:forEach>
			
			 

						</div>
					</div>
				</div>

			</div>
		</div>



		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />