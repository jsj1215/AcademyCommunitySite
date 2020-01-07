<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:choose>
<c:when test="${empty idconfirm }">
	<script>
		alert("이름과 이메일이 일치하지 않습니다.");
		location.href='user_find_id';
	</script>
</c:when>
</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../default/header.jsp" %>
	<div align = "center">
		<h3>찾으시는 아이디는</h3>
		<hr><br>
		<h3>${idconfirm.id }</h3>
		<br><hr>
		<input type = "button" value = "로그인" class = "btn btn-primary" onclick="location.href='main_login'">
		<input type = "button" value = "비밀번호 찾기" class = "btn btn-primary" onclick = "location.href='user_find_pw'">
		
	</div>
	<%@ include file="../default/footer.jsp" %>
</body>
</html>