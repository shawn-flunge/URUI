<%@page import="jspFinal.boardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jspFinal.boardDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page errorPage="errorPage.jsp" %>
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
<link href="./css/signin.css" rel="stylesheet">
    
<style>
body
{
	background-color: #94aac9;
}
table
{
	background-color: #f6f7f4;
}
h2
{
	color:#F6F7F4;
}
    
</style>



<script>

<%
String email = null;
if (session.getAttribute("email") != null) 
{
	email = (String) session.getAttribute("email");
}
else
{
	email = "null";
}

%>

function goTowrite() {
	
	var login = "<%=email%>";
	

	if(login != "null")
	{
		window.location.href="boardForm.jsp";
	}
	else
	{
		alert("로그인을 하세요");	
	}
	
}


</script>

</head>
<body>

<%
String type = request.getParameter("type");

String search = "";

if(request.getParameter("search")!=null)
{
	search = request.getParameter("search");
}

boardDAO dao = boardDAO.getInstance();
ArrayList<boardBean> listBean = dao.getList(type,search);




%>

<!-- Navigation -->
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



</header>






<div class="container">
	<h2><% if(type.equals("1")) out.print("Script"); else out.print("Style");  %></h2>
  	<p style="color:#F6D7D2;">The .table-responsive class creates a responsive table which will scroll horizontally on small devices (under 768px). When viewing on anything larger than 768px wide, there is no difference:</p>                                                                                      
  
  	<form action="search.jsp">
		<div class="form-group row">
			<div class="col-md-7">
 				<button type="button" class="form-control" style="width:20%;" onclick="javascript:goTowrite();">글올리기</button> 
 			</div>
 
 			<div class="col-md-1">
  				<select name="std" class="form">
    				<option value="">작성자</option>
    				<option value="학생">제목</option>
					</select>
			</div>
			<div class="col-md-3">
    			<input class="form-control" name="search" type="text">
  			</div>
  			<div class="col-md-1">
    			<input class="form-control" type="submit" value="검색">
  			</div>
  		</div>
  		<input type="hidden" name="type" value="<%= type %>">
  </form>
  
  
<div class="table-responsive">          
	<table class="table">
		<thead>
      		<tr>
        		<th>번호</th>
        		<th>제목</th>
        		<th>작성자</th>
        		<th>작성일</th>
			</tr>
		</thead>
    	<tbody>
    	<%
    	for(int i=0; i<listBean.size();i++)
    	{%>
    		
			<tr>
        		<td><%= listBean.get(i).getCode() %></td>
        		<td><a href="view.jsp?code=<%= listBean.get(i).getCode() %>&type=<%= type%>"><%= listBean.get(i).getTitle() %></a></td>
        		<td><%= listBean.get(i).getEmail() %></td>
        		<td><%= listBean.get(i).getWritingdate() %></td>
      		</tr>
    <%}%>
		</tbody>
	</table>
   
  
	</div>
</div>




</body>
</html>