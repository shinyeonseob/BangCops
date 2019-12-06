<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/admin/adminheader.jsp" />

<script type ="text/javascript">
$(document).ready(function(){

   //회원 검색
   $("#btnsearch").click(function(){
	   location.href="/admin/accuselist?search="+$("#search").val();
   });
   
});
</script>

<script type="text/javascript">
$(document).ready(function() {
	// 선택체크 삭제
	$("#btndelete").click(function() {
		// 선택된 체크박스
		var $checkboxes = $("input:checkbox[name='checkRow']:checked");

		var map = $checkboxes.map(function() {
			return $(this).val();
		});
		var names = map.get().join(",");
		
		// 전송 폼
		var $form = $("<form>")
			.attr("action", "/admin/accuselistdelete")
			.attr("method", "post")
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "names")
					.attr("value", names)
			);
		$(document.body).append($form);
		$form.submit();
	
	});
});
		
//전체 체크/해제
function checkAll() {
	// checkbox들
	var $checkboxes=$("input:checkbox[name='checkRow']");

	// checkAll 체크상태 (true:전체선택, false:전체해제)
	var check_status = $("#checkAll").is(":checked");
	
	if( check_status ) {
		// 전체 체크박스를 checked로 바꾸기
		$checkboxes.each(function() {
			this.checked = true;	
		});
	} else {
		// 전체 체크박스를 checked 해제하기
		$checkboxes.each(function() {
			this.checked = false;	
		});
	}
}
</script>		
		
<style type="text/css">
table, th {
	text-align: center;
}

tr td:nth-child(3) {
	text-align:left;
	
	overflow:hidden;
    white-space:nowrap;
    text-overflow:ellipsis;
} 

tr td:not(:first-child), tr th:not(:first-child) {
	border-left: 1px solid white;
}


</style>
</head>

<body>
<div class="container">

<h1>🔔 신고 게시물 목록</h1>
<hr>

<table class="table table-hover table-condensed table-striped" style="table-layout: fixed">

<tr class="danger">
	<th>
		<input type="checkbox" id="checkAll" onclick="checkAll();" />
	</th>
	<th style="width: 7%">글번호</th>
	<th style="width: 10%">신고 사이트</th>
	<th style="width: 15%">지역</th>
	<th style="width: 13%">신고된 부동산</th>
	<th style="width: 7%">중개사명</th>
	<th style="width: 9%">작성자</th>
	<th style="width: 13%">작성일</th>
	<th style="width: 10%">상세정보</th>
	<th style="width: 9%">작성자정보</th>
	<th style="width: 8%">삭제</th>
	
</tr>

<c:forEach var="list" items="${list }">
<tr>
	<td><input type="checkbox" name="checkRow" value="${list.accuseno }" /></td>
	<td>${list.idx }</td>
	<td>${list.sitename }</td>
	<td>${list.city }시 ${list.gu }</td>
	<td>${list.property }</td>
	<td>${list.agent }</td>
	<td>${list.usernick }</td>
	<td>${list.regDate }</td>
	<td><a href="/admin/accuseview?accuseno=${list.accuseno }"><button class="btn btn-success btn-sm">상세정보</button></a></td>
	<td><a class="btn btn-primary btn-sm" id="btnBoard" href='/admin/memberview?userno=${list.userNo }'">작성자정보</a></td>
    <td><a href="/admin/accusedelete?accuseno=${list.accuseno }"><button class="btn btn-warning btn-sm" id="btnDelete">삭제</button></a></td>
</tr>
</c:forEach>
	
</table>

<button id="btndelete" class="btn btn-warning pull-left">삭제</button>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp">
	<c:param name="url" value="${url }" />
</c:import>

<div class="form-inline text-center">
<form action="/admin/accuselist" method="get">
      <input class="form-control" type="text" id="search" name="search"/>
      <button id ="btnsearch">검색</button>
</form>
</div>


</div> <!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />