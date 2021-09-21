<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>DessertFarm</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   	<link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   	<link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<c:import url="../home/top.jsp"/>
<%-- 	<c:forEach items="${ }">
		
	</c:forEach> --%>
	<c:forEach items="${order_send }" var="send">
		<h1>${send }</h1>
	</c:forEach>
</body>
</html>