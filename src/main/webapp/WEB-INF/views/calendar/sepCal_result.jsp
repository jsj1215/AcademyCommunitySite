<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta content="charset=UTF-8">
<title>Insert title here</title>
</head>
<body>9월 result<br>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../default/header.jsp"/>

<form action="sepCal_update">
<div style="display: flex; flex-flow: column;">
<div style="margin: 0 auto; order:1; row; display: flex;">
<div style="order:1; text-align: center;">
<table width="630" cellpadding="2" cellspacing="0" border="1" style="background-color: white;">
<tr height="30">
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">일</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">월</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">화</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">수</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">목</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">금</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">토</font></td>
</tr>
<tr height="30">
<%  for(int i = 1; i <= 7; i++ ) { 
	String fontcolor = (i % 7 == 0 || i % 7 == 1)? "red" : "black";
	if (i % 7 == 0 || i % 7 == 1) { %>
		<td width="90"><font size="2" color=<%=fontcolor %>> <%=i%></font><br><br><br><br></td>
		<%} else {%>
		<td width="90">
		<font size="2" color=<%=fontcolor %>> <%=i%></font><br>
		<font size="2" id="9<%=i%>a">출석</font><br>
		<font size="2" id="9<%=i%>b">결석</font><br>
		<font size="2" id="9<%=i%>c">조퇴 / 지각</font>
		</td> 
	<%}
}%>
</tr>

<tr height="30">
<%  for(int i = 8; i <= 14; i++ ) { 
	String fontcolor = (i % 7 == 0 || i % 7 == 1)? "red" : "black";
	if (i % 7 == 0 || i % 7 == 1) { %>
		<td width="90"><font size="2" color=<%=fontcolor %>> <%=i%></font><br><br><br><br></td>
		<%} else {%>
		<td width="90">
		<font size="2" color=<%=fontcolor %>> <%=i%></font><br>
		<font size="2" id="9<%=i%>a">출석</font><br>
		<font size="2" id="9<%=i%>b">결석</font><br>
		<font size="2" id="9<%=i%>c">조퇴 / 지각</font>
		</td> 
<%}
}%>
</tr>

<tr height="30">
<%  for(int i = 15; i <= 21; i++ ) { 
	String fontcolor = (i % 7 == 0 || i % 7 == 1)? "red" : "black";
	if (i % 7 == 0 || i % 7 == 1) { %>
		<td width="90"><font size="2" color=<%=fontcolor %>> <%=i%></font><br><br><br><br></td>
		<%} else {%>
		<td width="90">
		<font size="2" color=<%=fontcolor %>> <%=i%></font><br>
		<font size="2" id="9<%=i%>a">출석</font><br>
		<font size="2" id="9<%=i%>b">결석</font><br>
		<font size="2" id="9<%=i%>c">조퇴 / 지각</font>
		</td> 
<%}
}%>
</tr>

<tr height="30">
<%  for(int i = 22; i <= 28; i++ ) { 
	String fontcolor = (i % 7 == 0 || i % 7 == 1)? "red" : "black";
	if (i % 7 == 0 || i % 7 == 1) { %>
		<td width="90"><font size="2" color=<%=fontcolor %>> <%=i%></font><br><br><br><br></td>
		<%} else {%>
		<td width="90">
		<font size="2" color=<%=fontcolor %>> <%=i%></font><br>
		<font size="2" id="9<%=i%>a">출석</font><br>
		<font size="2" id="9<%=i%>b">결석</font><br>
		<font size="2" id="9<%=i%>c">조퇴 / 지각</font>
		</td> 
<%}
}%>
</tr>

<tr height="30">
<%  for(int i = 29; i <= 30; i++ ) { 
	String fontcolor = (i % 7 == 0 || i % 7 == 1)? "red" : "black";
	if (i % 7 == 0 || i % 7 == 1) { %>
		<td width="90"><font size="2" color=<%=fontcolor %>> <%=i%></font><br><br><br><br></td>
		<%} else {%>
		<td width="90">
		<font size="2" color=<%=fontcolor %>> <%=i%></font><br>
		<font size="2" id="9<%=i%>a">출석</font><br>
		<font size="2" id="9<%=i%>b">결석</font><br>
		<font size="2" id="9<%=i%>c">조퇴 / 지각</font>
		</td> 
	<%}
}%>
	<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</table><br>
</div>

<c:forEach var="a" items="${result }"> <!-- var 은 그냥 이름 items는 lists 란 모델을 가지고오겠다 from service -->
	
	<script>
	if("${a.attend}" == 'a') {
		document.getElementById("9"+"${a.day}"+"a").style.color="green";	
	}else if ("${a.attend}" == 'b') {
		document.getElementById("9"+"${a.day}"+"b").style.color="red";
	}else if("${a.attend}" == 'c')  {
		document.getElementById("9"+"${a.day}"+"c").style.color="blue";			
	}
	
	</script>
</c:forEach>

<c:set var="aa" value="0"/>
<c:set var="bb" value="0"/>
<c:set var="cc" value="0"/>
<c:forEach var="b" items="${result }">
	<c:choose>
		<c:when test="${b.attend == 'a'}">
			<c:set var="aa" value="${aa+1}"/>
		</c:when>
		<c:when test="${b.attend == 'b'}">
			<c:set var="bb" value="${bb+1}"/>
		</c:when>
		<c:when test="${b.attend == 'c'}">
			<c:set var="cc" value="${cc+1}"/>
		</c:when>
	</c:choose>
</c:forEach>
<c:set var="calculatec" value="${cc/3}"/>
<fmt:parseNumber var="realCalculC" value="${calculatec }" integerOnly="true"/>
<c:set var="realb" value="${bb*18000 }"/>
<c:set var="total" value="${360000}"/>
<c:set var="moneyc" value="${realCalculC*18000}"/>

<div style="order:2; margin-left: 50px; top: 0;">
<h1 style="font-size: 45px;">9월 출석</h1><br>

달 선택 : <select name="month" onchange="location = this.value;">
			<option>월</option>
			<option value="junCal_result">6월</option>
			<option value="julyCal_result">7월</option>
			<option value="augCal_result">8월</option>
			<option value="sepCal_result">9월</option>
			<option value="octCal_result">10월</option>
			<option value="novCal_result">11월</option>
			<option value="decCal_result">12월</option>
		</select><br><br>

출석 일수 : <c:out value="${aa}"/> <br>
결석 일수 : <c:out value="${bb}"/> <br>
지각/조퇴 일수  : <c:out value="${cc}"/> <br><br>
이번달 수당 : <c:out value="${total-realb-moneyc}"/> 원<br>
결석 차감액 : <c:out value="${realb}"/> 원<br>
지각/조퇴 차감액 : <c:out value="${moneyc }"/> 원<br><br>

<input type="button" value="출석체크" onclick="location.href='sepCal'"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="수정">
</div>
</div>
</div>
</form>

<jsp:include page="../default/footer.jsp"/>
</body>
</html>