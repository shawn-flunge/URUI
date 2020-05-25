<%@page import="jspFinal.boardBean"%>
<%@page import="jspFinal.boardDAO"%>
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
String code= request.getParameter("code");
String type= request.getParameter("type");
int code1 = Integer.parseInt(code);

boardDAO dao = boardDAO.getInstance();
dao.delete(code1,type);

response.sendRedirect("board.jsp?type="+type);


%>




</body>
</html>