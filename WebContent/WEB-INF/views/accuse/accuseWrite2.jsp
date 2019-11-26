<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<form action="" method="post">
<fieldset style="width: 1000px;">

<legend>신고 사항</legend><hr>
<small>허위/과장매물 신고</small><hr>
<small>1단계 : 신고매물 기본정보</small>
<table>
<tr>
	<td><label for="accuseBoard">신고 게시물 URL</label></td>
	<td><input type="text" id="URL" name="URL"></input></td>
</tr>
<tr>
	<td><label for="">부동산명</label></td>
	<td><label type=""></label></td>
</tr>
<tr>
	<td><label for="">중개인 이름</label></td>
	<td><label type=""></label></td>
</tr>

<tr>
	<td><label for="">전화번호</label></td>
	<td><label type=""></label></td>
</tr>

<tr>
	<td><label for=""></label></td>
	<td><label type=""></label></td>
</tr>

<tr>
	<td><label for=""></label></td>
	<td><label type=""></label></td>
</tr>




</table>
</fieldset>
</form>


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />