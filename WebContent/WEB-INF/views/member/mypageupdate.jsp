<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/mypageheader.jsp" />

<script type="text/javascript">
	$(document).ready(function() {

		//작성버튼 동작
		$("#btnUpdate").click(function() {
			
			if ($("#usernick").val() == '') {
				alert('닉네임을 입력하세요');
				$("#usernick").focus();
				return false;
			}
			if ($("#usertel").val() == '') {
				alert('전화번호를 입력하세요');
				$("#usertel").focus();
				return false;
			}

			if(confirm("회원정보를 수정하시겠습니까?") == true){
				alert("회원정보가 수정되었습니다");
					$("form").submit();	
				}
				else{
					return;
				}
			
			//form submit 수행
			$("form").submit();
		});
		
		
		// 정보수정 취소 버튼
		$("#btnCancel").click(function() {
			location.href = "/mypage/main";
		});
		
// 		// 닉네임 중복검사 버튼
// 		$("#nickcheck").click(function() {
// 			location.href = "/member/check";
// 		});
		
	});
</script>

<style>
#mypage_update{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	margin-right: 730px;
}


</style>



<div id = "mypage_update" >
	<h2>정보 수정</h2>
</div>
<br><br>


  
 <%-- <form name="update" action="/mypage/update" method="post" enctype="multipart/form-data">--%>  

 
		 <%--<input type="hidden" name="usertel" value="${BUser.usertel }" /> --%>

<%--             <select>
               <option value="010">010
               <option value="011">011
               <option value="016">016
               <option value="019">019
            </select> - <input type="text" size='4' /> - <input type="text" size='4' /> --%>

		<%--	<td> <button disabled="disabled"> 인증받기 </button></td> --%>


         

    <%--      <tr>
            <td class="info">프로필사진</td>
            <td colspan="3">사진 업로드하기
			<input type="file" class="form-control" id = "photo" name = "photo" />
			</td>
         </tr>
--%>

 


<div class="container list-container">
<form name="update" action="/mypage/update" method="post" >
      <input type="hidden" name="userno" value="${BUser.userno }" />
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2">이름</div>
  <div class="col-md-4">${BUser.username }</div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2">닉네임</div>
  <div class="col-md-4">
  <input type="text" class="form-control" id="usernick" name="usernick" value="${BUser.usernick }" />
  </div>
  <div class="col-md-4"> 
  <a href="/member/check" target="_blank">
  <button id = "nickcheck" class="btn btn-success">
            	 중복검사 
            	 </button> </a>
  </div>
  <div class="col-md-1"></div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2">연락처</div>
  <div class="col-md-6">
  	<input type="text" class="form-control" id="usertel" name="usertel" value="${BUser.usertel }" />
  </div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row text-center" >
       <button type="button" id="btnUpdate" class="btn btn-info">정보 수정</button>
         <button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>

</form>
</div>





















<jsp:include page="/WEB-INF/views/layout/footer.jsp" />