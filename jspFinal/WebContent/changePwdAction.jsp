<%@page import="jspFinal.logonBean"%>
<%@page import="jspFinal.userBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>


</head>
<body>

<%
String nowPwd = request.getParameter("nowPwd");
String pwd = request.getParameter("pwd");
String pwdck = request.getParameter("pwdck");


String email = (String)session.getAttribute("email");
userBean user = null;

logonBean bean = logonBean.getInstance();
user=bean.getUser(email);


if(! user.getPwd().equals(nowPwd))
{
	%>

	<jsp:forward page="changePwd.jsp">
		<jsp:param value="1" name="deny"/>
	</jsp:forward>

<%	
}
else if( !pwd.equals(pwdck) )
{
	%>

	<jsp:forward page="changePwd.jsp">
		<jsp:param value="2" name="deny"/>
	</jsp:forward>

<%	
}
else
{
	session.setAttribute("pwd", pwd);
	out.print("<script>window.close()</script>");
}

%>



</body>
</html>