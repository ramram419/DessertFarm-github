<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	Map<String, Object> userList = (Map<String,Object>)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DessertFarm</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/main/login.css"/>">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		function login(){
			var userList = "${userList}";
			
			if($(".pwd").val() == ""){
				alert("비밀번호를 입력해주세요!");
			}else if($(".pwd").val() !== ""){
				$(".loginfrm").submit();
			}
		}
	</script>
</head>
<body>
	<c:import url="../top.jsp"/>
	<div class="content">
		<div class="login">			
			<c:if test="${sessionScope.user eq null}">
			<div class="lo_text">로그인</div>
				<form class="loginfrm" action="${path}/home" method="POST">
					<input type="text" class="id" name="client_id" placeholder="아이디를 입력해주세요."/>
					<input type="password" class="pwd" name="client_pwd" placeholder="비밀번호를 입력해주세요."/>
					<button type="button" class="logbtn" onclick="login();">로그인</button>
				</form>
				<div class="register">
					아직 <span>가입</span>을 안해주셨나요?
					<button type="button" class="registerbtn" onClick="location.href='./join';">회원가입</button>
				</div>
			</c:if>
			
			<c:if test="${sessionScope.user ne null}">
			<div class="lo_text">비밀번호 재확인</div>
				<form class="loginfrm" action="${path}/myPage" method="POST">
					<input type="hidden" class="id" name="client_id" value="<%=userList.get("client_id").toString() %>" />
					<input type="password" class="pwd" name="client_pwd" placeholder="비밀번호를 입력해주세요."/>
					<button type="button" class="logbtn" onclick="login();">로그인</button>
				</form>
			</c:if>
		</div>
	</div>
	<c:import url="../footer.jsp"/>

</body>
</html>