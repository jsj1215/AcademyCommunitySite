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
<%@ include file="../default/header.jsp" %>
<c:set var="paramPage" value="${param.page}"/>
<c:if test="${paramPage == null}">
	<c:set var="paramPage" value="1"/>
</c:if>
	<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="row">
			<div class="col-sm-12 table-responsive box">
				
	<h3 style="text-align: left;">&nbsp;&nbsp;&nbsp;자유게시판</h3>
	<table class="table table-striped" style="width:100%;">
		<tr>
			<th height="40px" width="6%" >번호</th><th width="40%">제목</th><th width="10%">아이디</th>
			<th width="20%">날짜</th><th width="6%">조회수</th><th width="6%" >좋아요</th>
		</tr>
		<c:choose>
			<c:when test="${searchList == null && list.size() != 0}">
				<c:forEach var="bdto" items="${list}">
					<tr>
						<td height="50px">&nbsp;${bdto.id}</td>
						<td>
							<c:choose>
								<c:when test="${bdto.title.length() < 15}">
									<a href="board_info?id=${bdto.id}&name=${sessionScope.sid}">${bdto.title}</a> <b><font color="red">[${replyCount.get(bdto.id)}]</font></b>
								</c:when>
								<c:otherwise>
									<c:set var="title" value="${bdto.title.substring(0, 15)}..."/>
									<a href="board_info?id=${bdto.id}&name=${sessionScope.sid}">${title}</a> <b><font color="red">[${replyCount.get(bdto.id)}]</font></b>
								</c:otherwise>
							</c:choose>
						</td>
						<c:choose>
							<c:when test="${bdto.name == 'system'}">
								<td><font color="red">관리자(system)</font></td>
							</c:when>
							<c:otherwise>
								<td>${bdto.name}</td>
							</c:otherwise>
						</c:choose>
						<c:set var="date" value="${bdto.savedate.toString()}"/>
						<td>${date.substring(0, 10)}</td><td>&nbsp;${bdto.hit}</td><td>&nbsp;${bdto.likes}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${searchList != null && searchList.size() != 0}">
				<c:forEach var="bdto" items="${searchList}">
					<tr>
						<td height="50px">${bdto.id}</td><td><a href="board_info?id=${bdto.id}&name=${sessionScope.sid}">${bdto.title}</a> <b><font color="red">[${replyCount.get(bdto.id)}]</font></b></td>
						<c:choose>
							<c:when test="${bdto.name == 'system'}">
								<td><font color="red">관리자(system)</font></td>
							</c:when>
							<c:otherwise>
								<td>${bdto.name}</td>
							</c:otherwise>
						</c:choose>
						<c:set var="date" value="${bdto.savedate.toString()}"/>
						<td>${date.substring(0, 10)}</td><td>${bdto.hit}</td><td>${bdto.likes}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${list.size() == 0 && searchList == null}">
				<tr><th height="50px" style="text-align:center" colspan="6">등록된 게시글이 없습니다.</th></tr>
			</c:when>
			<c:when test="${searchList.size() == 0}">
				<tr><th height="50px" style="text-align:center" colspan="6">검색된 게시글이 없습니다.</th></tr>
			</c:when>
		</c:choose>
	</table>
	<br>
	<div style="background-color: rgba( 211, 211, 211, 0.2 ); width:100%;">
	<table border="0" style="width:96%;" >
		<tr>
			<td height="50px" colspan="6" align="center" style="text-align: center;">
			<div style="float: left; width: 25%; text-align:center;">&nbsp;</div>
			<div style="float: left; width: 50%; text-align:center;" align="center">
				<c:choose>
					<c:when test="${paramPage > 1}">
						<c:choose>
							<c:when test="${searchList == null}">
								<button type="button" onclick="location.href='board_list?page=${paramPage-1}'">
									이전
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" onclick="location.href='board_list?page=${paramPage-1}&sel=${param.sel}&searchData=${param.searchData}'">
									이전
								</button>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<button type="button" disabled="disabled">
							이전
						</button>
					</c:otherwise>
				</c:choose>
				<c:forEach var="page" begin="1" end="${maxPage}">
					<c:choose>
						<c:when test="${searchList == null}">
							<a href="board_list?page=${page}">[${page}]</a>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="board_list?page=${page}&sel=${param.sel}&searchData=${param.searchData}">[${page}]</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${paramPage < maxPage}">
						<c:choose>
							<c:when test="${searchList == null}">
								<button type="button" onclick="location.href='board_list?page=${paramPage+1}'">
									다음
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" onclick="location.href='board_list?page=${paramPage+1}&sel=${param.sel}&searchData=${param.searchData}'">
									다음
								</button>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<button type="button" disabled="disabled">
							다음
						</button>
					</c:otherwise>
				</c:choose>
				</div>
				<div style="float: left; width: 25%; text-align:right;"align="right">
				<button onclick="location.href='board_write_form'">글 작성</button>
					<c:if test="${searchList != null}">
						<button  onclick="location.href='board_list'">목록</button>
					</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="6" align="center">
				<form action="board_list" method="get">
					<select name="sel">
						<option value="name">아이디</option>
						<option value="title" selected="selected">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchData">&nbsp;
					<input type="submit" value="검색">
				</form>
				<br>
			</td>
		</tr>
	</table>
	</div></div></div></div>
	<br>
	

<br>
<%@ include file="../default/footer.jsp" %>
</body>
</html>