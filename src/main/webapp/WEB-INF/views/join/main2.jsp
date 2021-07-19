<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
</head>
<body>
	<h1><strong>Welcome To Our Site ${joinRequest.client_id }!!</strong></h1>
	<a href="<c:url value='/dessertfarm.com' />">Back to Login</a>
</body>
</html>