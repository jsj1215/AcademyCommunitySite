<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery_View</title>
<style>
/* ■ input태그 클릭시 생기는 아웃라인 없애기*/
input:focus {
	outline: none;
}
</style>
<jsp:include page="../default/header.jsp" />
</head>
<!-- ■ ajax사용시 아래 코드 필요! -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<!-- ■ session체크 : 세션값이 null일때 view를 보여주지 않음 -->
	<c:if test="${sessionScope.sid == null}">
		<c:redirect url="main_login" />
	</c:if>

	<script>
		//============================================================================================
		// 댓글 수정을 위한 전역변수..
		//============================================================================================
		var check = null;
		var reply_content2_count = null;

		//============================================================================================
		// ■ 페이지 로드될때 실행됨!
		//============================================================================================
		$(function() {
			viewReply(); //댓글 출력
			likes(); //해당 ID가 로그인 했는지 안했는지 여부 체크
			$("#likeBtn").click(function() {//버튼 클릭시 doButton함수 실행
				doButton();
			});
		});
		
		//============================================================================================
		// ■ enter키 실행 막아주기
		//============================================================================================
		function enter(e) {
			if (e.keyCode == 13) {
				return false;
			}
		}

		//=========================================================================
		// ■ 페이지가 로드 될때 실행 : 현재 해당 ID가 좋아요 눌렀는지 조회해주기
		//=========================================================================	
		function likes() {
			var num = $('tr:eq(0)>td:eq(0)').html();
			var id = "${sessionScope.sid}"
			$.ajax({
				url : "/controller/viewLikes",
				type : "get",
				data : {
					"num" : num,
					"id" : id
				},
				success : function(result) {
					var json = JSON.parse(result);
					if (json.result == 1) { //테이블에 데이터가 있다면.
						document.getElementById("likeBtn").value = '♥'; //버튼을 좋아요 취소로 바꿈
					} else {
						document.getElementById("likeBtn").value = '♡';
					}
				}
			});
		}
		//============================================================================================
		// ■ 좋아요/좋아요 취소 버튼 클릭시 함수 실행
		//============================================================================================
		function doButton() {
			var bt_val = $("#likeBtn").val();
			alert(bt_val);
			if (bt_val == "♡") { //현재 버튼이 '좋아요' 상태가 아니라면
				realLikes(); //좋아요 실행
			} else { //현재 버튼이 '좋아요'상태가 아니라면
				disLike(); //좋아요 취소 실행
			}
		}
		//=========================================================================
		// ■ 좋아요 기능 수행	
		//=========================================================================
		function realLikes() {
			var num = $('tr:eq(0)>td:eq(0)').html();
			var id = "${sessionScope.sid}"
			$.ajax({
				url : "/controller/likes",
				type : "get",
				data : {
					"num" : num,
					"id" : id
				},
				success : function(result) {
					var json = JSON.parse(result);
					if (json.result == 1) {
						alert("좋아요!");
						likesTotal(); //게시판에서 좋아요 개수만 수정
						likes(); //버튼 상태 바꿔주기 위해 실행
					} else {
						alert("좋아요 실패!")
					}
				}
			});
		}
		//=========================================================================
		// ■ 좋아요 취소 기능 수행
		//=========================================================================
		function disLike() {
			var num = $('tr:eq(0)>td:eq(0)').html();
			var id = "${sessionScope.sid}"
			$.ajax({
				url : "/controller/disLikes",
				type : "get",
				data : {
					"num" : num,
					"id" : id
				},
				success : function(result) {
					var json = JSON.parse(result);
					if (json.result == 1) {
						alert("좋아요취소!");
						likesTotal(); //게시판에서 좋아요 개수만 수정
						likes(); //버튼 상태 바꿔주기 위해 실행
					} else {
						alert("좋아요취소 실패!")
					}
				}
			});
		}
		//============================================================================================
		// ■ 좋아요/좋아요 취소 버튼 클릭시 게시판에서 개수만 변경 될 수 있도록
		//============================================================================================
		function likesTotal() {
			var num = $("input[name='reply_num']").val();
			$.ajax({
				url : "/controller/likesTotal",
				type : "get",
				data : {
					"num" : num
				},
				success : function(result) {
					var json = JSON.parse(result);
					var likesTotal = json.result;
					document.getElementById('changeLike').value = likesTotal;

					//$('tr:eq(5)>td:eq(1)').text(likesTotal); //테이블에서 좋아요 숫자만 변경시켜줌.
				}
			});
		}
		//============================================================================================
		// ■ 댓글 달기 
		//============================================================================================
		function reply() {
			//Controller로 보낼 데이터들 변수에 담아주기
			var reply_id = $("input[name='reply_id']").val();
			var reply_content = $("input[name='reply_content']").val();
			var reply_num = $("input[name='reply_num']").val();
			if (confirm("댓글을 등록하시겠습니까?")) {
				$.ajax({
					url : "/controller/reply",
					type : "get",
					data : {
						"reply_id" : reply_id,
						"reply_content" : reply_content,
						"reply_num" : reply_num
					},
					success : function(result) {
						var json = JSON.parse(result);
						if (json.result == 1) {
							alert("답변 등록 성공!");
							$('#reply_content').val(''); 			//답변입력칸 비워주고
							viewReply(); 							//답변 보여주는 메소드
						} else {
							alert("답변 등록 실패!")
						}
					},
					error : function(result) {
						alert(result);
					}
				});
			} else {
				$('#reply_content').val('');
				return;
			}
		}
		//============================================================================================
		// ■ 댓글 보여주기 
		//============================================================================================
		function viewReply() {
			var reply_num = $("input[name='reply_num']").val();
			$.ajax({
						url : "/controller/viewReply",
						type : "get",
						data : {
							"reply_num" : reply_num
						},
						success : function(result) {

							var json = JSON.parse(result);
							var replyList = json.ImageBoardDTO;

							$("form[name='viewReply']").html("");
							//=======================================================================================================
							// ■ 댓글이 없을때 	
							//=======================================================================================================
							if (replyList.length == 0) {
								$("form[name='viewReply']")
										.append(
												"<b><h5 align=\"center\">등록된 댓글이 없습니다.</h5></b>");
							}

							for (var i = 0; i < replyList.length; i++) {
								var str = "<div style=\"width:100%;height:40%;border-bottom:1px solid gray;padding-left:10px; padding-top:15px; background-color:rgba(211, 211, 211, 0.15);\">";

								//=======================================================================================================	
								// ■ A. 답변한 id와 게시글 작성한 id가 같을 때
								//=======================================================================================================	
								if (replyList[i].reply_id == replyList[i].id) {
									str += "<font color=\"blue\"><b>작성자</b></font>&nbsp;";

									//◆ a. 로그인한 ID와 작성자가 같을때 (수정,삭제 가능!!)
									if ("${sessionScope.sid}" == replyList[i].reply_id) {
										str += "<b>&rdca;&nbsp;<input type='text' name='reply_id' style=\"float-left; width:10%; background-color:rgba(211, 211, 211, 0); border: 0px; \" value=\""
												+ replyList[i].reply_id
												+ "\" readonly/></b><b><font color=\"gray\"><input type='text' style=\"float-left;  background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_date
												+ "\" readonly/></font>&nbsp;</b><br><input type='text' name='reply_content2' style=\"float-left; width:86%; background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_content
												+ "\" readonly/><input type='hidden' name='chk' value=\""+replyList[i].chk+"\"/>&nbsp;<b><input type='button' name='reply_modify'style=\"float-left;\" value='수정' onClick='replyModify(this)'/></b>&nbsp;<b><input type='button' name='reply_delete' style=\"float-left;\" value='삭제' onClick='replyDelete(\""
												+ replyList[i].chk
												+ "\")'/></b>&nbsp;<b><input type='button' name='reply_apply' style=\"float-left;  visibility:hidden;\" value='확인' onClick=\"edit_reply()\"/></b><br></div>";
									} // ◆ b. 관리자 계정(삭제만 가능!!)
									else if ("${sessionScope.sid}" == '관리자') {
										str += "<b>&rdca;&nbsp;<input type='text' name='reply_id' style=\"float-left; width:10%; background-color:rgba(211, 211, 211, 0); border: 0px; \" value=\""
												+ replyList[i].reply_id
												+ "\" readonly/></b><b><font color=\"gray\"><input type='text' style=\"float-left;  background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_date
												+ "\" readonly/></font>&nbsp;</b><br><input type='text' name='reply_content2' style=\"float-left; width:86%; background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_content
												+ "\" readonly/><input type='hidden' name='chk' value=\""+replyList[i].chk+"\"/>&nbsp;<b><input type='button' name='reply_modify'style=\"float-left; visibility:hidden;\" value='수정' onClick='replyModify(this)'/></b>&nbsp;<b><input type='button' name='reply_delete' style=\"float-left;\" value='삭제' onClick='replyDelete(\""
												+ replyList[i].chk
												+ "\")'/></b>&nbsp;<b><input type='button' name='reply_apply' style=\"float-left;  visibility:hidden;\" value='확인' onClick=\"edit_reply()\"/></b><br></div>";
									}
									// ◆ c. 로그인한 ID와 작성자가 다를때 (수정,삭제 못함!!)
									else {
										str += "<b>&rdca;&nbsp;<input type='text' name='reply_id' style=\"float-left; width:10%; background-color:rgba(211, 211, 211, 0); border: 0px; \" value=\""
												+ replyList[i].reply_id
												+ "\" readonly/></b><b><font color=\"gray\"><input type='text' style=\"float-left;  background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_date
												+ "\" readonly/></font>&nbsp;</b><br><input type='text' name='reply_content2' style=\"float-left; width:86%; background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_content
												+ "\" readonly/><input type='hidden' name='chk' value=\""+replyList[i].chk+"\"/>&nbsp;<b><input type='button' name='reply_modify'style=\"float-left; visibility:hidden; \" value='수정' onClick='replyModify(this)'/></b>&nbsp;<b><input type='button' name='reply_delete' style=\"float-left; visibility:hidden;\" value='삭제' onClick='replyDelete(\""
												+ replyList[i].chk
												+ "\")'/></b>&nbsp;<b><input type='button' name='reply_apply' style=\"float-left;  visibility:hidden;\" value='확인' onClick=\"edit_reply()\"/></b><br></div>";
									}
									//=======================================================================================================	
									// ■ B. 답답변한 id와 게시글 작성한 id가 다를때
									//=======================================================================================================	
								} else {
									//◆ a. 로그인한 ID와 작성자가 같을때 (수정,삭제 가능!!)
									if ("${sessionScope.sid}" == replyList[i].reply_id) {
										str += "<b>&rdca;&nbsp;<input type='text' name='reply_id' style=\"float-left; width:10%; background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_id
												+ "\" readonly/></b><b><font color=\"gray\"><input type='text' style=\"float-left;  background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_date
												+ "\" readonly/></font>&nbsp;</b><br><input type='text' name='reply_content2' style=\"float-left; width:86%; background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_content
												+ "\" readonly/><input type='hidden' name='chk' value=\""+replyList[i].chk+"\"/>&nbsp;<b><input type='button' name='reply_modify'style=\"float-left;\" value='수정' onClick='replyModify(this)'/></b>&nbsp;<b><input type='button' name='reply_delete' style=\"float-left;\" value='삭제' onClick='replyDelete(\""
												+ replyList[i].chk
												+ "\")'/></b>&nbsp;<b><input type='button' name='reply_apply' style=\"float-left;  visibility:hidden;\" value='확인' onClick=\"edit_reply()\"/></b><br></div>";
										// ◆ b. 관리자 계정(삭제만 가능!!)
									} else if ("${sessionScope.sid}" == '관리자') {
										str += "<b>&rdca;&nbsp;<input type='text' name='reply_id' style=\"float-left; width:10%; background-color:rgba(211, 211, 211, 0); border: 0px; \" value=\""
												+ replyList[i].reply_id
												+ "\" readonly/></b><b><font color=\"gray\"><input type='text' style=\"float-left;  background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_date
												+ "\" readonly/></font>&nbsp;</b><br><input type='text' name='reply_content2' style=\"float-left; width:86%; background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_content
												+ "\" readonly/><input type='hidden' name='chk' value=\""+replyList[i].chk+"\"/>&nbsp;<b><input type='button' name='reply_modify'style=\"float-left; visibility:hidden;\" value='수정' onClick='replyModify(this)'/></b>&nbsp;<b><input type='button' name='reply_delete' style=\"float-left;\" value='삭제' onClick='replyDelete(\""
												+ replyList[i].chk
												+ "\")'/></b>&nbsp;<b><input type='button' name='reply_apply' style=\"float-left;  visibility:hidden;\" value='확인' onClick=\"edit_reply()\"/></b><br></div>";
									}
									// ◆ c. 로그인한 ID와 작성자가 다를때 (수정,삭제 못함!!)
									else {
										str += "<b>&rdca;&nbsp;<input type='text' name='reply_id' style=\"float-left; width:10%; background-color:rgba(211, 211, 211, 0); border: 0px; \" value=\""
												+ replyList[i].reply_id
												+ "\" readonly/></b><b><font color=\"gray\"><input type='text' style=\"float-left; background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_date
												+ "\" readonly/></font>&nbsp;</b><br><input type='text' name='reply_content2' style=\"float-left; width:86%; background-color:rgba(211, 211, 211, 0); border: 0px;\" value=\""
												+ replyList[i].reply_content
												+ "\" readonly/><input type='hidden' name='chk' value=\""+replyList[i].chk+"\"/>&nbsp;<b><input type='button' name='reply_modify'style=\"float-left; visibility:hidden;\" value='수정' onClick='replyModify(this)'/></b>&nbsp;<b><input type='button' name='reply_delete' style=\"float-left; visibility:hidden;\" value='삭제' onClick='replyDelete(\""
												+ replyList[i].chk
												+ "\")'/></b>&nbsp;<b><input type='button' name='reply_apply' style=\"float-left;  visibility:hidden;\" value='확인' onClick=\"edit_reply()\"/></b><br></div>";
									}
								}
								$("form[name='viewReply']").append(str);
							}
						}
					});
		}

		//============================================================================================
		// ■ 댓글 수정하기 (여러 버튼 중 내가 클릭한 버튼을 찾고 싶을 때!!!!!!!!!!!!!!!!)
		//============================================================================================
		function replyModify(button) {
			var obj = button; 											//사용자가 클릭해서 생성된 내용인 this를  button으로 받아와서 obj변수에 담는다.
			var bt_reply_edit_List = $("input[name='reply_modify']");	//reply_modify버튼의 내용들을 list에 담는다.

			for (var i = 0; i < bt_reply_edit_List.length; i++) {		//반복문을 돌며
				var object = bt_reply_edit_List[i];						//reply_modify내용의 i번째를 object변수에 담는다.
				if (object == obj) {									//사용자가 클릭한 버튼이, reply_modify에 있는 내용과 같을 때 아래 내용 실행.
																		//이제 i는 곧 사용자가 입력한 내용이라고 볼 수 있음.
					check = $($("input[name='chk']")[i]).val(); 		//해당 버튼의 chk값을 가져온다.(추후 댓글 테이블에서의 순서를 찾기 위함.)
					$($("input[name='reply_content2']")[i]).prop("readonly",
							false); 									//수정 버튼 클릭시, readonly를 해제함.
					reply_content2_count = i; 							//아래쪽에서 새로 content값을 받을 chk값을 넘겨주기 위함.(위에 전역변수로 있음.)
					$($("input[name='reply_apply']")[i]).css("visibility",
							"visible"); 								//수정버튼을 누르면, 숨겨져있던 확인 버튼이 생성된다.
					$($("input[name='reply_content2']")[i]).css("border",
							"solid gray 1px");
					$($("input[name='reply_content2']")[i]).css(
							"background-color", "white");
				}
			}
		}
		//+obj와 object는 컴퓨터가 주소값으로 찾는 것임!!!

		//============================================================================================
		// ■ 댓글 실제 수정 진행
		//============================================================================================
		function edit_reply() {
			var in_chk = check;
			var in_reply_content = $($("input[name='reply_content2']")[reply_content2_count]).val(); //새로 저장할 값은 이쪽에서 다시 받아와야 함!!!
			var reply_num = $("input[name='reply_num']").val();
			if (confirm("댓글을 수정하시겠습니까?")) {
				$.ajax({
					url : "/controller/editReply",
					type : "post",
					data : {
						"chk" : in_chk,
						"reply_content" : in_reply_content,
						"reply_num" : reply_num
					},
					success : function(result) {
						var json = JSON.parse(result);
						var result = json.result;
						if (result == 1) {
							alert('댓글을 수정하였습니다.');
							viewReply();
						} else {
							alert("댓글 수정을 실패하였습니다.");
						}
					}
				});
			} else {
				return;
			}
		}

		//============================================================================================
		// ■ 댓글 삭제하기
		//============================================================================================
		function replyDelete(chk) {
			var chk = chk; 										//댓글중 번호(chk)
			var reply_num = $("input[name='reply_num']").val(); //게시판 번호 
			if (confirm("댓글을 삭제하시겠습니까?")) {

				$.ajax({
					url : "/controller/deleteReply",
					type : "get",
					data : {
						"chk" : chk,
						"reply_num" : reply_num
					},
					success : function(result) {
						var json = JSON.parse(result);
						if (json.result == 1) {
							alert("댓글을  삭제하였습니다.");
							viewReply();
						} else {
							alert("댓글 삭제를 실패하였습니다.")
						}
					}
				});
			} else {
				return;
			}
		}

		//================================================
		// ■ 게시글 삭제하기
		//================================================
		function delectCheck() {
			if (confirm("게시글을 삭제하겠습니까?")) {
				deletefrm.submit();
			} else {
				return;
			}
		}
	</script>
	<div align="center" class="container" style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="row">
			<div class="col-sm-12 table-responsive box">

				<c:set var="num" value="${param.num }" /><!-- imageboard(글)의 num -->
				<c:set var="board_num" value="${param.num }" /><!-- imagetable(이미지)의 board_num -->
				<c:set var="preview" value="${imageBoardPreview }" />

				<c:forEach var="viewImageList" items="${selectNum }"><!-- imageboard(글)가져오기 -->
					<c:forEach var="viewImage" items="${selectImage}"><!-- imagetable(이미지)가져오기 -->
						<!-- servlet-context.xml에서 mapping해준 location에서 img뒤에 오는 것들을 찾아서 변수에 담아줌! -->
						<c:set var="imageAddress" value="/img/${viewImage.stored_file_name}" />

						<!-- ■ 이전글/다음글 -->
						<div style="width: 50%; float: left; text-align: left;">
							<input type="button" id="imageBoardPreView"	class="btn btn-primary" value="▽이전글"
								OnClick="location.href='ImageBoard_preview?num=${num}'">
							<input type="button" id="imageBoardNextView" class="btn btn-primary" value="△다음글"
								OnClick="location.href='ImageBoard_nextview?num=${num}'">
						</div>

						<div style="float: right;">
							<!-- ■ 수정,삭제는 id가 동일할때만 보여지도록! -->
							<c:choose>
								<c:when test="${sessionScope.sid == viewImageList.id}">
									<input type="button" class="btn btn-primary" style="float: left; margin-right: 3px;" value="목록"
										onClick="location.href='ImageBoard_main'">
									<input type="button" class="btn btn-primary" style="float: left; margin-right: 3px;" value="수정"
										OnClick="location.href='ImageBoard_modify?num=${num}'">
									<form action="ImageBoard_delete" method="post" id="deletefrm" name="deletefrm" style="float: left">
										<input type="hidden" name="num" id="num" value=${num }>
										<input type="hidden" name="stored_file_name" id="stored_file_name" value=${viewImage.stored_file_name }>
										<input type="button" class="btn btn-primary" value="삭제" onclick="delectCheck()">
									</form>
								</c:when>
								<c:otherwise>
									<input type="button" class="btn btn-primary" value="목록" onClick="location.href='ImageBoard_main'">
									<c:choose>
										<c:when test="${sclasses eq '관리자' }">
											<input type="button" class="btn btn-primary" value="삭제"
												OnClick="location.href='ImageBoard_delete?num=${num}&stored_file_name=${viewImage.stored_file_name }'">
										</c:when>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
						<br><br>
						<form name="inputReply" method="post" onkeydown="return enter(event)">
							<table style="width: 100%; table-layout: fixed;" id="boardInfoTable" class="table table-bordered">
								<tr style="display: none;">
									<td colspan="3">${viewImageList.num}</td>
								</tr>
								<tr>
									<td colspan="3">${viewImageList.title}| <b>갤러리</b></td>
								</tr>
								<tr>
									<td style="border-right-color: white; font-weight: bold;"colspan="2">${viewImageList.id}</td>
									<td align="right" style="width: 90%; font-weight: bold;">${viewImageList.savedate}</td>
								</tr>
								<tr>
									<td colspan="3" style="width: 100%; height: 400px;"><br>${viewImageList.content}<br><br>
									<img style="width: 100%;" src="${imageAddress}" /><br><br></td>
								<tr>
									<td colspan="3" style="width: 5px;"><b>조회수	${viewImageList.hit} | <font color="red">좋아요 
									<input type="text" style="border: 0px; width: 10px;"id="changeLike" value="${viewImageList.likes}"></font>
									</b><input type="button" id="likeBtn" value="♡"></td>
								</tr>
								<tr style="border-bottom: 1px solid gray; height: 50px;">
									<td style="line-height: 50px" colspan="3"><b>이미지 다운로드	| 
									<a href="ImageBoard_download?board_num=${viewImage.board_num}">${viewImage.original_file_name}</a>
									</b></td>
								</tr>
								<tr>
									<td colspan="3" style="width: 100%; height: 150px;"><br>
										<!-- =========================================================================== -->
										<!-- ■ 댓글 입력하는 곳 --> 
										<!-- =========================================================================== -->
										<input type="hidden" name="reply_num" id="reply_num" value="${param.num}"> 
										<input type="hidden" name="reply_id" id="reply_id" value="${sessionScope.sid }"	readonly="readonly">
										<input onkeyup="enterkey()"	type="text" name="reply_content" id="reply_content"
										style="width: 87%; height: 80%;" placeholder="댓글을 입력 하세요.">&nbsp;&nbsp; 
										<input type="button" class="btn btn-primary" value="등록" name="reply_btn" id="reply_btn" onClick="reply()"
										style="width: 10%; height: 80%;"></td>
								</tr>
							</table>
						</form>
						<br>
					</c:forEach>
				</c:forEach>
				<br>
				<!-- =========================================================================== -->
				<!-- ■ 댓글 보여주는 곳 -->
				<!-- =========================================================================== -->
				<div align="left" id="replyBox">
					<div align="left" style="height: 250px;">
						<form name="viewReply" id="viewReply" style="height: 100%;">
							<input type="hidden" name="reply_num" id="reply_num" value="${param.num}">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<jsp:include page="../default/footer.jsp" />
</body>
</html>