<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<c:import url="../home/top.jsp"/>
	<div class="content">
		<div class="joinFrm">
			<div class="jofrm_text">마이페이지</div>
			<form class="Joinform" action="/welcome/manager" method="POST">
				<label>상점명<br><input type="text" class="name" name="name" placeholder="${LoginRequest.client_name }"/></label>
				<div class="err nameerr">* 상점명을 입력해주세요.</div>
				<label>아이디<br><input type="text" class="id" name="id" placeholder="${LoginRequest.client_id }"/></label>
				<div class="err iderr">* 아이디를 입력해주세요.</div>
				<label>비밀번호<br><input type="password" class="pwd" name="pwd" placeholder="비밀번호를 입력해주세요."/></label>
				<div class="err pwderr">* 비밀번호를 입력해주세요.</div>
				<label>비밀번호 확인<br><input type="password" class="confirm_pwd" name="confirm_pwd" placeholder="비밀번호를 한번 더 입력해주세요."/></label>
				<div class="err pwdchkerr">* 올바른 비밀번호를 입력해주세요.</div>
				<label>전화번호<br><input type="text" class="tel" name="tel" placeholder="전화번호를 입력해주세요."/></label>
				<div class="err telerr">* 전화번호를 입력해주세요.</div>
				<button type="button" class="chkbtn" onclick="checkfrm();">회원가입</button>
				<button type="button" class="regbtn" onclick="join();">회원가입</button>
			</form>
		</div>
	</div>
	<c:import url="../home/footer.jsp"/>
</body>
</html>