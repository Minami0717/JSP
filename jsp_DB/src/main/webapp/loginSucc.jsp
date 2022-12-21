<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<input type=button value=로그아웃 onclick="location.href='loginForm.jsp'">
	<input type=button value=회원정보수정 onclick="location.href='updateForm.jsp'">
	<input type=button value=회원탈퇴 onclick=del()>
</body>
<script>
	function del() {
		if (confirm("정말로 탈퇴하시겠습니까?"))
			location.href="delete.jsp";
		else
			return;
	}
</script>
</html>