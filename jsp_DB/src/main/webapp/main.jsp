<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html {opacity: 0; transition: 1s;}
	html:hover {opacity: 1;}
	input {width: 250px; height: 50px; background-color: lightcyan; border: none;}
</style>
</head>
<body>
	<h1>SNS 웹 개발</h1>
	<img src="japan.jpg" width=500><br><br>
	<input type=button value=로그인 onclick="location.href='loginForm.jsp'">
	<input type=button value=SNS등록 onclick="location.href='selectAll.jsp'">
</body>
</html>