<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <fmt:requestEncoding value="utf-8"/>
<c:choose>
<c:when test="${updatemember ==1 }">
	<script>
			alert("정보수정 완료하였습니다.");
			location.href = 'user_mypage'; //자바스크립트 위치 이동
	</script>
	</c:when>
	<c:otherwise>
	<script>
			alert("정보수정에 실패했습니다.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>
