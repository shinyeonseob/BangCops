<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
.container {
	text-align: center;
	justify-content: center;
	align-items: center;
}
</style>




<div class="container">
	
	<div style="margin-top: 150px; margin-bottom: 50px">
		<h2>
			<strong>부동산 허위매물 검색</strong>
		</h2>
	</div>
	<form class="form-inline" action="/accuselist" method="get">
		<div class="form-group">
			<label class="sr-only" for="city"></label> <input type="text"
				id="city" name="city" class="form-control" size="10" list="listcity" />
			<datalist id="listcity">
				<option value="seoul">서울</option>
				<option value="_"></option>
			</datalist>
		</div>

		<div class="form-group">
			<label class="sr-only" for="gu"></label> <input type="text" id="gu"
				name="gu" class="form-control" size="10" list="listgu" />
			<datalist id="listgu">
				<option value="강남">강남구</option>	
					<option value="강동">강동구</option>
					<option value="강북">강북구</option>
					<option value="강서">강서구</option>
					<option value="관악">관악구</option>
					<option value="광진">광진구</option>
					<option value="구로">구로구</option>
					<option value="금천">금천구</option>
					<option value="노원">노원구</option>
					<option value="도봉">도봉구</option>
					<option value="동대문">동대문구</option>
					<option value="동작">동작구</option>
					<option value="마포">마포구</option>
					<option value="서대문">서대문구</option>
					<option value="서초">서초구</option>
					<option value="성동">성동구</option>
					<option value="성북">성북구</option>
					<option value="송파">송파구</option>
					<option value="양천">양천구</option>
					<option value="영등포">영등포구</option>
					<option value="용산">용산구</option>
					<option value="은평">은평구</option>
					<option value="종로">종로구</option>
					<option value="중">중구</option>
					<option value="중랑">중랑구</option>
			</datalist>
		</div>

		<div class="form-group">
			<label class="sr-only" for="search"></label> <input type="text"
				id="search" class="form-control" name="search" size="70"
				placeholder="상세 정보" />
		</div>
		<div class="form-group">
			<button type="submit" id="btnSearchclass" class="btn btn-default">Search</button>
		</div>
	</form>

</div>






















<jsp:include page="/WEB-INF/views/layout/footer.jsp" />