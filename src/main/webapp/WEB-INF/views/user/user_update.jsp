<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:choose>
<c:when test="${empty sid }">
	<script>
		location.href = 'main_login';
	</script>
</c:when>
</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../default/header.jsp" %>
	<div align = "center">
		<h3>회원정보 수정</h3>
		<hr>
		<form action = "user_update_ok" method = "post" name = "reg_form">
			<table>
				<tr>
					<th colspan="3">아이디</th>
				</tr>
				<tr>
					<td colspan="3" style="width:400px;"><input style="width:100%;" type="text" name="id" value="${list.id }" readonly="readonly"></td>
				</tr>
				<tr>
					<th colspan="3"><br>비밀번호</th>
				</tr>
				<tr>
					<td colspan="3"><input style="width:100%;" type="password" value="${list.pw }" name="pw"></td>
				</tr>
				<tr>
					<th colspan="3"><br>비밀번호 재확인</th>
				</tr>
				<tr>
					<td colspan="3"><input style="width:100%;" type="password" value="" name="pw_check"></td>
				</tr>
				<tr>
					<th colspan="3"><br>이름</th>
				</tr>
				<tr>
					<td colspan="3"><input style="width:100%;" type="text" value="${list.name }" name="name" readonly="readonly"></td>
				</tr>
				<tr>
					<th colspan="3"><br>생년월일</th>
				</tr>
				<tr>
					<td style="width:120px;"><input style="width:120px;" type="number" min="1900" max="2020" name="year" value="${list.year }" readonly="readonly"></td>
					<td align="center" style="width:120px;"><input style="width:120px;" type="text" name="month" value="${list.month }" readonly="readonly"></td>
					<td align="right" style="width:120px;"><input style="width:120px;" type="number" min="1" max="31" name="days" value="${list.days }" readonly="readonly"></td>
				</tr>
				<tr>
					<th colspan="3"><br>성별</th>
				</tr>
				<tr>
					<td colspan="3">
					<input style="width:100%;" type="text" value="${list.gender }" name="gender" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th colspan="3"><br>이메일</th>
				</tr>
				<tr>
					<td colspan="3"><input style="width:100%;" type="email" name="email" value="${list.email }"></td>
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
					<input style="width:100%;" type="text" value="${list.answer }" name="answer">
					</td>
				</tr>
				
			</table>
			
			<br>
			<!-- 버튼 타입은 클릭했을 때 자바스크립트를 사용하는 형태로 onclick 속성을 주고 사용합니다. -->
			<!-- onclick 속성안에는 자바스크립트 함수들이 들어가며, 내장함수, 사용자 정의함수의 이름을 넣어서 사용할 수 있습니다. -->
			
			
			<input type = "button" value = "정보수정" class = "btn btn-primary" onclick="joinConfirm()">
			<input type = "button" value = "취소" class = "btn btn-primary" onclick = "history.go(-1)">
		</form>



	</div>	
	
	
<%@ include file="../default/footer.jsp" %>
<script>
		function joinConfirm() {
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
			} else if (document.reg_form.email.value == 0) {
				alert('이메일을 입력해주세요');
				reg_form.email.focus();
				return;
			} else if (document.reg_form.question.value.length < 1 || document.reg_form.answer.value == 0) {
				alert('본인확인 질문답변을 설정해주세요');
				reg_form.question.focus();
				return;
			} else if (document.reg_form.pw.value != document.reg_form.pw_check.value) {
				alert('비밀번호 확인을 다시 입력하세요');
				reg_form.pw_check.focus();
				return;
			} else if (confirm('정보수정을 하시겠습니까?')) {
				//confirm() 메서드는 확인, 취소 여부를 물어보는 js메서드
				//확인 클릭시 true, 취소버튼 클릭시 false반환
				reg_form.submit(); //자바스크립트 submit() 함수
			}
		}
	</script>
</body>
</html>