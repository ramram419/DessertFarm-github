<%@page import="spring.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<script type="text/javascript">
	function login() {
		var frmLogin = document.frmLogin;
		var id = document.getElementById('id').value;
		var pwd = document.getElementById('pwd').value;
		
		if(id.length == 0 || id == ""){
			alert("필수 입력 사항입니다 :)");
		}else if(pwd.length == 0 || pwd == ""){
			alert("필수 입력 사항입니다 :)");
		}else {
			alert("환영합니다 " + id + "님!!");
			frmLogin.method="post";
			frmLogin.action="main";
			frmLogin.submit();
		}
}
</script>
</head>
<body>
	<h1>Login Please</h1>
	<form:form name="frmLogin" modelAttribute="loginRequest">
		<p>
			<label>ID : <br>
				<form:input path="id" id="id" />
			</label>
		</p>
		<p>
			<label>Password : <br>
				<form:password path="pwd" id="pwd"/>
			</label>
		</p>
		<input type="button" onClick="login()" value="LOGIN" />
		<input type="reset" value="RESET" />
	</form:form>
	<button type="button" onClick="location.href='<c:url value='/joinForm' />'">Join Us</button>
</body>
</html>