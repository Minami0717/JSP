<%@page import="friend.Friend"%>
<%@page import="friend.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String inputId = request.getParameter("id");
	String inputPw = request.getParameter("pw");
	
	if(inputId.isEmpty()) {
		%><script>alert("아이디를 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	if(inputPw.isEmpty()) {
		%><script>alert("비밀번호를 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	Friend friend = FriendDao.getInstance().select(inputId);
	
	String id = friend.getId();
	String pw = friend.getPw();
	String name = friend.getName();
	String age = friend.getAge();
	String job = friend.getJob();
	
	if(inputId.equals(id) && inputPw.equals(pw)) {
		/* response.addCookie(new Cookie("id", id));
		response.addCookie(new Cookie("pw", pw));
		response.addCookie(new Cookie("name", name));
		response.addCookie(new Cookie("age", age));
		response.addCookie(new Cookie("job", job)); */
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setAttribute("name", name);
		session.setAttribute("age", age);
		session.setAttribute("job", job);
		response.sendRedirect("loginSucc.jsp");
	}
	else {
		%><script>alert("아이디나 비밀번호가 틀립니다."); history.go(-1)</script><%
		return;
	}
%>
</body>
</html>