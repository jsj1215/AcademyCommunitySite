<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:choose>
<c:when test="${empty sid }">
	<script>
		location.href = 'main_login';
	</script>
</c:when>
</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../default/header.jsp" %>
	<div align = "center">
		
		<h3>현재 비밀번호를 입력하세요</h3>
		<hr>
		
		<form action = "user_delete_ok" method = "post" name = "reg_form">
			비밀번호 : <input type = "password" name = "pw">
			<input type = "button" value = "확인" class = "btn btn-primary" onclick="deleteMember()">
		</form>
	
	</div>
	
<%@ include file="../default/footer.jsp" %>
<script>
		function deleteMember() {
			
			if (confirm('회원삭제를 하시겠습니까?')) {
				
				reg_form.submit();
			}
		}
	</script>
</body>
</html>