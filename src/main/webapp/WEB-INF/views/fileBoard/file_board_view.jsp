<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="resources/jquery-3.2.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	function modify(id){
		
		location.href="boardModify?id="+id;
		
	}
	
	function boardDelete(id,chk){
		
		if(confirm("게시글을 삭제하시겠습니까?")) {
			location.href="boardDelete?id="+id+"&chk="+chk;
		} else {
			return;
		}
	}
	

	
</script>

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../default/header.jsp" />
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<c:if test="${param.chk=='end'}">
		<script type="text/javascript">
			alert("마지막 페이지 입니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${sessionScope.sid == null}">
		<c:redirect url="main_login" />
	</c:if>

	<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="row">
			<div class="col-sm-12 table-responsive box">
				<div style="width: 2%; float: left;">&nbsp;</div>
				<div style="width: 48%; float: left; text-align: left;">
					<input type="button" class="btn btn-primary" value="▽이전글" onclick="location.href='preFileBoardView?id=${modify.id }'">&nbsp;
						<input type="button" class="btn btn-primary" value="△다음글" onclick="location.href='nextFileBoardView?id=${modify.id }'">
				</div>
				<div style="width: 48%; float: left; text-align: right;">
					<c:choose>
						<c:when test="${sessionScope.sid == modify.name }">
							<tr>
								<td align="right"><button class="btn btn-primary"
										onclick="modify(${modify.id })">수정</button>
									<button class="btn btn-primary"
										onclick="boardDelete(${modify.id },'${modify.filechk }')">삭제</button></td>
							</tr>
						</c:when>
						<c:when test="${sessionScope.sclasses == '관리자'}">
							<td align="right">
								<button class="btn btn-primary"
									onclick="boardDelete(${modify.id },'${modify.filechk }')">삭제</button>
							</td>
						</c:when>
					</c:choose>
					<input type="button" class="btn btn-primary" value="목록"
						onclick="location.href='fileBoardList'">
				</div>
				&nbsp;<br>&nbsp;
				<table class="table table-bordered">
					<tr>
						<td height="30px"><div style="float: left; width: 50%;">${modify.title }
								| <b>자료실</b>
							</div>
							<div style="float: left; width: 50%; text-align: right;">
								<c:set var="date" value="${modify.savedate.toString()}" />
								<b>${date.substring(0, 16)}</b>
							</div></td>
					</tr>
					<tr>
						<c:choose>
							<c:when test="${modify.name == 'system'}">
								<th height="40px"><font color="red">관리자</font></th>
							</c:when>
							<c:otherwise>
								<th height="40px">${modify.name}</th>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td height="400px">${modify.content}<input type="hidden"
							value="${modify.id }" name="id"></td>
					</tr>

					<tr>
						<td height="40px"><b>조회수 ${modify.hit}</b> |</td>
					</tr>
					<tr>
						<c:choose>
							<c:when test="${modify.filechk=='N' }">
								<td>첨부된 파일이 없습니다</td>
							</c:when>

							<c:otherwise>
								<td><b><small>첨부파일<br></small></b> <c:forEach var="dto"
										items="${filemodify }">
										<a href="fileDown?file_name=${dto.file_name }&file_name_key=${dto.file_name_key}">
											${dto.file_name }</a> 
						${dto.file_size }Byte<br>
									</c:forEach></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
			</div>
			<br>
		</div>

	</div>
	<br>
	<jsp:include page="../default/footer.jsp" />
</body>
</html>