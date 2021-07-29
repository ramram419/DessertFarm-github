<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DessertFarm</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/main/login.css"/>">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
	
	</script>
</head>
<body>
	<c:import url="../top.jsp"/>
	<div class="content">
		<div class="finregister">
			<div class="fin_text">회원가입이 완료되었습니다.</div>
			<div class="subtxt">로그인하여 디저트팜을 사용해보시기 바랍니다.</div>
			<button class="gologin" onclick="location.href='./login'">로그인하러 가기</button>
		</div>
	</div>
	<c:import url="../footer.jsp"/>

</body>
</html>