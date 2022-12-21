<%@page import="friend.ReplyDao"%>
<%@page import="friend.Reply"%>
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
</head>
<body>
	<table>
		<tr>
			<th>아이디<th>비밀번호<th>이름<th>나이<th>직업
		</tr>
		<%
		for (Friend friend : list) {
			String getId = friend.getId();
		%><tr>
			<td><%= friend.getId()%>
			<td><%= friend.getPw()%>
			<td><%= friend.getName()%>
			<td><%= friend.getAge()%>
			<td><%= friend.getJob()%>
		</tr>
		<%
			String boardId = request.getParameter("uid");
			if (getId.equals(boardId)) {
				List<Reply> replyList = ReplyDao.getInstance().selectAll();
				for (Reply reply : replyList) {
				%><tr>
					<td><%= reply.getIndex()%>번째 댓글
					<td><%= reply.getId()%>
					<td colspan=3><%= reply.getContents()%>
				</tr>
				<%
				}
				%>
				<tr>
					<td colspan=5><form action=appendReply.jsp method=post>
						<input type=hidden value=<%=getId %> id=replyId>
						<input type=hidden>
						<input type=text placeholder=댓글 id=reply>
						<input type=submit value=댓글등록>
					</form>
				</tr>
				<%
			}
		}
		%>
	</table>
</body>
</html>