<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <fmt:requestEncoding value="utf-8"/>
<c:choose>
<c:when test="${fail eq '1'}">
	<script>
		alert('중복된 아이디와 이메일입니다.'); //경고문
		history.go(-1); //뒤로가기
	</script>
	</c:when>
	<c:when test="${fail eq '2'}">
	<script>
		alert('중복된 아이디입니다.'); //경고문
		history.go(-1); //뒤로가기
	</script>
	</c:when>
	<c:otherwise>
	<script>
			alert('중복된 이메일입니다.');
			history.go(-1); //자바스크립트 위치 이동
		</script>
	</c:otherwise>
</c:choose>
