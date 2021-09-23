<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8">
	<title>DessertFarm</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   	<link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   	<link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   	
   	<script type="text/javascript">
		var order_send = opener.document.getElementById("order_send").value;
   		
		$(document).ready(function(data, err){
			$.ajax({
				type : "POST",
				url : "popUp",
				success: function(data) {
					console.log(data);
					console.log(order_send);
					document.getElementById("order_send").innerHTML = order_send;
				}, error: function(err) {
					console.log(data);
					console.log(err);
				}
			});
   		});
   	</script>
</head>
<body>
	<c:import url="../home/top.jsp"/>
	<div id="order_send"></div>
</body>
</html>