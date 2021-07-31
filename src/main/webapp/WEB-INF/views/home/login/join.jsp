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
</head>
<body>
	<c:import url="../top.jsp"/>
	<div class="content">
		<div class="joinbtn">
			<div class="join_text">회원가입</div>
			<div class="joinAdmin">
				<span style="color:#000000;">납품업체</span>를 <span style="color:#e13517; font-weight:bold;">등록</span>하고 싶으신가요?
				<button type="button" class="adminbtn" onclick="location.href='${path}/manager';">납품업체 회원가입</button>
			</div>
			
			<div class="joinclient">
				<span style="color:#000000;">디저트팜</span>에서 <span style="color:#e13517; font-weight:bold;">구매</span>를 원하시나요?
				<button type="button" class="clientbtn" onclick="location.href='${path}/client'">사용자 회원가입</button>
			</div>
		</div>
	</div>
	<c:import url="../footer.jsp"/>

</body>
</html>