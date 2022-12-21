<%@page import="friend.FriendDao"%>
<%@page import="friend.Friend"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	List<Friend> list = FriendDao.getInstance().selectAll();
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {text-align: center}
</style>
</head>
<body>
	<table>
		<tr>
			<th>아이디<th>비밀번호<th>이름<th>나이<th>직업
		</tr>
		<%
		for (Friend friend : list) {
		%><tr>
			<td><%= friend.getId()%>
			<td><%= friend.getPw()%>
			<td><%= friend.getName()%>
			<td><%= friend.getAge()%>
			<td><%= friend.getJob()%>
			<td><input type=button
			onclick="location.href='replyForm.jsp?uid=<%=friend.getId()%>'" value=댓글>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>