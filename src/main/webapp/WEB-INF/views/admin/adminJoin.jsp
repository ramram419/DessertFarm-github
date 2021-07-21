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
		var email = document.getElementById('email').value;
		var address = document.getElementById('address').value;
		var tel = document.getElementById('tel').value;
		var intro = document.getElementById('intro').value;
		var website = document.getElementById('website').value;
		var image = document.getElementById('image').value;
		
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
		}else if(intro.length == 0 || intro == "") {
			alert("필수 입력 사항입니다 :)");			
		}else if(website.length == 0 || website == "") {
			alert("필수 입력 사항입니다 :)");			
		}else if(image.length == 0 || image == "") {
			alert("필수 입력 사항입니다 :)");			
		}else {
			alert("사업자 등록 성공 \n환영합니다 " + id + "님!!");
			frmJoin.method="post";
			frmJoin.action="joinManager";
			frmJoin.submit();
		}
}
</script>
</head>
<body>
	<h1>Write the Form</h1>
	<form:form name="frmJoin" modelAttribute="joinManagerRequest">
		<p>
			<label>아이디 : <br>
				<form:input path="manager_id" id="id" /><button type="button" onClick="" >중복 확인</button>
			</label>
		</p>
		<p>
			<label>비밀번호 : <br>
				<form:password path="manager_pwd" id="pwd" />
			</label>
		</p>
		<p>
			<label>비밀번호 확인 : <br>
				<form:password path="confirm_manager_pwd" id="cPwd" />
			</label>
		</p>
		<p>
			<label>업체 명 : <br>
				<form:input path="manager_name" id="name" />
			</label>
		</p>
		<p>
			<label>이메일 : <br>
				<form:input path="manager_email" id="email" />
			</label>
		</p>
		<p>
			<label>주소 : <br>
				<form:input path="manager_address" id="address" />
			</label>
		</p>
		<p>
			<label>연락처 : <br>
				<form:input path="manager_tel" id="tel" />
			</label>
		</p>
		<p>
			<label>상점 소개 : <br>
				<form:input path="manager_intro" id="intro" />
			</label>
		</p>
		<p>
			<label>상점 사이트 주소 : <br>
				<form:input path="manager_website" id="website" />
			</label>
		</p>
		<p>
			<label>상점 이미지 : <br>
				<form:input path="manager_image" id="image" />
			</label>
		</p>
		<input type="button" onClick="join()" value="Join Us" />
		<input type="reset" value="RESET" />
	</form:form>
</body>
</html>