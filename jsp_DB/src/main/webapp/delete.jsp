<%@page import="friend.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Cookie[] cookies = request.getCookies();
%>
<%!
	private String getCookieValue(Cookie[] cookies, String name) {
	String value = null;
	if (cookies == null)
		return null;
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals(name))
			return cookie.getValue();
	}
	return null;
}
%>
<%	
	String id = getCookieValue(cookies, "id");
	int result = FriendDao.getInstance().delete(id);
	if(result != 0) {
		%><script>
			alert("탈퇴가 완료되었습니다.");
			location.href="main.jsp";
		</script><%
	}
	else {
		%><script>alert("탈퇴실패"); history.back();</script><%
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>