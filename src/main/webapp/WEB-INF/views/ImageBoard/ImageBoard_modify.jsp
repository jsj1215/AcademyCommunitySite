<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery Modify</title>
<!-- ■ CKEditor 사용 -->
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>

<style>
input:focus {
	outline: none;
}
table {
	table-layout: fixed;
	width: 100px;
}

</style>
<script>


//==========================================================================
// ■ 페이지 로드시 실행
//==========================================================================
function init() {
CKEDITOR.replace('content');
CKEDITOR.replace('content', {
	enterMode : CKEDITOR.ENTER_BR //엔터치면 커서 내려가도록
}); 
CKEDITOR.config.width = 1100;
CKEDITOR.config.height = 400;
}
</script>
</head>
<jsp:include page="../default/header.jsp"/>
<body onLoad="init()" style="overflow-x: hidden; overflow-y: auto;">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="num" value="${param.num }" />
	<!-- imageBoard의 num -->
	<c:set var="board_num" value="${param.num }" />
	<!-- imageTable의 board_num -->
	<div align="center" class="container"
		style="border-style: groove; background-color: rgba(255, 255, 255, 0.95);">
		<div class="row">
			<div class="col-sm-12 table-responsive box">
				<div align="center">
					<c:forEach var="modifyView" items="${modifyView }">
<%-- 					<c:forEach var="modifyViewImage" items="${modifyViewImage }">
						<c:set var="imageAddress" value="/img/${modifyViewImage.stored_file_name}" /> --%>
							<form action="modifySave" method="post" id="frm" name="frm"	enctype="multipart/form-data">
								<table style="width: 100%; table-layout: fixed;" class="table table-bordered">
									<%--값이 잘 들어 왔는지 확인 용 =>
 									<p><c:out value="${modifyView.title}" /></p> --%>
									<tr style="display: none;">
										<td><input type="hidden" name="num"	value="${modifyView.num}">${modifyView.num}</td>
									</tr>
									<tr>
										<td colspan="3"><input type="text" name="title"	style="text-align: left; width: 100%;" maxlength="20"
											value="${modifyView.title }"></td>
									</tr>
									<tr>
										<td style="border-right-color: white; font-weight: bold;" colspan="2">
										<input type="hidden" name="id" value="${modifyView.id}">${modifyView.id}</td>
										<td align="right" style="width: 90%; font-weight: bold;">${modifyView.savedate}</td>
									</tr>
									<tr>
										<td colspan="3"><br><br>
										<textarea name="content" id="content" cols="77" rows="10">${modifyView.content }</textarea><br><br></td>
									</tr>
									<tr>
										<td colspan="3" style="width: 5px;"><b>조회수	${modifyView.hit} | <font color="red">좋아요 ${modifyView.likes}</font>
										</b></td>
									</tr>
									<tr>
										<td colspan="3" style="width: 90%">
										<font style="float: left;"><b>이미지첨부 | &nbsp;</b></font>
										<input type="file" name="imageModify" id="imageFile" style="float: left;" value="첨부"></td>
									</tr>
								</table>
								<br> 
								<input type="button" class="btn btn-primary" value="수정" onClick="check()"> 
								<input type="button" class="btn btn-primary" value="작성 취소"	onClick="location.href='ImageBoard_main'">
							</form>
						</c:forEach>
<%-- 					</c:forEach> --%>
				</div>
				<script>

	//==========================================================================
	// ■ 내용입력 전체 체크
	//==========================================================================
	var content = null;
	var imageFile = null;
	var content_length = 0;
	var subcontent=" ";
	var subcontent_length = 0;
		
		function check() {
		imageFileCheck();
		contentCheck();
		//totalCheck();
	}	
	//==========================================================================
	// ■ 이미지 체크
	//==========================================================================	
	function imageFileCheck() {
		if (document.getElementById("imageFile").files.length == 0) {
			alert('이미지를 첨부해주세요.');
		}
	}
	//==========================================================================
	// ■ 내용입력 체크
	//==========================================================================
	function contentCheck() {
		//해당함수는 내용이 입력된 후에 작동하므로, 메소드 안에서 실행하자!
		content = CKEDITOR.instances.content.getData();
		content_length = CKEDITOR.instances.content.getData().length;
		subcontent = removeHTML(content); //html태그 제거하고 변수에 담는다.
		subcontent_length = subcontent.length;
		if (subcontent == "") {
			alert('내용을 입력하세요.')
			return;
		} 
		if (subcontent_length > 500) {
			alert('최대길이 제한을 벗어났습니다.')
			CKEDITOR.instances.content.setData(content.substring(0, 400));
			CKEDITOR.instances.content.focus();
			return;
		} else {
			totalCheck();
			}
		}
					//html태그 제거 해주는 함수
					function removeHTML(text) {
						text = text.replace(/<br\/>/ig, "\n");
						text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig,"");
						return text;
					}
					function totalCheck() {
						//content = CKEDITOR.instances.content.getData();
						//content_length = CKEDITOR.instances.content.getData().length;
						if (content != ""
								&& document.getElementById("imageFile").files.length != 0) {
							if (confirm("수정 하시겠습니까?")) {
								frm.submit();
							} else {
								return;
							}
						}
					}
				</script>
			</div>
		</div>
	</div>
	<jsp:include page="../default/footer.jsp" />
</body>

</html>