<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <fmt:requestEncoding value="utf-8"/>
<c:choose>
<c:when test="${empty loginsystem.id }">
	<script>
			alert("아이디와 비밀번호가 일치하지 않습니다.");
			history.go(-1);
	</script>
	</c:when>
	<c:otherwise>
	<c:choose>
		<c:when test="${loginsystem.pw eq pw }">
			<script>
			
			location.href = "main_session?sessionid=${loginsystem.id}&sessionclasses=${loginsystem.classes}"
			
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("아이디와 비밀번호가 일치하지 않습니다.");
				history.go(-1);
			</script>
		</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>

