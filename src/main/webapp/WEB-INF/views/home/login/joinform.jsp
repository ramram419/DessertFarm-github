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
	
	function register(){
		location.href="./welcome";
	}
	
	function checkfrm(){
		if($(".store_name").val() !== "" && $(".client_name").val() !== "" && $(".client_id").val() !== "" 
			&& $(".client_pwd").val() !== "" && $(".confirm_client_pwd").val() !== "" && $(".client_tel").val() !== ""){
			$(".regbtn").css({"background-color":"#e13517","color":"#ffffff"});
			$(".regbtn").attr("onclick","register();");
		}else{
			$(".regbtn").css({"background-color":"#eeeeee","color":"#000000"});
			$(".regbtn").removeAttr("onclick");
			
			if($('.store_name').val() == ""){
				$(".store_name").css("border","1px solid #FA464E");
				$(".storeerr").show();
			}
			
			if($('.client_name').val() == ""){
				$(".client_name").css("border","1px solid #FA464E");
				$(".nameerr").show();
			}
			
			if($('.client_id').val() == ""){
				$(".client_id").css("border","1px solid #FA464E");
				$(".iderr").show();
			}
			
			if($('.client_pwd').val() == ""){
				$(".client_pwd").css("border","1px solid #FA464E");
				$(".pwderr").show();
			}
			
			if($('.confirm_client_pwd').val() == ""){
				$(".confirm_client_pwd").css("border","1px solid #FA464E");
				$(".pwdchkerr").show();
			}
			
			if($('.client_tel').val() == ""){
				$(".client_tel").css("border","1px solid #FA464E");
				$(".telerr").show();
			}
		}
	}
		
	$(document).ready(function(){
			
		$(function(){
			$(".confirm_client_pwd").keyup(function(){
				if($(".client_pwd").val() !== $(".confirm_client_pwd").val()){
					$(".confirm_client_pwd").css("border","1px solid #FA464E");
					$(".pwdchkerr").show();
					checkfrm();
				}else{
					$(".confirm_client_pwd").css("border","1px solid #eeeeee");
					$(".pwdchkerr").hide();
					checkfrm();
				}
			})
			
			$(".store_name").keyup(function(){
				if($(this).val !== ""){
					$(".store_name").css("border","1px solid #eeeeee");
					$(".storeerr").hide();
					checkfrm();
				}
			})
			
			$(".client_name").keyup(function(){
				if($(this).val !== ""){
					$(".client_name").css("border","1px solid #eeeeee");
					$(".nameerr").hide();
					checkfrm();
				}
			})
			
			$(".client_id").keyup(function(){
				if($(this).val !== ""){
					$(".client_id").css("border","1px solid #eeeeee");
					$(".iderr").hide();
					checkfrm();
				}
			})
			
			$(".client_pwd").keyup(function(){
				if($(this).val !== ""){
					$(".client_pwd").css("border","1px solid #eeeeee");
					$(".pwderr").hide();
					
					$(".confirm_client_pwd").val("");
					$(".confirm_client_pwd").css("border","1px solid #eeeeee");
					$(".pwdchkerr").hide();
					checkfrm();
				}
			})
			
			$(".client_tel").keyup(function(){
				if($(this).val !== ""){
					$(".client_tel").css("border","1px solid #eeeeee");
					$(".telerr").hide();
					checkfrm();
				}
			})
			
		})
		
	})
	</script>
</head>
<body>
	<c:import url="../top.jsp"/>
	<div class="content">
		<div class="joinFrm">
			<div class="jofrm_text">개인정보 작성</div>
			<form class="Joinform" action="/welcome" method="POST">
				<label>상점명<br><input type="text" class="store_name" name="store_name" placeholder="상점명을 입력해주세요."/></label>
				<div class="err storeerr">* 상점명을 입력해주세요.</div>
				<label>이름<br><input type="text" class="client_name" name="client_name" placeholder="이름을 입력해주세요."/></label>
				<div class="err nameerr">* 이름을 입력해주세요</div>
				<label>아이디<br><input type="text" class="client_id" name="client_id" placeholder="아이디를 입력해주세요."/></label>
				<div class="err iderr">* 아이디를 입력해주세요.</div>
				<label>비밀번호<br><input type="password" class="client_pwd" name="client_pwd" placeholder="비밀번호를 입력해주세요."/></label>
				<div class="err pwderr">* 비밀번호를 입력해주세요.</div>
				<label>비밀번호 확인<br><input type="password" class="confirm_client_pwd" name="confirm_client_pwd" placeholder="비밀번호를 한번 더 입력해주세요."/></label>
				<div class="err pwdchkerr">* 올바른 비밀번호를 입력해주세요.</div>
				<label>전화번호<br><input type="text" class="client_tel" name="client_tel" placeholder="전화번호를 입력해주세요."/></label>
				<div class="err telerr">* 전화번호를 입력해주세요.</div>
				<button type="button" class="regbtn" onclick="checkfrm();">회원가입</button>
			</form>
		</div>
	</div>
	<c:import url="../footer.jsp"/>

</body>
</html>