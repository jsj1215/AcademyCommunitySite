<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<fmt:requestEncoding value="utf-8" />
<c:choose>
	<c:when test="${deletemember ==1 }">
		<script>
			alert("회원삭제 완료하였습니다.");
			location.href = 'main'; //자바스크립트 위치 이동
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원삭제 실패하였습니다.");
			location.href = 'user_mypage'; 
		</script>
	</c:otherwise>
</c:choose>