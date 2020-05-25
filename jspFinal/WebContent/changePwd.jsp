<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script> 

function check() {  
     
	if(document.name.nowPwd.value==""||document.name.pwd.value==""||document.name.pwdck.value=="")
    {
        alert("필수입력란을 입력하세요");
    }
	else
	{
		document.name.submit();
		
	}
	
}

</script>





</head>
<body>
<%
String str = (String)session.getAttribute("email");

String str1 =request.getParameter("deny");	
if(str1 == null)
{
	str1 = "3";
}
%>




<div class="container">
	<h2 align=center>비밀번호 변경</h2>
  	<% if(str1.equals("1")) {
		out.print("<p align=center>현재 비밀번호가 틀렸습니다.</p>");
	}
  	else if(str1.equals("2"))
  	{
  		out.print("<p align=center>비밀번호가 일치하지 않습니다.</p>");
  	}
  	%>
	<form class="form-signin" action="changePwdAction.jsp" name="name">
    	<div class="form-group">
			현재 비밀번호
      		<input type="password" class="form-control" name="nowPwd">
    	</div>
    	<div class="form-group">
      		바꿀 비밀번호
      		<input type="password" class="form-control" name="pwd">
    	</div>
    	<div class="form-group">
			비밀번호 확인
      	<input type="password" class="form-control" name="pwdck">
    	</div>
		<button class="btn btn-sm btn-primary btn-block"  onclick="javascript:check()">변경</button>
  	</form>
</div>




</body>
</html>