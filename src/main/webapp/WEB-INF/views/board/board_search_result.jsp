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
<div align="center">
	<h1>게시글 검색결과</h1>
	<table border="1">
		<tr>
			<th>번호</th><th>이름</th><th>제목</th>
			<th>날짜</th><th>조회수</th><th>따봉</th>
		</tr>
		<c:choose>
			<c:when test="${list.size() != 0}">
				<c:forEach var="bdto" items="${list}">
					<tr>
						<td>${bdto.id}</td><td>${bdto.name}</td><td><a href="board_info?id=${bdto.id}&name=${sessionScope.sid}">${bdto.title}</a></td>
						<td>${bdto.savedate}</td><td>${bdto.hit}</td><td>${bdto.likes}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><th colspan="6">검색 결과가 없습니다.</th></tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="6" align="center">
				<c:forEach var="page" begin="1" end="9">
					<a href="#">[${page}]</a>&nbsp;
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="6" align="center">
				<button onclick="location.href='board_write_form'">글 작성</button>
				<button onclick="location.href='board_list'">목록</button>
				<form action="board_search" method="get">
					<select name="sel">
						<option value="name" selected="selected">아이디</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="search">&nbsp;
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>