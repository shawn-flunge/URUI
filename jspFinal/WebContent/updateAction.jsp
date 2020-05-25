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
String code=request.getParameter("code");
int code1 = Integer.parseInt(code);
String type=request.getParameter("type");

String title = request.getParameter("title");
String content = request.getParameter("content");


boardDAO dao = boardDAO.getInstance();
boardBean bean = new boardBean();

bean.setCode(code1);
bean.setTitle(title);
bean.setContent(content);

dao.update(bean, type);

response.sendRedirect("board.jsp?type="+type);

%>




</body>
</html>