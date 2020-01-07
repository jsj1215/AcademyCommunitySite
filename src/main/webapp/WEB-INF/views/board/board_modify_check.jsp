<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int result = (Integer)request.getAttribute("rs"); %>
<c:set var="res" value="<%= result %>"/>
<c:choose>
	<c:when test="${res == 1}">
		<script type="text/javascript">
			alert('수정되었습니다.');
			location.href="board_list";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('게시글 수정에 실패했습니다.');
			location.href="board_list";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>