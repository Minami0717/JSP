<%@page import="friend.ReplyDao"%>
<%@page import="friend.Reply"%>
<%@page import="friend.PostDao"%>
<%@page import="friend.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	Integer idx = Integer.parseInt(request.getParameter("idx"));
	String nick = request.getParameter("nickname");
	String pw = request.getParameter("pw");
	String text = request.getParameter("text");

	Post post = PostDao.getInstance().select(idx);
	post.setHits(post.getHits()+1);
	PostDao.getInstance().update(post);
	
	if (!nick.isEmpty()) {
		Reply reply = new Reply();
		reply.setNickname(nick);
		reply.setContents(text);
		reply.setPost_idx(idx);
		
		ReplyDao.getInstance().insert(reply);
	}
	
	List<Post> list = PostDao.getInstance().selectAll();
	List<Reply> replies = ReplyDao.getInstance().selectAll();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#post {width: 100%; height: 500px;
	border-top: 2px solid #3b4890; padding: 10px; position: relative;}
	table {width: 100%; text-align: center;}
	th {border-bottom: 1px solid #3b4890; border-top: 2px solid #3b4890;}
	td {border-bottom: 1px solid gainsboro;}
	a {text-decoration: none; color: black;}
	#rec {border: 1px solid gainsboro; width: 300px;
	height: 100px; text-align: center; position: absolute;
	bottom: 100px; left: 40%;}
	input[type=button] {margin-top: 40px;}
	input[type=text],input[type=password] {height: 30px;}
	input[type=text] {margin-bottom: 5px;}
	#comment {border-top: 2px solid #3b4890; padding: 10px;}
	#np {display: inline-block;}
	#np input {width: 120px;}
	.left {text-align: left;}
	#reply {margin-bottom: 50px; border-bottom: 2px solid #3b4890;}
	#text {padding: 10px;}
	#text div:last-child {clear: both;}
	#ta {float: right;}
</style>
</head>
<body>
	<div id=post>
		<b><%=post.getTitle() %></b><br>
		<%=post.getWriter() %> | <%=post.getDate() %><hr>
		<%=post.getContent() %>
		<div id=rec>
			<%=post.getRecommend() %> <input type=button value=추천>
			<input type=button value=비추> <%=post.getRecommend() %>
		</div>
	</div>
	<div id=reply>
		<p>전체 댓글
		<div id=comment>
			<%
				for (Reply r : replies) {
					if (r.getPost_idx() == idx) {
						%>
						<div id=table>
							<table>
								<tr>
									<td class=left><%=r.getNickname() %>
									<td class=left><%=r.getContents() %>
							</table>
						</div>
						<%
					}
				}
			%>
			<div id=text>
				<form action="result.jsp" method=post>
					<div id=np>
						<input type="hidden" name=idx value=<%=idx%>>
						<input type=text placeholder=닉네임 name=nickname><br>
						<input type=password placeholder=비밀번호 name=pw>
					</div>
					<div id=ta>
						<textarea rows="8" cols="100" name=text></textarea>
					</div>
					<div align=right><input type=submit value=등록></div>
				</form>
			</div>
		</div>
	</div>
	<table>
		<tr>
			<th width=50px>번호
			<th>제목
			<th width=50px>글쓴이
			<th width=100px>작성일
			<th width=50px>조회
			<th width=50px>추천
		</tr>
	<%
		for(Post p : list) {
			%><tr>
				<td><%=p.getIdx() %>
				<td class=left><a href="result.jsp?idx=<%=p.getIdx() %>"><%=p.getTitle() %></a>
				<td><%=p.getWriter() %>
				<td><%=p.getDate().substring(11,16) %>
				<td><%=p.getHits() %>
				<td><%=p.getRecommend() %><%
		}
	%>
	</table>
</body>
</html>