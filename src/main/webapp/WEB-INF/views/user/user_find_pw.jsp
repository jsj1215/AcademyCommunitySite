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
		<h3>비밀번호 찾기</h3>
		<hr>
		<form action = "user_pw_check" method = "post" name = "reg_form">
			<table>
				<tr>
					<th colspan="3">아이디</th>
				</tr>
				<tr>
					<td colspan="3" style="width:400px;"><input style="width:100%;" type="text" name="id"></td>
				</tr>
				<tr>
					<th colspan="3"><br>이름</th>
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
				<tr>
					<th colspan="3"><br>본인확인 질문</th>
				</tr>
				<tr>
					<td colspan="3">
					<select style="width:100%;" name="question">
						<option value="">본인확인 질문목록</option>
						<option value="question1">당신의 보물 제 1호는 ?</option>
						<option value="question2">당신이 나온 초등학교 이름은?</option>
						<option value="question3">당신이 제일 존경하는 인물은?</option>
					</select>
					</td>
				</tr>
				<tr>
					<th colspan="3"><br>본인확인 질문답변</th>
				</tr>
				<tr>
					<td colspan="3">
					<input style="width:100%;" type="text" name="answer">
					</td>
				</tr>
			</table>
			
			<br><br>
			<!-- 버튼 타입은 클릭했을 때 자바스크립트를 사용하는 형태로 onclick 속성을 주고 사용합니다. -->
			<!-- onclick 속성안에는 자바스크립트 함수들이 들어가며, 내장함수, 사용자 정의함수의 이름을 넣어서 사용할 수 있습니다. -->
			
			
			<input type = "button" value = "확인" class = "btn btn-primary" onclick= "findPw()">
			<input type = "button" value = "취소" class = "btn btn-primary" onclick = "location.href='main_login'">
		</form>



	</div>	
	
	
<%@ include file="../default/footer.jsp" %>
<script>
		function findPw() {
			//var a =1;//자바 스크립트 변수 var
			//document 문서를 뜻함
			//name이 reg_form 안에, name이 id인 값
			if (document.reg_form.id.value == 0) {
				alert('아이디를 입력해주세요');
				reg_form.id.focus(); //reg_form에 id 마우스를 위치시킴
				return; //강제 메서드 종료
			} else if (document.reg_form.id.value.length < 4) {
				alert('아이디는 4자 이상이어야 합니다');
				reg_form.id.focus();
				return;
			} else if (document.reg_form.name.value == 0) {
				alert('이름을 입력해주세요');
				reg_form.name.focus();
				return;
			} else if (document.reg_form.email.value == 0) {
				alert('이메일을 입력해주세요');
				reg_form.email.focus();
				return;
			} else if (document.reg_form.question.value.length < 1 || document.reg_form.answer.value == 0) {
				alert('본인확인 질문답변을 설정해주세요');
				reg_form.question.focus();
				return;
			} else if (confirm('비밀번호를 찾으시겠습니까?')) {
				//confirm() 메서드는 확인, 취소 여부를 물어보는 js메서드
				//확인 클릭시 true, 취소버튼 클릭시 false반환
				reg_form.submit(); //자바스크립트 submit() 함수
			}
		}
	</script>
</body>
</html>