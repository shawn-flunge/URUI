<%@page import="java.util.ArrayList"%>
<%@page import="jspFinal.fileBean"%>
<%@page import="jspFinal.fileDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="jspFinal.boardBean"%>
<%@page import="jspFinal.boardDAO"%>
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

</head>
<body>


<%
String code=request.getParameter("code");
String type=request.getParameter("type");

boardDAO dao = boardDAO.getInstance();
boardBean bean = dao.getBean(code,type);

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
	<h2>게시물 수정</h2>
  
  	<form method="post" action="updateAction.jsp">
    	<div class="form-group">
     		title
      		<input type="text" class="form-control" name="title" placeholder="Enter email" value="<%= bean.getTitle() %>">
    	</div>
    	<div class="form-group">
     		content
      		<textarea class="form-control" name="content" placeholder="내용 입력" style="height:500px"><%= bean.getContent() %></textarea>
    	</div>

    	<button type="submit" class="btn btn-primary btn-block">Submit</button>
  		<input type="hidden" name="type" value="<%= type %>">
  		<input type="hidden" name="code" value="<%= code %>">
  	</form>
</div>




</body>
</html>