<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />




<style type="text/css">
div {
	
}

.container {
	text-align: center;
}

able, td {
	/*   border: 1px solid black; */
	/*   border-collapse: collapse; */
	
}

.tdleft {
	width: 30px;
}

.tdupper {
	width: 500px;
}

input {
	width: 70%;
}
</style>

<div class="container">


	<hr>


	<Strong>신고 사항</Strong> <br> <br> <small>허위/과장매물 신고</small>
	<hr>
	<small>1단계 : 신고매물 기본정보</small> <br>


	<table style="margin: 0 auto;">
		<tr>
			<td colspan="2" class="tdupper">신고 게시물 URL</td>
		</tr>
		<tr>
			<td class="tdleft"></td>
			<td class="tdright"><input type="text"
				placeholder=" URL을 입력해주세요" /></td>
		</tr>



		<tr>
			<td colspan="2" class="tdupper">부동산 이름</td>
		</tr>
		<tr>
			<td class="tdleft"></td>
			<td class="tdright"><input type="text" placeholder="신고할 부동산의 상호" /></td>
		</tr>
		<br>

		<tr>
			<td colspan="2" class="tdupper">중개인 이름</td>
		</tr>
		<tr>
			<td class="tdleft"></td>
			<td class="tdright"><input type="text"
				placeholder="신고게시물에 기재된 중개인의 이름" /></td>
		</tr>
		<br>

		<tr>
			<td colspan="2" class="tdupper">전화번호</td>
		</tr>
		<tr>
			<td class="tdleft"></td>
			<td class="tdright"><input type="int"
				placeholder="신고게시물에 기재된 휴대폰 번호" /></td>
		<tr>
			<td colspan="2" class="tdupper">지역</td>
		</tr>
		<tr>
			<td class="tdleft"></td>
			<td class="tdright">
			<select name="location">
					<option value="seoul">서울</option>	
			</select></td>
		<tr>
			<td class="tdleft"></td>
			<td class="tdright">
			<select name="city">
					<option value="gangnam">강남구</option>	
					<option value="seocho">서초구</option>
			</select></td>	
			
		</tr>
		<br>

	</table>

	<br>
	<br>
	<br>

	<hr>
	<small>2단계 : 신고매물 상세정보</small>
	<hr>
	<small> 허위/과장된 부분을 입증할 수 있는 파일을 첨부해주세요<br> ex)문자 내용
		스크린샷(휴대폰 번호 보일 수 있도록)
	</small> <br> <br> <label>상세내용</label><br>
	<textarea placeholder="신고할 내용을 상세하게 입력해주세요" name="textarea"></textarea>

	<br> <small>파일첨부(최대 5개)</small>


	<button>파일첨부</button>

	<br> <br>
	<hr>

	<small>허위매물 등록 약관</small>
	 <br> <br>
	 	<small>1. 본인이 등록한 허위매물사례 정보는 추가
		피해를 방지하기 위한 목적으로 개인, 기업, 수사기관 등 제3자에게 제공됨을 동의합니다. <br> 2. 허위사실
		유포, 명예훼손 등 법적분쟁 발생 시 모든 책임은 피해사례 등록자에게 있으며, 피해사례의 사실확인을 위해 검증과정에 참여할
		것임을 확인합니다. <br> 3. 피해사례 등록자와 용의자의 식별정보 및 개인정보(이름, 전화번호, 계좌번호, 아이디
		등)를 피해회복과 추가 피해예방을 위해 <방캅스>가 취급 및 처리함에 동의합니다. <br>
		<br>
		※ 약관을 위배하는 경우, 다음과 같은 처벌을 받을 수 있습니다.
		<br>
		 ① 사람을 비방할 목적으로 정보통신망을 통하여 공연히 사실을
		적시하여 타인의 명예를 훼손하는 경우 3년 이하의 징역이나 금고 또는 2천만원 이하의 벌금에 처하고 사람을 비방할 목적으로
		정보통신망을 통하여 공연히 허위의 사실을 적시하여 타인의 명예를 훼손하는 경우에는 7년 이하의 징역, 10년 이하의 자격정지
		또는 5천만원 이하의 벌금에 처할 수 있습니다.<br>
		② 개인적인 앙심 또는 괘씸함 등 허위매물 외의 사유로 등록하시는 경우, 명예훼손에 해당될 수 있으며 이는 민·형사상의
		불이익을 받을 수 있습니다. <br></small> <br>
		
		
		<input type="checkbox" id="checkBox_01">
		 <small>허위매물 등록 약관에 동의합니다.</small>
	<br> <br>
	<hr>
	<button type="button" id="btnAWrite">등록완료</button>





</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />