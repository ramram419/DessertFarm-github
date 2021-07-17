<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="spring.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Page</title>
<script type="text/javascript">
	function join() {
		var frmJoin = document.frmJoin;
		var id = document.getElementById('id').value;
		var pwd = document.getElementById('pwd').value;
		var cPwd = document.getElementById('cPwd').value;
		var name = document.getElementById('name').value;
		var email = document.getElementById('id').value;
		
		if(id.length == 0 || id == ""){
			alert("필수 입력 사항입니다 :)");
		}else if(pwd.length == 0 || pwd == "" || cPwd.length == 0 || cPwd == ""){
			alert("필수 입력 사항입니다 :)");
		}else if(name.length == 0 || name == ""){
			alert("필수 입력 사항입니다 :)");	
		}else if(email.length == 0 || email == ""){
			alert("필수 입력 사항입니다 :)");	
		}else if(pwd != cPwd){
			alert("비밀번호가 일치 하지 않습니다");
		}else {
			alert("회원가입 성공 \n환영합니다 " + id + "님!!");
			frmJoin.method="post";
			frmJoin.action="join";
			frmJoin.submit();
		}
}
</script>
</head>
<body>
	<h1>Write the Form</h1>
	<form:form name="frmJoin" modelAttribute="joinRequest">
		<p>
			<label>ID : <br>
				<form:input path="id" id="id" /><button type="button" onClick="" >중복 확인</button>
			</label>
		</p>
		<p>
			<label>Password : <br>
				<form:password path="pwd" id="pwd" />
			</label>
		</p>
		<p>
			<label>Check Password : <br>
				<form:password path="confirmPwd" id="cPwd" />
			</label>
		</p>
		<p>
			<label>Name : <br>
				<form:input path="name" id="name" />
			</label>
		</p>
		<p>
			<label>Email : <br>
				<form:input path="email" id="email" />
			</label>
		</p>
		<input type="button" onClick="join()" value="Join Us" />
		<input type="reset" value="RESET" />
	</form:form>
</body>
</html>