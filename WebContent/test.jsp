<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="" method="post">
<fieldset style="width: 300px;">

<legend>인적사항</legend>

<table>
<tr>
	<td><label for="userId">아이디</label></td>
	<td><input type="text" placeholder="아이디 입력" id="userId" name="userId" /></td>
</tr>

<tr>
	<td><label for="password">비밀번호</label></td>
	<td><input type="password" id="password" name="password" /></td>
</tr>
<tr>
	<td><label for="email">이메일</label></td>
	<td><input type="email" id="email" name="email" /></td>
</tr>
<tr>
	<td><label>성별</label></td>
	<td>
		<label><input type="radio" name="gender" value="m" />남</label>
		<input type="radio" name="gender" value="f" />여
	</td>
</tr>
<tr>
	<td><label>결혼여부</label></td>
	<td><input type="checkbox" name="married" /></td>
</tr>
<tr>
	<td><label>지역</label></td>
	<td>
	<select name="location">
		<option value="seoul">서울</option>
		<option value="gyeonggi">경기</option>
		<option value="jeolla">전라</option>
		<option value="gyeongsang">경상</option>
	</select>
	</td>
</tr>
<tr>
	<td><label>하고싶은 말</label></td>
	<td><textarea placeholder="입력하세요" name="textarea"></textarea></td>
<tr>
<tr>
	<td></td>
	<td><button type="submit">제출</button>
		<button type="reset">취소</button></td>
</tr>
</table>

</fieldset>
</form>

























<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
