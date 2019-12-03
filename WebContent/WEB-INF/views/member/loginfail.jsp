<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<br><br><br><br>
<div class="text-center">
<h3><Strong>로그인 실패</Strong></h3><br><br>
<p>아이디가 존재하지 않거나 비밀번호가 올바르지 않습니다</p>
<br><br>

<button class="btn btn-default" type="submit">로그인</button>
<br><br>
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />