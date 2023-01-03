<%@page import="mall.CartDao"%>
<%@page import="mall.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	List<Cart> list = CartDao.getInstance().selectAll();
	int total = 0;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#title {background: #C3B091; height: 70px; padding: 100px;}
	.center {text-align: center;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>장바구니</h1></div>
	<table border=1>
		<tr>
			<th>상품<th>가격<th>수량<th>소계<th>비고
		<%
			for (Cart c : list) {
				total += c.getPrice();
				%><tr>
					<td><%=c.getProduct() %>
					<td><%=c.getPrice() %>
					<td><%=c.getCount() %>
					<td><%=c.getPrice()*c.getCount() %>
					<td>삭제<%
			}
		%>
		<tr>
			<td><td><td>총액<td><%=total %>
	</table>
</body>
</html>