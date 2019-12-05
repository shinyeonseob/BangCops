<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<br><br><br><br>
<div class="text-center">
<h3><Strong><a href="/member/join">
${bUserId } ${bUsernick } 는 이미 존재합니다</Strong></h3><br><br>
<br><br><br><br>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />