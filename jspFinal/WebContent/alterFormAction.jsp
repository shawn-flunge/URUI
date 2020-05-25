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
</head>
<body>

<%

String email = (String)session.getAttribute("email");
userBean user = null;

logonBean bean = logonBean.getInstance();
user=bean.getUser(email);


if(session.getAttribute("pwd")==null){
	user.setPwd(user.getPwd());	
}
else
{
	user.setPwd((String)session.getAttribute("pwd"));
}


user.setName(request.getParameter("name"));
user.setCp(request.getParameter("cp"));

bean.updateUser(user);

session.removeAttribute("pwd");

out.print("<script>alert(\"회원정보가 변경되었습니다.\")</script>");
%>
<script>
	
	alert("회원정보가 변경 되었습니다.");
	window.location.href="alterForm.jsp";
</script>



</body>
</html>