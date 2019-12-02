<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<!--그림 리스트로 보이는 화면, 검색시 유저에게 노출-->

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
		
			<c:forEach items="${ list }" var="al">
			<h6>신고사이트 : ${al.asite }</h6>
			<h6>지역 : ${al.city }시{al.gu }구{al.dong }동</h6>
			<h6>가격 : 보증금 : ${al.deposit } 월세 : {al.price}</h6>
			<h6>신고된 부동산 : ${al.property }</h6>
			<h6>중개사명 : ${al.agent }</h6>
			<h6>전화번호 : ${al.phoneno }</h6>
			</c:forEach>
				<a href="#" class="btn btn-primary" role="button">상세보기</a>
							</p>
							
			
			 

						</div>
					</div>
				</div>

			</div>
		</div>



		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />