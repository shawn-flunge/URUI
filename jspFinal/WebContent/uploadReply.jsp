<%@page import="jspFinal.replyDAO"%>
<%@page import="jspFinal.replyBean"%>
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
String type = request.getParameter("type");
String comment = request.getParameter("comment");
String bcode = request.getParameter("bcode");
String email = (String)session.getAttribute("email");

replyBean bean = new replyBean();
bean.setBcode(bcode);
bean.setComment(comment);
bean.setEmail(email);

replyDAO dao = replyDAO.getInstance();
dao.upload(bean, type);

response.sendRedirect("view.jsp?code="+bcode+"&type="+type);

%>

</body>
</html>