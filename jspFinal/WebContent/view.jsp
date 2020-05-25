<%@page import="jspFinal.replyBean"%>
<%@page import="jspFinal.replyDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jspFinal.fileBean"%>
<%@page import="jspFinal.fileDAO"%>
<%@page import="jspFinal.boardBean"%>
<%@page import="jspFinal.boardDAO"%>
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


<script>

<%
String email =(String)session.getAttribute("email");

if(email == null)
{
	email= "";
}

%>


function submitReply() {
	
	var login = "<%=email%>";
	
	if(login != "")
	{
		document.addreply.submit();
	}
	else
	{
		alert("로그인을 하세요");	
	}
	
	
}

function confirmDel(code, type){
	var con = confirm("삭제하시겠습니까?");
	
	if(con==true)
	{
		window.location.href="delete.jsp?code="+code+"&type="+type;	
	}
	
	
	
}




</script>

<style>
body
{
	background-color: #94aac9;
}
table
{
	background-color: #F2F5F6;
}
</style>

</head>
<body>

<%
String code = request.getParameter("code");
String type = request.getParameter("type");

boardDAO dao = boardDAO.getInstance();
boardBean bean = dao.getBean(code,type);

fileDAO fdao = fileDAO.getInstance();
fileBean fbean = fdao.getBean(code,type);
ArrayList<fileBean> list =fdao.getList(code,type);


replyDAO rdao = replyDAO.getInstance();
ArrayList<replyBean> Rlist = rdao.getList(code, type);

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
<br>
<br>
<br>
<br>


<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">글 보기 </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;"> 글 제목 </td>
					<td colspan="2"><%= bean.getTitle() %></td>
				</tr>
				<tr>
					<td>작성자</td>	
					<td colspan="2"><%= bean.getEmail() %></td>
				</tr>
				<tr>
					<td>작성일</td>	
					<td colspan="2"><%=bean.getWritingdate()%></td>
				</tr>
				<tr>
					<td>내용</td>	
					<td colspan="2" style="min-height: 200px; text-align: left;"><%= bean.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>")%></td>
				</tr>
				<tr>
					<td>자료</td>	
					<td colspan="2" style="min-height: 200px; text-align: left;">
					<%
					for(fileBean file:list)
					{
						out.print("<a href=\"" + request.getContextPath()+"/downloadAction?file="+
						URLEncoder.encode(file.getFileRealName(),"UTF-8") + "\">" + file.getFileName() +"</a><br>");
					}
					%>
					</td>
				</tr>		
			</tbody>
		</table>	
		<a href = "board.jsp?type=<%= type %>" class="btn btn-primary">목록</a>  
			<%
					if(email != null && email.equals(bean.getEmail())){
				%>
						<a href="update.jsp?code=<%= bean.getCode() %>&type=<%=type %>" class="btn btn-primary">수정</a>
						<button type="button" class="btn btn-primary" onclick="javascript:confirmDel(<%= bean.getCode() %>,<%=type %>)" >삭제</button> 
				<%					
					}
				%>
		</div>
		
		
		
		<form action="uploadReply.jsp" name="addreply">
			<div class="form-group row">
				<div class="col-md-2">
  					댓글 작성
				</div>
				<div class="col-md-9">
  					<textarea class="form-control" rows="3" name="comment"></textarea>
				</div>
				<div class="col-md-1">
  					<input type="button" value="작성" class="form-control" onclick="javascript:submitReply()">
				</div>
				<input type="hidden" name="type" value="<%= type %>">
				<input type="hidden" name="bcode" value="<%= code %>">
			</div>
		</form>
		
		
		 <div class="table-responsive">          
  			<table class="table">
				<thead>
      				<tr>
        				<th>작성자</th>
       					<th>내용</th>
        				<th>작성일</th>
      				</tr>
    			</thead>
    			<tbody>
    				<%
    					for(int i=0; i<Rlist.size();i++)
    				{%>
    		
    				<tr>
        				<td><%= Rlist.get(i).getEmail() %></td>
        				<td><%= Rlist.get(i).getComment().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></td>
        				<td><%= Rlist.get(i).getWritingdate() %></td>
      				</tr>
    			<%}%>
    			</tbody>
			</table>	
		</div>
</div>

		
</body>
</html>