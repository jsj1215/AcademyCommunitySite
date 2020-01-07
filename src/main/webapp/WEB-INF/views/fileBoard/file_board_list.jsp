<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
	
	function searchBoard(){
				
		var sel = document.getElementById("sel").value;
		var searchData = document.getElementById("searchData").value;
		
		if(document.getElementById("searchData").value==""){
				alert('검색어를 입력해 주세요');
				return;
		}else{
			location.href="fileBoardList?sel="+sel+"&searchData="+searchData;
			
		}
	}	


</script>

</head>
<body>
<jsp:include page="../default/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="paramPage" value="${param.page}"/>
<c:if test="${paramPage == null}">
	<c:set var="paramPage" value="1"/>
</c:if>

<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="row">
			<div class="col-sm-12 table-responsive box">
				
	<h3 style="text-align: left;">&nbsp;&nbsp;&nbsp;자료실</h3>


	<table class="table table-striped" style="width:100%;">

	<tr>
		<th height="40px" width="9%" >번호</th><th width="40%">제목</th><th width="10%">아이디</th>
			<th width="20%">날짜</th><th width="9%">조회수</th>
	</tr>
	
<c:choose>

	<c:when test="${lists.size()==0 }">
		<tr>
			<th colspan="5" style="text-align: center">게시글이 없습니다</th>
		<tr>
	</c:when>

	<c:otherwise>
		<c:forEach var="dto" items="${lists }">
			<c:set var="date" value="${dto.savedate.toString() }"/>
			
			<c:choose>
				
				<c:when test="${dto.filechk=='N' }">		
					<tr>
						<td height="50px">&nbsp;${dto.id }</td>
						
						<c:choose>
							<c:when test="${sessionScope.sid==null }">
								<td>
									<a href="main_login">${dto.title }</a>
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<a href="fileView?id=${dto.id }">${dto.title }</a>
								</td>
							</c:otherwise>
						</c:choose>
						
						<td>&nbsp;${dto.name }</td>
						<td>${date.substring(0,10) }</td><td>&nbsp;${dto.hit }</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td height="50px">&nbsp;${dto.id }</td>
						<c:choose>
							<c:when test="${sessionScope.sid==null }">
								<td>
									<a href="main_login">${dto.title }</a>
									<img src="resources/img/fileicon.png" width="12" height="12">
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<a href="fileView?id=${dto.id }">${dto.title }</a>
									<img src="resources/img/fileicon.png" width="12" height="12">
								</td>
							</c:otherwise>
						</c:choose>
							
						<td>&nbsp;${dto.name }</td>
						<td>${date.substring(0,10) }</td><td>&nbsp;${dto.hit }</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:otherwise>	
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
				<c:when test="${paramPage>1 }">
					<c:choose>
						<c:when test="${param.searchData == null}">
							<input type="button" onclick="location.href='fileBoardList?page=${paramPage-1 }'" value="이전">
						</c:when>
						<c:otherwise>
							<input type="button" onclick="location.href='fileBoardList?page=${paramPage-1 }&sel=${param.sel}&searchData=${param.searchData}'" value="이전">
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<input type="button" disabled="disabled" value="이전">
				</c:otherwise>
			</c:choose>
			
				<c:forEach var="page" begin="1" end="${maxPage}">
					<c:choose>
						<c:when test="${param.searchData == null}">
							<a href="fileBoardList?page=${page }">[${page }]</a>
						</c:when>
						<c:otherwise>
							<a href="fileBoardList?page=${page }&sel=${param.sel}&searchData=${param.searchData}">[${page }]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
			<c:choose>
				<c:when test="${paramPage < maxPage }">
				
					<c:choose>
						<c:when test="${param.searchData == null}">
							<input type="button" onclick="location.href='fileBoardList?page=${paramPage+1 }'" value="다음">
						</c:when>
						<c:otherwise>
							<input type="button" onclick="location.href='fileBoardList?page=${paramPage+1 }&sel=${param.sel}&searchData=${param.searchData}'" value="다음">
						</c:otherwise>
					</c:choose>				
				
				</c:when>
				<c:otherwise>
					<input type="button" disabled="disabled" value="다음">
				</c:otherwise>
			</c:choose>
			</div>
			
			<div style="float: left; width: 25%; text-align:right;"align="right">
				<c:choose>
					<c:when test="${sessionScope.sclasses == '관리자' || sessionScope.sclasses == '강사'}">
						<button onclick="location.href='fileBoardSave'">글 작성</button>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${param.searchData != null}">
						<input type="button" onclick="location.href='fileBoardList'" value="목록보기">
					</c:when>
				</c:choose>
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="6" align="center">
			<select name="sel" id="sel">
								<option value="name">아이디</option>
								<option value="title" selected="selected">제목</option>
								<option value="content">내용</option>
							</select>
						<input type="text" name="searchData" id="searchData">
						<input type="button" onclick="searchBoard()" value="검색">
				
				<br>
			</td>
		</tr>
	</table>
	<br>
</div></div></div></div>
<jsp:include page="../default/footer.jsp"/>
</body>
</html>