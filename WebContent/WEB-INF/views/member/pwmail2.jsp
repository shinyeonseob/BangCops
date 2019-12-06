<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">
.etc{
	text-align: center;
}
</style>


<br><br><br><br>
<div class="etc">
<img src="/resources/img/logo.png" width="300" height="300">
<a href="/member/find" style="color: #6E6E6E" >
<h4><Strong>${bUserId } 로 비밀번호가 수정된 메일이 발송되었습니다.<br>
마이페이지에서 변경해주세요</Strong></h4><br><br>
<input class="btn btn-primary btn-lg " type='BUTTON' value=" 창닫기" onClick='self.close()'>
</div>

<br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />