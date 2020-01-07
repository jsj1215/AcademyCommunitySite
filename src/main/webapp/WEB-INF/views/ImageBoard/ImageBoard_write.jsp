<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- ===================================================================== -->
<!-- ■ CKEditor 사용 -->
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<!-- ===================================================================== -->

<meta charset="UTF-8">
<title>Gallery Write</title>

<style type="text/css">
input:focus {
	outline: none;
}
word-wrap: break-word ; /*자동 줄 바꿈 */ 
table {
	table-layout: fixed;
	width: 100px;
}
/*   .line{border-bottom:1px solid gray;} */
</style>

<script>
	var subcontent = " ";
	var subcontent_length = 0;
	//==========================================================================
	// ■ 페이지 로드시 실행
	//==========================================================================
	function init() {
		CKEDITOR.replace('content');
		CKEDITOR.replace('content', {
			enterMode : CKEDITOR.ENTER_BR
		}); //엔터치면 커서 내려가도록
		CKEDITOR.config.width = 1000;
		CKEDITOR.config.height = 400;
	}
</script>

</head>
<body onLoad="init()" style="overflow-x: hidden; overflow-y: auto;">
	<jsp:include page="../default/header.jsp" />
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- ■ session체크 : 세션값이 null일때 view를 보여주지 않음 -->
	<c:if test="${sessionScope.sid == null}">
		<c:redirect url="main_login" />
	</c:if>
	<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="row">
			<div class="col-sm-12 table-responsive box">
				<div align="center">
					<!-- ■ 글 쓰기(글 저장) -->
					<!-- 해당 폼은 Multipart형식이다. 사진,동영상 등 글자가 아닌 파일은 모두 Multipart형식의 데이터로 처리해줘야 한다. -->
					<form action="saveData" method="post" id="frm" name="frm" enctype="multipart/form-data">
						<table style="width: 1000px;" class="table table-bordered">
							<tr>
								<td colspan="2" style="width: 10%; text-align: left;"><b>
										<input type="hidden" name="id" id="id"
										style="border: 0px; float: left;" value="${sessionScope.sid}"
										readonly="readonly"><font style="float: left">${sessionScope.sid} | 갤러리</font>
								</b></td>
							</tr>
							<tr>
								<td style="width: 10%; text-align: left"><b>제목</b></td>
								<td style="width: 90%"><input type="text" name="title" id="title" style="text-align: left; width: 100%;"
									maxlength="20" placeholder="제목을 입력하세요."></td>
							</tr>
							<tr>
								<td colspan="2"><br> <textarea name="content" id="content" cols="77" rows="10" placeholder="내용을 입력하세요."></textarea></td>
							</tr>
							<tr>
								<td style="width: 10%; text-align: left"><b>이미지 첨부</b></td>
								<td><input type="file" name="imageFile" id="imageFile"></td>
							</tr>
						</table>
						<br> 
						<input type="button" class="btn btn-primary" value="글쓰기" onClick="check()"> 
						<input type="button" class="btn btn-primary" value="작성 취소" onClick="location.href='ImageBoard_main'"><br> <br>
					</form>
				</div>

				<script>
					var id = null;
					var content = null;
					var title = null;
					var imageFile = null;
					var content_length = 0;

					function check() {
						titleCheck();
						imageFileCheck();
						contentCheck();
						//totalCheck();
					}
				
					function titleCheck() {
						title = document.getElementById("title");
						if (title.value == "") {
							alert('타이틀을 입력하세요.');
						}
					}
					function imageFileCheck() {
						if (document.getElementById("imageFile").files.length == 0) {
							alert('이미지를 첨부해주세요.');
						}
					}

					function contentCheck() {
						//해당함수는 내용이 입력된 후에 작동하므로, 메소드 안에서 실행하자!
						content = CKEDITOR.instances.content.getData();
						content_length = CKEDITOR.instances.content.getData().length;
						subcontent = removeHTML(content); //html태그 제거하고 변수에 담는다.
						subcontent_length = subcontent.length;

						if (subcontent == "") {
							alert('내용을 입력하세요.');
							return;
						}
						if (subcontent_length > 500) {
							alert('최대길이 제한을 벗어났습니다.');
							CKEDITOR.instances.content.setData(subcontent
									.substring(0, 499));
							CKEDITOR.instances.content.focus();
							return;
						} else {
							totalCheck();
						}

					}
					//======================================================
					//html태그 제거 해주는 함수
					//======================================================
					function removeHTML(text) {
						text = text.replace(/<br\/>/ig, "\n");
						text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig,"");
						return text;
					}

					function totalCheck() {
						if (id.value != ""
								&& title.value != ""
								&& content != ""
								&& document.getElementById("imageFile").files.length != 0) {
							if (confirm("저장 하시겠습니까?")) {
								frm.submit();
							} else {
								return;
							}
						}
					}

					//===============================================================
					// ■ 글쓰기 글자 수 제한
					//===============================================================
					/*
					$(document).ready(function() {
						$('#content').on('keyup', function() {
							if ($(this).val().length > 300) {
								alert('최대길이 제한을 벗어났습니다.')
								$(this).val($(this).val().substring(0, 300));
							}
						});
					});
					 */
				</script>
				<br> <br> <br>
			</div>
		</div>
	</div>
</body>
</html>