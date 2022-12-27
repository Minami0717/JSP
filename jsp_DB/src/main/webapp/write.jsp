<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="upload.jsp" method=post>
		<input type=text placeholder=제목 name=title><br><br>
		<textarea rows="10" cols="50" placeholder=내용 name=content></textarea><br>
		<input type=submit value=작성>
	</form>
</body>
</html>