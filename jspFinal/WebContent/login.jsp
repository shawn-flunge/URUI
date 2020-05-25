<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="./css/bootstrap.min.css" rel="stylesheet" >
<link href="./css/signin.css" rel="stylesheet">

</head>



<body class="text-center">

<%
String str =request.getParameter("deny");	

	if(str == null)
	{
		str = "2";
	}
	
%>

<form class="form-signin" action="loginAction.jsp" method="post">
    <h1>URUI</h1>
    <% if(str.equals("1")) {
    	out.print("<p>아이디 혹은 비밀번호가 틀렸습니다.</p>");
	 } %>
	<br>
      
	<input type="text" name="email" class="form-control" placeholder="아이디" required autofocus>
      
	<input type="password" name="pwd" class="form-control" placeholder="비밀번호" required>
	<a href="join.jsp">회원가입</a>
	<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      
	<p class="mt-5 mb-3 text-muted">&copy; 2019-2022</p>
</form>
</body>
</html>