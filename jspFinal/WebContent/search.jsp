<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
String std = request.getParameter("std");
String search = request.getParameter("search");

String type = request.getParameter("type");

String result ="";

if(std.equals("작성자"))
{
	result = "1";
}
else
{
	result = "2";
}

result += search;

response.sendRedirect("board.jsp?search="+result+"&type="+type);

%>


</body>
</html>