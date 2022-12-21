<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {background-color: cornflowerblue; display: inline-block;
		 padding: 50px;}
	body {background-color: aqua; text-align: center;}
	input {margin: 3px;}
	.input {width: 223px; height: 30px;}
	#login {width: 230px; height: 40px; background-color: khaki; border: none;}
	.button {height: 30px;}
</style>
</head>
<body>
	<div align=center>
		<h1>로그인</h1>
		<form action="checkID.jsp" method=post>
			<table>
				<tr>
					<td><input type=text placeholder="아이디" class=input name=id></td>
				</tr>
				<tr>
					<td><input type=password placeholder="비밀번호" class=input name=pw></td>
				</tr>
				<tr>
					<td><input type=submit value=로그인 id=login></td>
				</tr>
				<tr>
					<td><input type=reset value=다시입력 class=button>
					<input type=button value=처음으로 onclick="location.href='main.jsp'" class=button>
					<input type=button value=회원가입 onclick="location.href='joinForm.jsp'" class=button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>