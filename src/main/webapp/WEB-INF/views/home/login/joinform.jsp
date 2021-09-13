<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
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
	
	function checkfrm(){
		if($(".name").val() !== "" && $(".id").val() !== "" 
			&& $(".pwd").val() !== "" && $(".confirm_pwd").val() !== "" && $(".tel").val() !== ""){
			$(".regbtn").show();
			$(".chkbtn").hide();
		}else{
			$(".regbtn").hide();
			$(".chkbtn").show();
			
			if($('.name').val() == ""){
				$(".name").css("border","1px solid #FA464E");
				$(".nameerr").show();
			}
			
			if($('.id').val() == ""){
				$(".id").css("border","1px solid #FA464E");
				$(".iderr").show();
			}
			
			if($('.pwd').val() == ""){
				$(".pwd").css("border","1px solid #FA464E");
				$(".pwderr").show();
			}
			
			if($('.confirm_pwd').val() == ""){
				$(".confirm__pwd").css("border","1px solid #FA464E");
				$(".pwdchkerr").show();
			}
			
			if($('.tel').val() == ""){
				$(".tel").css("border","1px solid #FA464E");
				$(".telerr").show();
			}
		}
	}
	
	function join(){
		var role = "${sessionScope.role}";
		
		var name = $(".name").val();
		var id = $(".id").val();
		var pwd = $(".pwd").val();
		var tel = $(".tel").val();
		
		
		$.ajax({
			url : "welcome/"+role,
			data : role+"_name="+name+"&"+role+"_id="+id+"&"+role+"_pwd="+pwd+"&"+role+"_tel="+tel,
			type : "POST",
			dataType:"html",
			success : function(response){
				location.href='./welcome/client';
			},
			error : function(err){
				console.log(err)
			}
		})
	}
		
	$(document).ready(function(){
			
		$(function(){
			$(".confirm_pwd").keyup(function(){
				if($(".pwd").val() !== $(".confirm_pwd").val()){
					$(".confirm_pwd").css("border","1px solid #FA464E");
					$(".pwdchkerr").show();
					checkfrm();
				}else{
					$(".confirm_pwd").css("border","1px solid #eeeeee");
					$(".pwdchkerr").hide();
					checkfrm();
				}
			})
			
			$(".name").keyup(function(){
				if($(this).val !== ""){
					$(".name").css("border","1px solid #eeeeee");
					$(".nameerr").hide();
					checkfrm();
				}
			})
			
			$(".id").keyup(function(){
				if($(this).val !== ""){
					$(".id").css("border","1px solid #eeeeee");
					$(".iderr").hide();
					checkfrm();
				}
			})
			
			$(".pwd").keyup(function(){
				if($(this).val !== ""){
					$(".pwd").css("border","1px solid #eeeeee");
					$(".pwderr").hide();
					
					$(".confirm_pwd").val("");
					$(".confirm_pwd").css("border","1px solid #eeeeee");
					$(".pwdchkerr").hide();
					checkfrm();
				}
			})
			
			$(".tel").keyup(function(){
				if($(this).val !== ""){
					$(".tel").css("border","1px solid #eeeeee");
					$(".telerr").hide();
					checkfrm();
				}
			})
			
		})
		
	});
	
	function dupId() {
		var _id = $(".id").val();
		var role = "${sessionScope.role}";
		$.ajax({
			type: "POST",
			url: role+"/dupId",
			dataType: "JSON",
			data: { "id": _id},
			success: function (data) {
				if(_id == "") {
					alert("ID를 입력해주세요. ");
				}else if(data == 0) {
					var conf = confirm("사용할 수 있는 ID입니다 \n해당 ID를 사용하시겠습니까?");
					if(conf == true){
						$('.id').prop("readonly", true);
						$('.lb_Id.btn_dupCheck').prop("disabled", true);
					}else if(conf == false){
						$('.id').val("");
					}
				}else if(data == 1){
					alert("이미 존재하는 ID입니다. ");
					$('.id').val("");
				}
			}
		});
	}
	
	function dupName(){
		var _name = $(".name").val();
		var role = "${sessionScope.role}";
		$.ajax({
			type: "POST",
			url: role+"/dupName",
			dataType: "JSON",
			data: {"name": _name},
			success: function(data) {
				if(_name == ""){
					alert("상점명을 입력해주세요. ");
				}else if(data == 0){
					var conf= confirm("사용할 수 있는 상점명입니다 \n해당 상점명을 사용하시겠습니까? ");
					if(conf == true){
						$('.name').prop("readonly", true);
						$('.lb_Name.btn_dupCheck').prop("disabled", true);
					}else if(conf == false){
						$('.name').val("");
					}
				}else if(data == 1) {
					alert("이미 존재하는 상점명입니다. ");
					$('.name').val("");
				}
			}
		});
	}
	</script>
</head>
<body>
	<c:import url="../top.jsp"/>
	<div class="content">
		<div class="joinFrm">
			<div class="jofrm_text">개인정보 작성</div>
			<form class="Joinform" action="/welcome/manager" method="POST">
				<label class="lb_Name">
					상점명<br>
					<input type="text" class="name" name="name" placeholder="상점명을 입력해주세요."/>
					<button class="btn_dupCheck" type="button" onclick="dupName()">중복확인</button>
					</label>
				<div class="err nameerr">* 상점명을 입력해주세요.</div>
				<label class="lb_Id">
					아이디<br>
					<input type="text" class="id" name="id" placeholder="아이디를 입력해주세요."/>
					<button class="btn_dupCheck" type="button" onclick="dupId()">중복확인</button>
				</label>
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
	<c:import url="../footer.jsp"/>

</body>
</html>