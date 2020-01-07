<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:choose>
	<c:when test="${sclasses ne '관리자'}">
		<script>
			location.href = 'main';
		</script>
	</c:when>
</c:choose>
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../default/header.jsp"%>
	<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="col-sm-12">
			<br>
			<h3 style="text-align: left;">&nbsp;&nbsp;&nbsp;회원정보</h3>
			<table class="table table-bordered" style="width: 100%">
				<tr>
					<th style="text-align: center">이름</th>
					<th style="text-align: center">이메일</th>
					<th style="text-align: center">자격</th>
				</tr>
				<c:forEach items="${memberlist }" var="vo">
					<tr>
						<td style='text-align: center'><a
							href="member_info?requestid=${vo.id}">${vo.name }</a></td>
						<td style='text-align: center'>${vo.email }</td>
						<td style='text-align: center'>${vo.classes }</td>
					</tr>
				</c:forEach>

			</table>
			<br>
		</div>
	</div>
	<br>
	<%@ include file="../default/footer.jsp"%>
</body>
</html>