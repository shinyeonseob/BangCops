<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">

var curPage = 1;	
var totalPage = "${paging.totalPage}";
var loading = false;


</script>

<style type="text/css">
div {
contain list-conta
	
}
.list-container {
	text-align: center;
	width: 100%;
}


</style>



<div class= "list-container">
<br><br><br><br>
<h3>검색한 결과""구의 신고된 허위매물 목록입니다. </h3>
</div>


<br><br><br><br><br>

<div class= "list-container">
  <div class="col-xs-6 col-md-3">
      <div class="thumbnail">
      	<img src="/resources/img/logo.png" alt="허위매물정보">
       <div class="caption">
       
       <h6> 신고사이트 : </h6>
       <h6> 지역 :</h6>
       <h6> 가격 :</h6>
       <h6> 신고된 부동산 :</h6>
       <h6> 중개사명 :</h6>
       <h6> 전화번호 :</h6>
        <p><a href="#" class="btn btn-primary" role="button">상세보기</a></p>
   
      </div>
    </div>
  </div>
  
</div>




<jsp:include page="/WEB-INF/views/layout/footer.jsp" />  