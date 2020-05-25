<%@page import="jspFinal.logonBean"%>
<%@page import="jspFinal.userBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="js/jquery.slim.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.bundle.min.js"></script>
<link href="./css/signin.css" rel="stylesheet">


</head>
<body>


<%

String email = request.getParameter("email");
userBean user = null;

logonBean bean = logonBean.getInstance();
if(bean.confirmEmail(email)==1)
{
%>
	
	<jsp:forward page="confirm.jsp">
		<jsp:param value="1" name="confirm"/>
	</jsp:forward>
	<%
}
else
{
%>
	
	<jsp:forward page="confirm.jsp">
		<jsp:param value="2" name="confirm"/>
		<jsp:param value="<%=email %>" name="email"/>
	</jsp:forward>
	<%
	
}

%>


</body>
</html>