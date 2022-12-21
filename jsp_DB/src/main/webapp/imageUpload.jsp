<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uploadPath = request.getRealPath("img");
	int size = 10*1024*1024;
	String name = "";
	String subject = "";
	String fileName = "";
	
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size,
				"utf-8", new DefaultFileRenamePolicy());
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();
		fileName = multi.getFilesystemName(file);
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	올린 사람 : <%=name %><br>
	제목 : <%=subject %><br>
	파일명 : <a href="img/<%=fileName %>"><%=fileName %></a><br>
</body>
</html>