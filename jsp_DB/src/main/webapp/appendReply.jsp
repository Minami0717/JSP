<%@page import="friend.ReplyDao"%>
<%@page import="friend.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String replyId = request.getParameter("replyId");
	String comment = request.getParameter("reply");
	
	Reply reply = new Reply();
	reply.setId(replyId);
	reply.setContents(comment);
	
	int result = ReplyDao.getInstance().insert(reply);
	if(result != 0)
		response.sendRedirect("replyForm.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>