<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../default/header.jsp" %>
	<div align = "center">
		<h3>아이디 찾기</h3>
		<hr>
		<form action = "user_id_check" method = "post" name = "reg_form">
			<table>
				<tr>
					<th colspan="3" style="width:400px;"><br>이름</th>
				</tr>
				<tr>
					<td colspan="3"><input style="width:100%;" type="text" name="name"></td>
				</tr>
				<tr>
					<th colspan="3"><br>이메일</th>
				</tr>
				<tr>
					<td colspan="3"><input style="width:100%;" type="email" name="email"></td>
				</tr>
			</table>
			
			<br><br>
			<!-- 버튼 타입은 클릭했을 때 자바스크립트를 사용하는 형태로 onclick 속성을 주고 사용합니다. -->
			<!-- onclick 속성안에는 자바스크립트 함수들이 들어가며, 내장함수, 사용자 정의함수의 이름을 넣어서 사용할 수 있습니다. -->
			
			
			<input type = "button" value = "확인" class = "btn btn-primary" onclick= "findId()">
			<input type = "button" value = "취소" class = "btn btn-primary" onclick = "location.href='main_login'">
		</form>


<br>
	</div>	
	
	
<%@ include file="../default/footer.jsp" %>
<script>
		function findId() {
			if (document.reg_form.name.value == 0) {
				alert('이름을 입력해주세요');
				reg_form.name.focus();
				return;
			} else if (document.reg_form.email.value == 0) {
				alert('이메일을 입력해주세요');
				reg_form.email.focus();
				return;
			} else if (confirm('아이디를 찾으시겠습니까?')) {
				//confirm() 메서드는 확인, 취소 여부를 물어보는 js메서드
				//확인 클릭시 true, 취소버튼 클릭시 false반환
				reg_form.submit(); //자바스크립트 submit() 함수
			}
		}
	</script>
</body>
</html>