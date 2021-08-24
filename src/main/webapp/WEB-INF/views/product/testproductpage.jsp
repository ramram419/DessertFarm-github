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

	<div>
			<h1>디저트팜 관리자 페이지 sample</h1>
			<p><a href="<c:url value='' />">대쉬보드</a></p>
			<p>- 기본정보관리</p>
			<p><a href="<c:url value='' />">상점정보</a></p>
			<p>- 주문</p>
			<p><a href="<c:url value='' />">주문관리</a></p>
			<p><a href="<c:url value='' />">배송관리</a></p>
			<p><a href="<c:url value='' />">문의관리</a></p>
			<p>- 상품</p>	
			<p><a href="<c:url value='product/testRegisterProduct' />">메뉴등록/관리</a></p>
			<p><a href="<c:url value='' />">샘플메뉴 등록</a></p>
	</div>

</body>
</html>