<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>board</title>
<script src="js/jquery.slim.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.bundle.min.js"></script>


<script>

function check(){
	
	if(document.input.title.value != "" && document.input.content.value != "")
	{
		document.input.submit();	
	}
	else
	{
		alert("제목과 내용은 필수입니다.");
	}
	
}


</script>
<style>

body
{
background-color:#96C7E7;

}

.container
{
color : #22344E;
}


</style>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
<div class="container">
    <a class="navbar-brand" href="index.jsp">URUI<small> </small></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        	<span class="navbar-toggler-icon"></span>
    	</button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
    	<ul class="navbar-nav ml-auto">
        	<li class="nav-item active">
          		<a class="nav-link" href="index.jsp">Home
               		<span class="sr-only">(current)</span>
              	</a>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="board.jsp?type=1">Script</a>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="board.jsp?type=2">Style</a>
        	</li>
         	<li class="nav-item">
<%
   if(session.getAttribute("email") == null)
   {
%>
      <a class="nav-link" href="login.jsp" >login</a>
<%
   }
   else
   {   
%>
      <a class="nav-link" href="userInfoAction.jsp" ><%= (String)session.getAttribute("email") %></a>
<%
   }
%>
        	</li>
      	</ul>
    </div>
</div>
</nav>


<%
	String type = request.getParameter("type"); 
 
%>

<br>
<br>
<br>
<br>



<div class="container">
	<h2>게시물 작성</h2>
  
	<form method="post" action="uploadAction.jsp" enctype="multipart/form-data" name="input">
		<div class="form-group">
     		title
      		<input type="text" class="form-control" name="title" placeholder="Enter email">
    	</div>
    	<div class="form-group">
     		content
      		<textarea class="form-control" name="content" placeholder="내용 입력" style="height:500px"></textarea>
    	</div>
    	<div class="form-group">
  			파일 : <input type="file" name="file1" class="btn btn-primary">
  		</div>
  		<div class="form-group">
  			파일 : <input type="file" name="file2" class="btn btn-primary">
  			</div>
  			<div class="form-group">
  			파일 : <input type="file" name="file3" class="btn btn-primary">
  		</div>
    	<input type="button" class="btn btn-primary btn-block" onclick="javascript:check()" value="작성">
  		<input type="hidden" name="type" value="<%= type %>">
  	</form>
</div>






</body>
</html>