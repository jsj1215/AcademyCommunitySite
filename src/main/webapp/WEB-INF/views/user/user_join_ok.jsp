<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <fmt:requestEncoding value="utf-8"/>
<c:choose>
<c:when test="${joinmember ==1 }">
	<script>
			alert("회원가입을 축하합니다.");
			location.href = 'main_login'; //자바스크립트 위치 이동
	</script>
	</c:when>
	<c:otherwise>
	<script>
			alert("회원가입에 실패했습니다.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>
