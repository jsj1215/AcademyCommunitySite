<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>6월<br>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../default/header.jsp"/>
<form action="juntest">
<h1  class="brand" align="center">6월</h1>

<table width="630" cellpadding="2" cellspacing="0" border="2" align="center">
<tr height="30">
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">일</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">월</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">화</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">수</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">목</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">금</font></td>
  <td width="90" bgcolor="#CCCCC" align="center"><font size="2">토</font></td>
</tr>

<tr height="65">
	<td width="90" bgcolor="#FFFFFF">&nbsp;</td><td bgcolor="#FFFFFF">&nbsp;</td><td bgcolor="#FFFFFF">&nbsp;</td>
	<td bgcolor="#FFFFFF">&nbsp;</td><td bgcolor="#FFFFFF">&nbsp;</td><td bgcolor="#FFFFFF">&nbsp;</td>	
	<td width="90" bgcolor="#FFFFFF"><font size="2" color="red">1</font><br><br><br><br>
	</td>		
</tr>

<tr height="65">
<%  for(int i = 2; i <= 8; i++ ) { 
	String fontcolor = (i % 7 == 1 || i % 7 == 2)? "red" : "black";
	if (i % 7 == 1 || i % 7 == 2) { %>
		<td width="90" bgcolor="#FFFFFF"><font size="2"color=<%=fontcolor %>> <%=i%></font><br><br><br><br></td>
		<%} else {%>
		<td width="90" id="6<%=i%>" bgcolor="#FFFFFF">
		<font size="2" color=<%=fontcolor %>> <%=i%></font><br>
		<input type="radio" name="6<%=i%>" id="6<%=i%>a" value="a"><font size="2" id = "6<%=i%>aa">출석</font><br>
		<input type="radio" name="6<%=i%>" id="6<%=i%>b" value="b"><font size="2" id = "6<%=i%>bb">결석</font><br>
		<input type="radio" name="6<%=i%>" id="6<%=i%>c" value="c"><font size="2" id = "6<%=i%>cc">조퇴 / 지각</font>
		</td> 
	<%}
}%>

</tr>
<tr height="30">
<%  for(int i = 9; i <= 15; i++ ) { 
	String fontcolor = (i % 7 == 1 || i % 7 == 2)? "red" : "black";
	if (i % 7 == 1 || i % 7 == 2) { %>
	<td width="90" bgcolor="#FFFFFF"><font size="2" color=<%=fontcolor %>> <%=i%></font><br><br><br><br></td>
	<%} else {%>
	<td width="90" bgcolor="#FFFFFF">
	<font size="2" color=<%=fontcolor %>> <%=i%></font><br>
	<input type="radio" name="6<%=i%>" id="6<%=i%>a" value="a"><font size="2" id = "6<%=i%>aa">출석</font><br>
	<input type="radio" name="6<%=i%>" id="6<%=i%>b" value="b"><font size="2" id = "6<%=i%>bb">결석</font><br>
	<input type="radio" name="6<%=i%>" id="6<%=i%>c" value="c"><font size="2" id = "6<%=i%>cc">조퇴 / 지각</font>
	</td> 
<%}
}%>
</tr>
<tr height="30">
<%  for(int i = 16; i <= 22; i++ ) { 
	String fontcolor = (i % 7 == 1 || i % 7 == 2)? "red" : "black";
	if (i % 7 == 1 || i % 7 == 2) { %>
	<td width="90" bgcolor="#FFFFFF"><font size="2" color=<%=fontcolor %>> <%=i%></font><br><br><br><br></td>
	<%} else {%>
	<td width="90" bgcolor="#FFFFFF">
	<font size="2" color=<%=fontcolor %>> <%=i%></font><br>
	<input type="radio" name="6<%=i%>" id="6<%=i%>a" value="a"><font size="2" id = "6<%=i%>aa">출석</font><br>
	<input type="radio" name="6<%=i%>" id="6<%=i%>b" value="b"><font size="2" id = "6<%=i%>bb">결석</font><br>
	<input type="radio" name="6<%=i%>" id="6<%=i%>c" value="c"><font size="2" id = "6<%=i%>cc">조퇴 / 지각</font>
	</td> 
<%}
}%>
</tr>
<tr height="30">
<%  for(int i = 23; i <= 29; i++ ) { 
	String fontcolor = (i % 7 == 1 || i % 7 == 2)? "red" : "black";
		if (i % 7 == 1 || i % 7 == 2) { %>
		<td width="90" bgcolor="#FFFFFF"><font size="2" color=<%=fontcolor %>> <%=i%></font><br><br><br><br></td>
		<%} else {%>
		<td width="90" bgcolor="#FFFFFF">
		<font size="2" color=<%=fontcolor %>> <%=i%></font><br>
		<input type="radio" name="6<%=i%>" id="6<%=i%>a" value="a"><font size="2" id = "6<%=i%>aa">출석</font><br>
		<input type="radio" name="6<%=i%>" id="6<%=i%>b" value="b"><font size="2" id = "6<%=i%>bb">결석</font><br>
		<input type="radio" name="6<%=i%>" id="6<%=i%>c" value="c"><font size="2" id = "6<%=i%>cc">조퇴 / 지각</font>
		</td> 
	<%}
	}%>
</tr>
<tr height="76">
	<td bgcolor="#FFFFFF"><font size="2" color="red">30<br><br><br><br></font></td>
	<td bgcolor="#FFFFFF">&nbsp;</td><td bgcolor="#FFFFFF">&nbsp;</td><td bgcolor="#FFFFFF">&nbsp;</td>
	<td bgcolor="#FFFFFF">&nbsp;</td><td bgcolor="#FFFFFF">&nbsp;</td><td bgcolor="#FFFFFF">&nbsp;</td>	
			
</tr>
</table><br>
<div align="center">
<input type="submit" value="전송">
</div>
</form>

<c:forEach var="a" items="${result }"> <!-- var 은 그냥 이름 items는 lists 란 모델을 가지고오겠다 from service -->
	<script>
	if("${a.attend}" == 'a') {
		document.getElementById("6"+"${a.day}"+"a").disabled = true;	
		document.getElementById("6"+"${a.day}"+"b").disabled = true;
		document.getElementById("6"+"${a.day}"+"c").disabled = true;
		document.getElementById("6"+"${a.day}"+"aa").style.color="red";	
	}else if ("${a.attend}" == 'b') {
		document.getElementById("6"+"${a.day}"+"a").disabled = true;
		document.getElementById("6"+"${a.day}"+"b").disabled = true;
		document.getElementById("6"+"${a.day}"+"c").disabled = true;
		document.getElementById("6"+"${a.day}"+"bb").style.color="red";	
	}else if("${a.attend}" == 'c')  {
		document.getElementById("6"+"${a.day}"+"a").disabled = true;
		document.getElementById("6"+"${a.day}"+"b").disabled = true;
		document.getElementById("6"+"${a.day}"+"c").disabled = true;
		document.getElementById("6"+"${a.day}"+"cc").style.color="red";	
	}
	</script>
</c:forEach>

<jsp:include page="../default/footer.jsp"/>
</body>
</html>