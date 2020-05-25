<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
String str =null;
str=(String)session.getAttribute("email");	

%>

<jsp:forward page="userInfo.jsp">
	<jsp:param value="<%= str %>" name="email"/>
</jsp:forward>



</body>
</html>