<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<jsp:include page = "/WEB-INF/views/layout/header.jsp" />

<style type = "text/css">
#joinform{
	justify-content:  center;
}
.container{
	display:  flex;
	justify-content:  center;
	align-items : stretch;
}

</style>
<br><br><br><br><br><br>	
<div class ="container">

   <form id = "joinform" class="form-horizontal"
      action="<%=response.encodeUrl("/member/join")%>" method="post">
      <div class="form-group">
         <label for="UserID" class="col-sm-2 control-label">Email</label>
         <div class="col-sm-10">
            <input type="email" class="form-control" name="UserID" id="UserID"
               placeholder="email" required="required">
         </div>
      </div>
      <div class="form-group">
         <label for="pw" class="col-sm-2 control-label">Password</label>
         <div class="col-sm-10">
            <input type="password" class="form-control" name="UserPW" id="UserPW"
               placeholder="password" required="required">
         </div>
      </div>
      <div class="form-group">
         <label for="Nick" class="col-sm-2 control-label">닉네임</label>
         <div class="col-sm-10">
            <input type="text" class="form-control" name="UserNick" id="UserNick"
               placeholder="Nick" required="required">
         </div>
      </div>
      <div class="form-group">
         <label for="UserName" class="col-sm-2 control-label">이름</label>
         <div class="col-sm-10">
            <input type="text" class="form-control" name="UserName"
               id="UserName" placeholder="UserName" required="required">
         </div>
      </div>
      <div class="form-group">
         <label for="UserTel" class="col-sm-2 control-label">전화번호</label>
         <div class="col-sm-10">
            <input type="text" class="form-control" name="UserTel" id="UserTel"
               placeholder="UserTel" required="required">
         </div>
      </div>
      <div class="form-group">
         <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">확인</button>
         </div>
      </div>
   </form>

</div> 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<jsp:include page = "/WEB-INF/views/layout/footer.jsp" />
    