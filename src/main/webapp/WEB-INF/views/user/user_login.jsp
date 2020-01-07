<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../default/header.jsp" %>
	<div align = "center">
		<h3>로그인 페이지</h3>
		<hr>
		<form action = "user_login" method = "post">
		
			<input type = "text" style="width:300px;" name = "id" placeholder="아이디를 입력해주세요"><br><br>
			<input type = "password" style="width:300px;" name = "pw" placeholder="비밀번호를 입력해주세요"><br><br><br>
			<input type = "submit" style="width:200px;" value = "로그인" class = "btn btn-primary"><br>
			<a href="user_find_id">아이디 찾기</a>|<a href="user_find_pw">비밀번호 찾기</a>
		
		</form>
	
	
	
	</div>
		<%@ include file="../default/footer.jsp" %>

</body>
</html>