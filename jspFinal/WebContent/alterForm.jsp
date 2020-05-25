<%@page import="jspFinal.userBean"%>
<%@page import="jspFinal.logonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script src="js/jquery.slim.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.bundle.min.js"></script>
<link href="./css/signin.css" rel="stylesheet">

<style>
body
{
	background-color: white;
}

</style>

<script>

	function openCk()
	{
		window.name="ckForm";
		window.open("changePwd.jsp","check","width=500, height=400");
	}


</script>


</head>
<body>

<%

String email = (String)session.getAttribute("email");
userBean user = null;

logonBean bean = logonBean.getInstance();
user=bean.getUser(email);


%>



<div class="container">
	<h2 align=center>정보 변경</h2>
  
  	<form class="form-signin" action="alterFormAction.jsp" >
    	<div class="form-group">
     		Email:
      		<input type="email" class="form-control" name="email" value="<%= user.getEmail() %>"  readonly>
    	</div>
    	<div class="form-group">
      		<input type="button" class="btn btn-sm btn-primary btn-block" value="비밀번호 변경" onclick="javascript:openCk()">
    	</div>
   
    	<div class="form-group">
      		name:
      		<input type="text" class="form-control" name="name" value="<%= user.getName() %>">
    	</div>
    
    	<div class="form-group">
			cell phone:
      		<input type="text" class="form-control" name="cp" value="<%= user.getCp() %>">
    	</div>
    
    	<button class="btn btn-sm btn-primary btn-block" type="submit">변경</button>
  	</form>
</div>


</body>
</html>