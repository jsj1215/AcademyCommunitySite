<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="saveData" value="${saveData}" />
	<c:choose>
		<c:when	test="${saveData.id == null || saveData.title == null  || saveData.content == null || saveData.imageFile == null }">
			<c:out value="write_check입니다." />
			<c:out value="${saveData.id }" />
			<c:out value="${saveData.title }" />
			<c:out value="${saveData.content }" />

			<script type="text/javascript">
				alert("모든 내용을 입력해주세요.")
				location.href = "ImageBoard_write"
			</script>
		</c:when>
		<%-- 	<c:otherwise>
			<script type="text/javascript">
		alert("글쓰기가 완료 되었습니다.")
		location.href="ImageBoard_write_yes"
		</script>
	</c:otherwise> --%>
	</c:choose>
</body>
</html>