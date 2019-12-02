<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<!-- 썸네일 게시판 클릭시 상세내용 -->
<h6>검색하신 동의 허위매물 정보입니다.</h6>

<!-- 신고된 썸네일 -->
<img src="/resources/img/logo.png" alt="허위매물정보">

<c:forEach items="${ list }" var="al">
	<h6>신고사이트 : ${al.asite }</h6>
	<h6>지역 : ${al.city }시{al.gu }구{al.dong }동</h6>
	<h6>가격 : 보증금 : ${al.deposit } 월세 : {al.price}</h6>
	<h6>신고된 부동산 : ${al.property }</h6>
	<h6>중개사명 : ${al.agent }</h6>
	<h6>전화번호 : ${al.phoneno }</h6>
	<h6>신고된 상세내용 : </h6>
 
</c:forEach>




<jsp:include page="/WEB-INF/views/layout/footer.jsp" />


