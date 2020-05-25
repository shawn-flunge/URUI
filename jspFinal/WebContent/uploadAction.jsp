<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="jspFinal.boardBean"%>
<%@page import="java.io.File"%>
<%@page import="jspFinal.boardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>    
    <% response.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%

String directory = application.getRealPath("/upload/");
int maxSize = 1024*1024*10;
String encoding = "UTF-8";

MultipartRequest mpr = new MultipartRequest(request, directory, maxSize,encoding, new DefaultFileRenamePolicy());

String type = mpr.getParameter("type"); 
	
String title = mpr.getParameter("title");
String email = (String)session.getAttribute("email");
String content = mpr.getParameter("content");



boardDAO dao = boardDAO.getInstance();
boardBean bean = new boardBean();
bean.setTitle(title);
bean.setEmail(email);
bean.setContent(content);

dao.upload(bean,type);

int code = dao.getCode(title,type);

Enumeration filenames = mpr.getFileNames();

while(filenames.hasMoreElements()){
	
	String param = (String)filenames.nextElement();
	String fileName = mpr.getOriginalFileName(param);
	String fileRealName = mpr.getFilesystemName(param);

	if(fileName==null)
		continue;
	if(!fileName.endsWith(".html") && !fileName.endsWith(".js") && !fileName.endsWith(".css") && !fileName.endsWith(".txt") && !fileName.endsWith(".zip") )
	{
		File file = new File(directory, fileRealName);
		file.delete();
		out.print("업로드할 수 없는 확장자입니다.");
	}
	else
	{
		dao.uploadFile(code,fileName, fileRealName,type);
	}

}
response.sendRedirect("board.jsp?type="+type);
%>


</body>
</html>