<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:choose>
<c:when test="${empty pwconfirm }">
	<script>
		alert("아이디의 정보가 일치하지 않습니다.");
		location.href='user_find_pw';
	</script>
</c:when>
</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../default/header.jsp" %>
	<div align = "center">
		<h3>비밀번호 변경</h3>
		<hr><br>
		<form action="user_change_pw" method="post" name="reg_form">
		<input type="hidden" name="id" value="${pwconfirm.id }">
			<table>
				<tr>
					<th colspan="3"><br>변경할 비밀번호</th>
				</tr>
				<tr>
					<td colspan="3"><input style="width:100%;" type="password" name="pw"></td>
				</tr>
				<tr>
					<th colspan="3"><br>비밀번호 확인</th>
				</tr>
				<tr>
					<td colspan="3"><input style="width:100%;" type="password" name="pw_check"></td>
				</tr>
			</table>
		<br><br>
		<input type = "button" value = "확인" class = "btn btn-primary" onclick= "changePw()">
		<input type = "button" value = "취소" class = "btn btn-primary" onclick = "location.href='main_login'">
		</form>
	</div>
	<%@ include file="../default/footer.jsp" %>
	<script>
		function changePw() {
			//var a =1;//자바 스크립트 변수 var
			//document 문서를 뜻함
			//name이 reg_form 안에, name이 id인 값
			if (document.reg_form.pw.value == 0) {
				alert('비밀번호를 입력해주세요');
				reg_form.pw.focus();
				return;
			} else if (document.reg_form.pw.value.length < 8) {
				alert('비밀번호는 8자 이상이어야 합니다');
				reg_form.pw.focus();
				return;
			} else if (document.reg_form.pw_check.value == 0) {
				alert('비밀번호 확인을 입력해주세요');
				reg_form.pw_check.focus();
				return;
			} else if (document.reg_form.pw.value != document.reg_form.pw_check.value) {
				alert('비밀번호 확인을 다시 입력하세요');
				reg_form.pw_check.focus();
				return;
			} else if (confirm('비밀번호 변경을 하시겠습니까?')) {
				//confirm() 메서드는 확인, 취소 여부를 물어보는 js메서드
				//확인 클릭시 true, 취소버튼 클릭시 false반환
				reg_form.submit(); //자바스크립트 submit() 함수
			}
		}
	</script>
</body>
</html>