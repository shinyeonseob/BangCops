<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/mypageheader.jsp" />

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

<div class="container">

   <hr>
   <form name="update" action="/mypage/update" method="post" enctype="multipart/form-data">
      <%--<input type="hidden" name="userno" value="${BUser.userno }" />
      
      <%-- 전화번호 입력값이 다를 시 사용안함 --%>
		<input type="hidden" name="usertel" value="${BUser.usertel }" /> 

      <table class="table table-bordered">
         <tr>
            <td class="info">이메일 계정</td>
            <td><input type="text" class="form-control" id="userid" name="userid" value="${BUser.userid }" /></td>
            <td> <button disabled="disabled"> 이메일 인증 </button></td>
         </tr>

         <tr>
            <td class="info">이름</td>
            <td colspan="3">
               ${BUser.username } 아 직</td>
         </tr>

         <tr>
            <td class="info">닉네임</td>
            <td><input type="text" class="form-control" id="usernick" name="usernick" value="${BUser.usernick }" /></td>
            <td> <button disabled="disabled"> 중복검사 </button></td>
         </tr>

         <tr>
			<td class="info">
            <label for="phone">연락처</label>
            </td>
            <td>
            <select>
               <option value="010">010
               <option value="011">011
               <option value="016">016
               <option value="019">019
            </select> - <input type="text" size='4' /> - <input type="text" size='4' />
			</td>
			<td> <button disabled="disabled"> 인증받기 </button></td>
         </tr>

         <tr>
            <td class="info">인증 번호 </td>
            <td colspan="3"><input type="text" class="form-control" id="phonecheck" name="phonecheck"  /></td>
         </tr>

         <tr>
            <td class="info">프로필사진</td>
            <td colspan="3">사진 업로드하기
			<input type="file" class="form-control" id = "upfile" name = "upfile" />
			</td>
         </tr>


      </table>

      <div class="text-center">
         <button type="button" id="btnUpdate" class="btn btn-info">정보 수정</button>
         <button type="button" id="btnCancel" class="btn btn-danger">취소</button>
      </div>
      <br>
   </form>
</div>

























<jsp:include page="/WEB-INF/views/layout/footer.jsp" />