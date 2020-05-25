<%@page import="jspFinal.logonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>    
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<jsp:useBean id="user" class="jspFinal.userBean" scope="session"/>

<jsp:setProperty property="email" name="user" param="email"/>
<jsp:setProperty property="pwd" name="user" param="pwd"/>


<%
	
	logonBean bean = logonBean.getInstance();
	String str = null;	

	if(bean.userCheck(user.getEmail(), user.getPwd()) == 1)
	{


		str = user.getEmail();
		session.setAttribute("email", str);
		response.sendRedirect("index.jsp");
		
	}
		
	else
	{
		%>

		<jsp:forward page="login.jsp">
			<jsp:param value="1" name="deny"/>
		</jsp:forward>

	<%	
	}
%>







