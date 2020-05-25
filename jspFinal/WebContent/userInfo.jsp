<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Insert title here</title>

 <script src="js/jquery.slim.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/bootstrap.bundle.min.js"></script>
        
<style>
body 
{
	padding-top: 56px;
	background-color: #3a3c58;
}
h1
{
	color:#F6F7DD;
} 
        
</style>
        
        
</head>
<body>

<%
String str = null;
str = request.getParameter("email");
%>

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



<div class="container">
	<div class="row">
		<div class="col-md-8">
        	<h1 class="my-4">회원 개인 정보
				<small>Secondary Text</small>
        	</h1>
        	<iframe src="alterForm.jsp" name="frame_target" style="width:100%; height:600px; border:none; " ></iframe>
      	</div>
      	<div class="col-md-4">
        	<div class="card my-4">
          		<h5 class="card-header">개인 정보</h5>
          			<div class="card-body">
            			<div class="row">
              				<div class="col-lg-6">
                				<ul class="list-unstyled mb-0">
                  					<li>
                    					<a href="alterForm.jsp" target="frame_target">정보 변경</a>
                  					</li>
                  					<li>
                    					<a href="logout.jsp" >로그 아웃</a>
                  					</li>
                				</ul>
              				</div>
            			</div>
          			</div>
        		</div>
			<div class="card my-4">
          		<h5 class="card-header">Categories</h5>
          			<div class="card-body">
            			<div class="row">
              				<div class="col-lg-6">
         						<h1>       
                					광<br>
                					고
                				</h1>
              				</div>
						</div>
          			</div>
        	</div>
		 </div>
    </div>
</div>
<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; URUI</p>
    </div>
</footer>





</body>
</html>