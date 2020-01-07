<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../default/header.jsp" %>
<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95); width:700px;">
		<div class="col-sm-12">
			<br>
			<h3 style="text-align: left;">&nbsp;&nbsp;&nbsp;인적 사항</h3>
<form action="change_classes" method="post">
<table class="table table-bordered" style="width:100%">
	<tr><th colspan="2" style="text-align:center">인적 사항</th></tr>
	<tr><th style="text-align:center;width:150px">아이디</th><td>${memberinfo.id }<input type="hidden" name="id" value="${memberinfo.id }"></td></tr>
	<tr><th style="text-align:center;width:150px">이름</th><td>${memberinfo.name }</td></tr>
	<tr><th style="text-align:center;width:150px">성별</th><td>${memberinfo.gender }</td></tr>
	<tr><th style="text-align:center;width:150px">이메일</th><td>${memberinfo.email }</td></tr>
	<tr><th style="text-align:center;width:150px">자격</th><td><span style="width:49%;">${memberinfo.classes }</span><span style="float:right;"><input type="radio" name="classes" value="학생">학생&nbsp&nbsp&nbsp<input type="radio" name="classes" value="강사">강사</span></td></tr>
	
</table>
<c:choose>
	<c:when test="${memberinfo.classes eq '관리자'}">
		<input type="submit"  value = "변경" disabled="disabled">
	</c:when>
	<c:otherwise>
		<input type="submit"  value = "변경">
	</c:otherwise>
	</c:choose>
&nbsp;&nbsp;&nbsp;<input type="button" value="취소" onclick="history.go(-1)"><br><br>
</form>
</div></div><br>
<%@ include file="../default/footer.jsp" %>
</body>
</html>