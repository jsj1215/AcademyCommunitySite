<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

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
	
	
	<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95); width:500px;">
		<div class="col-sm-12">
	<br><br>
	<h3>MY PAGE</h3>
	<hr>
	<p>
		${sname }(${sid }) 님의 정보를 관리합니다.
	</p>
	
	<c:choose>
		<c:when test="${sclasses eq '관리자' }">
			<a href="main_update">[회원정보 변경]</a>
		</c:when>
		<c:when test="${sclasses eq '강사' }">
			<a href="main_update">[회원정보 변경]</a>
			<a href="main_delete">[회원 탈퇴]</a>
		</c:when>
		<c:otherwise>
			<a href="decCal_result">[출석 관리]</a>
			<a href="main_update">[회원정보 변경]</a>
			<a href="main_delete">[회원 탈퇴]</a>
		</c:otherwise>
		
		
	</c:choose>
	<br><br><br><br>
	</div>
	</div><br>
	
	
<%@ include file="../default/footer.jsp" %>
</body>
</html>