<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
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
		var email = document.getElementById('email').value;
		var address = document.getElementById('address').value;
		var tel = document.getElementById('tel').value;
		
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
		}else if (address.length == 0 || address == "") {
			alert("필수 입력 사항입니다 :)");
		}else if(tel.length == 0 || tel == "") {
			alert("필수 입력 사항입니다 :)");			
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
				<form:input path="client_id" id="id" /><button type="button" onClick="" >중복 확인</button>
			</label>
		</p>
		<p>
			<label>Password : <br>
				<form:password path="client_pwd" id="pwd" />
			</label>
		</p>
		<p>
			<label>Check Password : <br>
				<form:password path="confirm_client_pwd" id="cPwd" />
			</label>
		</p>
		<p>
			<label>Name : <br>
				<form:input path="client_name" id="name" />
			</label>
		</p>
		<p>
			<label>Email : <br>
				<form:input path="client_email" id="email" />
			</label>
		</p>
		<p>
			<label>Address : <br>
				<form:input path="client_address" id="address" />
			</label>
		</p>
		<p>
			<label>Phone Number : <br>
				<form:input path="client_tel" id="tel" />
			</label>
		</p>
		<p>
			<label>사업자 등록증 : <br>
				<form:input path="client_entre" id="entre" />
			</label>
		</p>
		<p>
			<label>카카오 : <br>
				<form:input path="client_kakao" id="kakao" />
			</label>
		</p>
		<input type="button" onClick="join()" value="Join Us" />
		<input type="reset" value="RESET" />
	</form:form>
</body>
</html>