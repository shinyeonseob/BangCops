<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<style type= "text/css">

.container{
	text-align : center;
	justify-content:center;
	align-items : center;
}

</style>




<div class = "container">
<h1>MAIN</h1>
<hr>
<div style="margin-top:150px;margin-bottom:50px"><h2><strong>부동산 허위매물 검색</strong></h2></div>
<form  class="form-inline"  action="" method="post">
<div class="form-group">
	<label class="sr-only" for="city"></label>
	<input type="text" id = "city" name="city"  class="form-control" size = "10"  list="listcity" />
	<datalist id="listcity">
		<option value="Seoul">서울</option>
		<option value="_"></option>
	</datalist>
	</div>
	
	<div class="form-group">
	<label class="sr-only" for="gu"></label>
	<input type="text" id = "gu" name="gu" class="form-control" size = "10" list="listgu" />
	<datalist id="listgu">
		<option value="Gangdong">강동구</option>
		<option value="Gangseo">강서구</option>
		<option value="Gangnam">강남구</option>
		<option value="Gangbuk">강북구</option>
	</datalist>
</div>

<div class="form-group">
	<label class="sr-only" for="search"></label>
	<input type="text" id="search" class="form-control" name="search" size = "70" placeholder="상세 정보" />
</div>
<div class="form-group">
	 <button type="submit" id = "btnSearchclass" class="btn btn-default">Search</button>
</div>
</form>

</div>






















<jsp:include page="/WEB-INF/views/layout/footer.jsp" />