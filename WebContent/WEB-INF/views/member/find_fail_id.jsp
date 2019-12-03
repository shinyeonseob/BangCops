<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<br><br><br><br>
<div class="text-center">
<a href="/member/find">
<h3><Strong>${bUserId }는 존재하지 않는 ID 입니다</Strong></h3></a>
<!-- <input type='BUTTON' value=" 창닫기" onClick='window.close()'> -->
<br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
