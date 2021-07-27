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
		var frmManager = document.frmManager;
		var id = document.getElementById('id').value;
		var pwd = document.getElementById('pwd').value;
		
		if(id.length == 0 || id == ""){
			alert("필수 입력 사항입니다 :)");
		}else if(pwd.length == 0 || pwd == ""){
			alert("필수 입력 사항입니다 :)");
		}else {
			frmManager.method="post";
			frmManager.action="dessertfarm.com";
			frmManager.submit();
		}
}
</script>
</head>
<body>
	<h1>Login Please</h1>
	<form:form name="frmManager" modelAttribute="managerRequest">
		<p>
			<label>ID : <br>
				<form:input path="manager_id" id="id" />
			</label>
		</p>
		<p>
			<label>Password : <br>
				<form:password path="manager_pwd" id="pwd"/>
			</label>
		</p>
		<input type="button" onClick="login()" value="LOGIN" />
		<input type="reset" value="RESET" />
	</form:form>
	<button type="button" onClick="location.href='<c:url value='/adminJoinForm' />'">사업자 등록하기</button>
</body>
</html>