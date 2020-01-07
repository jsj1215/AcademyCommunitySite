<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
hr.a {
	border-style: dotted;
	color: gray;
	width: 99%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	
</script>

<script>
	function replyView(idx) {
		$("#replyView"+idx).slideToggle('fast');
		$("#modifyView"+idx).slideUp('fast');
	}

	function modifyView(idx) {
		$("#modifyView"+idx).slideToggle('fast');
		$("#replyView"+idx).slideUp('fast');
	}
	
	function check(id) {
		if(confirm("게시글을 삭제하시겠습니까?")) {
			location.href="board_delete?id="+id;
		} else {
			return;
		}
	}
	
	function likes(id) {
		
		$.ajax({
			url : "board_likes?id="+id+"&name=${sessionScope.sid}", type : "POST",
			success : function(data) {
				if(data == "성공") {
					alert('좋아요가 반영되었습니다.');
					location.reload();
				} else {
					alert('좋아요 반영에 실패했습니다.');
				}
			},
			error : function() {
				alert('문제가 발생 했습니다.');
			}
		});
	}
	
	function unLikes(id) {
		$.ajax({
			url : "board_unlikes?id="+id+"&name=${sessionScope.sid}", type : "POST",
			success : function(data) {
				if(data == "성공") {
					alert('좋아요가 취소되었습니다.');
					location.reload();
				} else {
					alert('좋아요 취소에 실패했습니다.');
				}
			},
			error : function() {
				alert('문제가 발생 했습니다.');
			}
		});
	}
	
	function replySave(id) {
		if(document.getElementById("replyContent").value == "") {
			alert('내용을 입력하세요.');
			return;
		} else {
			var content = document.getElementById("replyContent").value;
		}
		
		$.ajax({
			url : "board_reply_save?id="+id+"&name=${sessionScope.sid}&content="+content+"&indent=0", type : "POST",
			success : function(data) {
				if(data == "성공") {
					alert('댓글이 저장되었습니다.');
					location.reload();
				} else {
					alert('댓글 저장에 실패했습니다.');
				}
			},
			error : function() {
				alert('문제가 발생 했습니다.');
			}
		});
	}
	
	function replyDelete(id, chk, indent, step) {
		if(confirm("해당 댓글을 삭제하시겠습니까?")) {
			$.ajax({
				url : "board_reply_delete?id="+id+"&chk="+chk+"&indent="+indent+"&step="+step, type : "POST",
				success : function(data) {
					if(data == "성공") {
						alert('댓글이 삭제되었습니다.');
						location.reload();
					} else {
						alert('댓글 삭제에 실패했습니다.');
					}
				},
				error : function() {
					alert('문제가 발생 했습니다.');
				}
			});
		} else {
			return;
		}
	}
	
	function replyReply(id, step, indent, chk) {
		if(document.getElementById("reply"+chk).value == "") {
			alert('내용을 입력하세요.');
			return;
		} else {
			var content = document.getElementById("reply"+chk).value;
		}
		
		$.ajax({
			url : "board_reply_reply?id="+id+"&name=${sessionScope.sid}&content="+content+"&step="+step+"&indent="+indent, type : "POST",
			success : function(data) {
				if(data == "성공") {
					alert('댓글이 저장되었습니다.');
					location.reload();
				} else {
					alert('댓글 저장에 실패했습니다.');
				}
			},
			error : function() {
				alert('문제가 발생 했습니다.');
			}
		});
	}
	
	function replyModify(id, chk) {
		if(document.getElementById("modify"+chk).value == "") {
			alert('내용을 입력하세요.');
			return;
		} else {
			var content = document.getElementById("modify"+chk).value;
		}
		
		$.ajax({
			url : "board_reply_modify?id="+id+"&content="+content+"&chk="+chk, type : "POST",
			success : function(data) {
				if(data == "성공") {
					alert('댓글이 저장되었습니다.');
					location.reload();
				} else {
					alert('댓글 저장에 실패했습니다.');
				}
			},
			error : function() {
				alert('문제가 발생 했습니다.');
			}
		});
	}
</script>
<body>
	<%@ include file="../default/header.jsp"%>
	<!-- 세션값이 null일때 info를 보여주지 않음 -->
	<c:if test="${sessionScope.sid == null}">
		<c:redirect url="main_login" />
	</c:if>
	<c:if test="${param.chk == 'end'}">
		<script>
			alert('마지막 페이지입니다.');
			history.back();
		</script>
	</c:if>
	<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="row">
			<div class="col-sm-12 table-responsive box">
				<div style="width: 2%; float: left;">&nbsp;</div>
				<div style="width: 48%; float: left; text-align: left;">
					<input type="button" class="btn btn-primary" value="▽이전글" onclick="location.href='board_preInfo?id=${dto.id}&name=${sessionScope.sid}'">&nbsp;<input
						type="button" class="btn btn-primary" value="△다음글" onclick="location.href='board_nextInfo?id=${dto.id}&name=${sessionScope.sid}'">
				</div>
				<div style="width: 48%; float: left; text-align: right;">
					<c:choose>
						<c:when test="${sessionScope.sid == dto.name}">
							<tr>
								<td align="right"><button class="btn btn-primary"
										onclick="location.href='board_modify_form?id=${dto.id}'">수정</button>
									<button class="btn btn-primary" onclick="check(${dto.id})">삭제</button></td>
							</tr>
						</c:when>
						<c:when test="${sessionScope.sid == 'system'}">
							<td align="right">
								<button class="btn btn-primary" onclick="check(${dto.id})">삭제</button>
							</td>
						</c:when>
					</c:choose>
					<input type="button" class="btn btn-primary" value="목록"
						onclick="location.href='board_list'">
				</div>
				&nbsp;<br>&nbsp;
				<table class="table table-bordered">
					<tr>
						<td height="30px"><div style="float: left; width: 50%;">${dto.title}
								| <b>자유게시판</b>
							</div>
							<div style="float: left; width: 50%; text-align: right;">
								<c:set var="date" value="${dto.savedate.toString()}"/>
								<b>${date.substring(0, 16)}</b>
							</div></td>
					</tr>
					<tr>
						<c:choose>
							<c:when test="${dto.name == 'system'}">
								<th height="40px"><font color="red">관리자</font></th>
							</c:when>
							<c:otherwise>
								<th height="40px">${dto.name}</th>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td height="400px">${dto.content}</td>
					</tr>

					<tr>
						<td height="40px"><b>조회수 ${dto.hit}</b> | <b
							style="color: red;">좋아요 ${dto.likes}</b> <c:choose>
								<c:when test="${chkList.size() == 0}">
									<button onclick="likes(${dto.id})">♡</button>
								</c:when>
								<c:otherwise>
									<button onclick="unLikes(${dto.id})">♥</button>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td height="73px"><div style="width: 90%; float: left;">
								<input type="text" style="height:100px; width:99%;" id="replyContent" placeholder="댓글을 입력하세요." maxlength="100">
							</div>
							<div style="width: 10%; float: left;" align="right">
								<button style="height: 100px; width: 98%;"
									class="btn btn-primary" onclick="replySave(${dto.id})">저장</button>
							</div></td>
					</tr>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="box">
				<div class="col-sm-12"
					style="background-color: rgba(211, 211, 211, 0.15);">
					<div class="table-responsive">
						<br>
						<table border="0" style="width: 100%">

							<c:choose>
								<c:when test="${replyList.size() == 0}">
									<tr>
										<th style="text-align: center;" colspan="2">등록된 댓글이 없습니다.<br>&nbsp;
										</th>
									</tr>
									<tr style="border-top: 1px solid #dee2e6;">
										<td colspan="2">&nbsp;</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="replies" items="${replyList}">
										<tr>
											<th colspan="2"><div style="float: left; width: 59%">
													<c:forEach begin="1" end="${replies.indent}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small
															style="color: red;">ㄴ</small>
													</c:forEach>
													<c:choose>
														<c:when test="${replies.name == 'system'}">
															<font color="red">관리자</font>&nbsp;&nbsp;
														</c:when>
														<c:when test="${replies.name == dto.name}">
															<font color="blue" size="1">작성자</font> ${replies.name}&nbsp;&nbsp;
														</c:when>
														<c:otherwise>
															${replies.name}&nbsp;&nbsp;
														</c:otherwise>
													</c:choose>
													<c:set var="date" value="${replies.savedate.toString()}"/>
													<small style="color: gray;">${date.substring(0, 16)}</small>
												</div>
												<div style="float: left; width: 40%;" align="right">
													<c:if test="${replies.indent == 0}">
														<button onclick="replyView(${replies.chk})">답글</button>
													</c:if>
													<c:choose>
														<c:when test="${sessionScope.sid == replies.name}">
															<button onclick="modifyView(${replies.chk})">수정</button>
															<button
																onclick="replyDelete(${replies.id}, ${replies.chk},${replies.indent},${replies.step})">삭제</button>
														</c:when>
														<c:when test="${sessionScope.sid == 'system'}"> 
															<button
																onclick="replyDelete(${replies.id}, ${replies.chk},${replies.indent},${replies.step})">삭제</button>
														</c:when>
													</c:choose>
												</div></th>
										</tr>
										<tr>
											<td colspan="2"><c:forEach begin="1"
													end="${replies.indent}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>${replies.content}<br>&nbsp;</td>
										</tr>
										<tr style="border-top: 1px solid #dee2e6;">
											<td colspan="2">&nbsp;</td>
										</tr>
										<tr align="center" id="modifyView${replies.chk}"
											style="display: none;">
											<td width="10%"><b>${sessionScope.sid }</b></td>
											<td colspan="2" align="center">
												<div style="width: 85%; float: left;">
													<input type="text" style="width:95%; height:100px;" id="modify${replies.chk}" maxlength="100" value="${replies.content}">
												</div>
												<div style="width: 14%; float: left;" align="right">
													<button style="height: 100px; width: 100%;" class="btn btn-primary"
														onclick="replyModify(${replies.id}, ${replies.chk})">수정</button>
												</div>
											</td>
										</tr>
										<c:choose>
											<c:when test="${replies.indent == 0}">
												<tr align="center" id="replyView${replies.chk}"
													style="display: none; border-bottom: 1px solid #dee2e6;">
													<td width="10%"><b>${sessionScope.sid }</b></td>
													<td height="73px" colspan="2">
														<div style="width: 85%; float: left;">
															<input type="text" style="width:95%; height:100px;" id="reply${replies.chk}" placeholder="댓글을 입력하세요." maxlength="100">
														</div>
														<div style="width: 14%; float: left;" align="right">
															<button style="height: 100px; width: 100%;"
																class="btn btn-primary"
																onclick="replyReply(${replies.id},${replies.step},${replies.indent},${replies.chk})">저장</button>
														</div>
													</td>
												</tr>

											</c:when>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>


			</div>
			<br>
		</div>

	</div>
	<br>
	<%@ include file="../default/footer.jsp"%>

</body>
</html>