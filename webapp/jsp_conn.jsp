<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr>
			<th>번호<th>이름<th>나이<th>직업
		</th>
<%
	String driver = "com.mysql.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/friend";
	Connection conn = null;

	try {
		Class.forName(driver);
		//out.println("MySQL 드라이버 검색 성공...");
	} catch (ClassNotFoundException e) {
		out.println("MySQL 드라이버 검색 오류");
	}
	
	try {
		conn = DriverManager.getConnection(dbURL, user, pass);
		//out.println("MySQL 연결 성공...\n");
	} catch (SQLException e) {
		out.println("MySQL 연결 객체 생성 실패" + e);
	}
	
	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM custmer01");
	ResultSet rs = pstmt.executeQuery();
	
	while (rs.next()) {
		int id = rs.getInt(1);
		String name = rs.getString(2);
		String age = rs.getString(3);
		String job = rs.getString(4); %>
		<tr>
			<td><%=id %><td><%=name %><td><%=age %><td><%=job %>
<% 		//out.println(id + " " + name + " " + age + " " + job);
	}
%>
	</table>
</body>
</html>