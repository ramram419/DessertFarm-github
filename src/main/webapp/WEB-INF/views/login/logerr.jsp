<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post">
		<h1 class="title">Wrong ID!!</h1>
		<a href="<c:url value='/login' />">Back to Login</a>
		<a href="<c:url value='/joinForm' />">Join Us</a>
	</form>
</body>
</html>