<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DessertFarm</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<c:import url="../top.jsp" />
		<table border="2px">
			<c:forEach items="${searchList }" var="sl">
				<tr>
					<td>상품명</td>
					<td>${sl.product_name }</td>
				</tr>
				<tr>
					<td>상품 가격</td>
					<td>${sl.product_price }</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>${sl.category }</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>