<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>

<% request.setCharacterEncoding("UTF-8");  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>URUI</title>

<script src="js/jquery.slim.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.bundle.min.js"></script>

<style>
        
.carousel-item 
{
	height: 65vh;
	min-height: 350px;
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
        
.jumbotron
{
	background-color: #94aac9;
}
           
        
body
{
	background-color: #EAEFF2
} 
          
           
</style>


</head>
<body>

<jsp:useBean id="user" class="jspFinal.userBean" />
<jsp:setProperty property="email" name="user" param="email"/>


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


<header>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
     		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    	</ol>
<div class="carousel-inner" role="listbox">
      <div class="carousel-item active" style="background-image:url(./imgs/33333.JPG) ">
        	<div class="carousel-caption d-none d-md-block">
          		<h3 class="display-4">Script</h3>
          			<p class="lead">javascript, html etc</p>
        	</div>
      </div>
      
      <div class="carousel-item" style="background-image: url(./imgs/321.JPG)">
        	<div class="carousel-caption d-none d-md-block">
          		<h3 class="display-4">Style</h3>
          			<p class="lead">css, design etc</p>
        	</div>
      </div>
      
      <div class="carousel-item" style="background-image:url(./imgs/1111.JPG)">
        	<div class="carousel-caption d-none d-md-block">
          		<h3 class="display-4">For you</h3>
          			<p class="lead">beginner</p>
        	</div>
      </div>
</div>
	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>
</header>



<!-- Page Content -->
<section class="py-5">
	<div class="container">
    	<h1 class="font-weight-light">URUI <small>for beginner</small> </h1>
    	<p class="lead"> 웹 디자인이 부족한 초보 개발자와 기능 구현이 힘든 초보 디자이너를 위한 공간을 제공하고 있습니다. </p>
  	</div>
</section>
        
        
        
<div class="container">
<div class="row">
	<div class="jumbotron col-sm-5">
		<h1>URUI</h1>      
			<p>script, css for beginner</p>
	</div>
	<div class="col-md-1">
	  
	</div>
	<div class="col-md-6 ">
		<img src="imgs/r.jpg" class="img-rounded" width="500" height="380">
	</div>
</div> 

</div>
        
<iframe src="./index_bottom.jsp" width=100% height="1000px" frameborder="0" scrolling="no" seamless></iframe>


</body>
</html>