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
	function acceptEmail() 
	{
		opener.document.userInfo.email.value = document.check.email.value;
		opener.document.userInfo.confirmok.value = "1";
		window.close();

	}
	

</script>




</head>
<body >

<%
String str1 =request.getParameter("confirm");	
if(str1 == null)
{
	str1 = "3";
}
%>



<div class="container">
  <h2 align=center>중복 확인</h2>
   <% if(str1.equals("1") || str1.equals("3")) {
	   
		if(str1.equals("1"))out.print("<p align=center>이미존재하는 email입니다.</p>");
	%>
    	<form class="form-signin" action="confirmAction.jsp" name="check">
  
   		 	<div class="form-group">
     	 		Email:     <br><br>
     	 		<input type="email" class="form-control" name="email" placeholder="Enter email"  required autofocus>
			</div>
    		<input type="submit" value="중복확인" class="btn btn-sm btn-primary btn-block">
  		</form>
 
    	<%
	 }
   else if(str1.equals("2"))
   {%>
	   <p align=center><%=request.getParameter("email") %>은 사용가능한 email입니다.</p>
		<form class="form-signin" action="confirmAction.jsp" name="check">
  
	    	<div class="form-group">
				Email:
     	 		<input type="email" class="form-control" name="email" placeholder="Enter email" value="<%=request.getParameter("email") %>" required autofocus>
			</div>
    
  		 	<input type="button" class="btn btn-sm btn-primary btn-block" value="사용" onclick="javascript:acceptEmail()">
  		</form>
	   
	   <%
   }
  	%>
  
</div>


</body>
</html>