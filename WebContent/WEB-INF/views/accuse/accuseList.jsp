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
<div>
<div class="list-container">
	<br> <br> <br> <br>
	<h3>검색한 결과 ${gu }구의 신고된 허위매물 목록입니다.</h3>
</div>


<br>
<br>
<br>
<br>
<br>

<c:forEach items="${list }" var="al">
	<div class="floater">
		<div class="list-container">
			<div class="col-xs-4 col-md-2">
				<div class="thumbnai"WebContent/WEB-INF/views/accuse/accuseList.jsp"l">
					<img src="/resources/img/logo.png" alt="허위매물정보">
					<!--       //로고부분 넣는 실제로 들어가야함 -->
					<div class="caption">


						<h6>신고사이트 : ${al.sitename }</h6>
						<h6>지역 : ${al.city }시 ${al.gu }구</h6>
						<h6>신고된 부동산 : ${al.property }</h6>
						<h6>중개사명 : ${al.agent }</h6>
						<h6>전화번호 : ${al.phoneNo }</h6>

						<a href="/aview?accuseno=${al.accuseno }" class="btn btn-primary" role="button">상세보기</a>

					</div>
				</div>
			</div>

		</div>
	</div>
</c:forEach>

<hr>
</div>
<p style="clear: both"> </p>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />