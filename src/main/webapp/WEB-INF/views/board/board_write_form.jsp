<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${sessionScope.sid == null}">
	<c:redirect url="main_login"/>
</c:if>
<!-- textarea 최대길이 제한하는 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
    	$('#ta').on('keyup', function() {
	        if($(this).val().length > 1300) {
	        	alert('최대길이 제한을 벗어났습니다.');
	            $(this).val($(this).val().substring(0, 1300));
	        }
    	});
	});
	
	function check() {
		
		if($("#title").val() == "") {
			alert('제목을 입력하세요.');
			return;
		} else if($("#ta").val() == "") {
			alert('내용을 입력하세요.');
			return;
		} else {
			createBoard();
		}
	}
	
	function createBoard() {
		if (confirm('저장 하시겠습니까?')) {
			reg_form.submit(); //자바스크립트 submit() 함수
		}
	}
</script>
</head>
<body>
	<%@ include file="../default/header.jsp"%>

	<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="row">
			<div class="col-sm-12 table-responsive box">
				<form action="board_write_save" method="post" name="reg_form">
					<div style="width: 2%; float: left;">&nbsp;</div>
					<div style="width: 48%; float: left; text-align: left;">
						&nbsp;<b>${sessionScope.sid }</b> | <b>자유게시판</b>
					</div>
					<div style="width: 48%; float: left; text-align: right;">
						<input type="button" value="저장" onclick="check()">&nbsp;<input
							type="button" value="목록" onclick="location.href='board_list'">
					</div>
					&nbsp;<br>&nbsp;
					<table class="table table-bordered">
						<tr>
							<th style="width: 15%;">&nbsp;&nbsp;&nbsp;제목</th>
							<td><input type="hidden" name="name"
								value="${sessionScope.sid}"><input style="width: 100%"
								type="text" name="title" maxlength="20" placeholder="최대 20자" id="title"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea style="width: 100%" rows="20"
									cols="22" name="content" id="ta" placeholder="최대 300자"></textarea></td>
						</tr>
					</table>

				</form>
			</div>
			<br>
		</div>
	</div>
	<br>
	<%@ include file="../default/footer.jsp"%>
</body>
</html>