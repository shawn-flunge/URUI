<%@page import="jspFinal.userBean"%>
<%@page import="jspFinal.logonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>   
    <% request.setCharacterEncoding("UTF-8"); %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>
<jsp:useBean id="user" class="jspFinal.userBean"/>
<jsp:setProperty property="email" name="user" param="email"/>
<jsp:setProperty property="pwd" name="user" param="pwd"/>
<jsp:setProperty property="name" name="user" param="name"/>
<jsp:setProperty property="cp" name="user" param="cp"/>

<%


logonBean bean = logonBean.getInstance();
bean.insertUser(user);

%>

<jsp:forward page="index.jsp"/>

</body>
</html>

