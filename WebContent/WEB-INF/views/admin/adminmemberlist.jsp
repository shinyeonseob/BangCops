<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<jsp:include page="/WEB-INF/views/admin/adminheader.jsp" />

<script type ="text/javascript">
$(document).ready(function(){

   //회원 검색
   $("#btnsearch").click(function(){
	   location.href="/admin/memberlist?search="+$("#search").val();
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
			.attr("action", "/admin/memberlistdelete")
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
}

tr td:not(:first-child), tr th:not(:first-child) {
	border-left: 1px solid white;
}

</style>
</head>

<body>
<div class="container">

<h1>📂 회원정보 목록</h1>
<hr>

<table class="table table-hover table-condensed table-striped">

<tr class="danger">
	<th>
		<input type="checkbox" id="checkAll" onclick="checkAll();" />
	</th>
	<th style="width: 12%">회원번호</th>
	<th style="width: 15%">아이디</th>
	<th style="width: 10%">이름</th>
	<th style="width: 15%">닉네임</th>
	<th style="width: 18%">전화번호</th>
	<th style="width: 10%">회원정보</th>
	<th style="width: 10%">회원글</th>
	<th style="width: 10%">회원삭제</th>
</tr>

<c:forEach var="list" items="${list }">
<tr>
	<td><input type="checkbox" name="checkRow" value="${list.userno }" /></td>
	<td>${list.userno }</td>
	<td>${list.userid }</td>
	<td>${list.username }</td>
	<td>${list.usernick }</td>
	<td>${list.usertel }</td>
	<td><a class="btn btn-outline-success btn-sm" href="/admin/memberview?userno=${list.userno }">상세정보</a></td>
	<td><a class="btn btn-outline-primary btn-sm" id="btnBoard" href="/admin/boardlist?userno=${list.userno }">회원글</a></td>
    <td><a class="btn btn-outline-secondary btn-sm" id="btnDelete" href="/admin/memberdelete?userno=${list.userno }">회원삭제</a></td>
</tr>
</c:forEach>
	
</table>

<button id="btndelete" class="btn btn-warning pull-left">삭제</button>

<c:import url="/WEB-INF/views/layout/paging.jsp">
	<c:param name="url" value="${url }" />
</c:import>

<div class="form-inline text-center">
<form action="/admin/memberlist" method="get">
      <input class="form-control" type="text" id="search" name="search"/>
      <button id ="btnsearch">검색</button>
</form>
</div>


</div> <!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />