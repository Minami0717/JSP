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
	#join {width: 230px; height: 40px; background-color: khaki; border: none;}
	.button {width: 110px; height: 30px;}
</style>
</head>
<body>
	<div align=center>
		<h1>회원가입</h1>
		<form action="join.jsp" method=post>
			<table>
				<tr>
					<td><input type=text placeholder="아이디" class=input name=id></td>
				</tr>
				<tr>
					<td><input type=password placeholder="비밀번호" class=input name=pw></td>
				</tr>
				<tr>
					<td><input type=password placeholder="비밀번호확인" class=input name=pwCheck></td>
				</tr>
				<tr>
					<td><input type=text placeholder="이름" class=input name=name></td>
				</tr>
				<tr>
					<td><input type="number" placeholder="나이" class=input name=age></td>
				</tr>
				<tr>
					<td><input type=text placeholder="직업" class=input name=job></td>
				</tr>
				<tr>
					<td><input type=submit value=회원가입 id=join></td>
				</tr>
				<tr>
					<td><input type=reset value=다시입력 class=button>
					<input type=button value=이전 onclick="location.href='loginForm.jsp'" class=button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>