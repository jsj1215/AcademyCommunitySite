<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta content="charset=UTF-8">
<title>Insert title here</title>
</head>
<body>9월 수정<br>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../default/header.jsp"/>
<h1  class="brand" align="center">9월</h1>
<form action="sepupdate">
<div align="center">

<table width="630" cellpadding="2" cellspacing="0" border="1" align="center" style="background-color: white;">
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
		<input type="radio" name="09<%=i%>" value="a"><font size="2">출석</font><br>
		<input type="radio" name="09<%=i%>" value="b"><font size="2">결석</font><br>
		<input type="radio" name="09<%=i%>" value="c"><font size="2">조퇴 / 지각</font>
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
	<input type="radio" name="9<%=i%>" value="a"><font size="2" id ="9<%=i%>aa">출석</font><br>
	<input type="radio" name="9<%=i%>" value="b"><font size="2" id ="9<%=i%>bb">결석</font><br>
	<input type="radio" name="9<%=i%>" value="c"><font size="2" id ="9<%=i%>cc">조퇴 / 지각</font>
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
	<input type="radio" name="9<%=i%>" value="a"><font size="2" id ="9<%=i%>aa">출석</font><br>
	<input type="radio" name="9<%=i%>" value="b"><font size="2" id ="9<%=i%>bb">결석</font><br>
	<input type="radio" name="9<%=i%>" value="c"><font size="2" id ="9<%=i%>cc">조퇴 / 지각</font>
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
	<input type="radio" name="9<%=i%>" value="a"><font size="2" id ="9<%=i%>aa">출석</font><br>
	<input type="radio" name="9<%=i%>" value="b"><font size="2" id ="9<%=i%>bb">결석</font><br>
	<input type="radio" name="9<%=i%>" value="c"><font size="2" id ="9<%=i%>cc">조퇴 / 지각</font>
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
		<input type="radio" name="9<%=i%>" value="a"><font size="2" id ="9<%=i%>aa">출석</font><br>
		<input type="radio" name="9<%=i%>" value="b"><font size="2" id ="9<%=i%>bb">결석</font><br>
		<input type="radio" name="9<%=i%>" value="c"><font size="2" id ="9<%=i%>cc">조퇴 / 지각</font>
		</td> 
	<%}
}%>
	<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</table><br>
<div align="center">
<input type="submit" value="전송">
</div>
</form>

<c:forEach var="a" items="${result }"> <!-- var 은 그냥 이름 items는 lists 란 모델을 가지고오겠다 from service -->
	<script>
	if("${a.attend}" == 'a') {
		document.getElementById("9"+"${a.day}"+"aa").style.color="red";	
	}else if ("${a.attend}" == 'b') {
		document.getElementById("9"+"${a.day}"+"bb").style.color="red";	
	}else if("${a.attend}" == 'c')  {
		document.getElementById("9"+"${a.day}"+"cc").style.color="red";	
	}
	</script>
</c:forEach>

<jsp:include page="../default/footer.jsp"/>
</body>
</html>