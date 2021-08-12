<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
   <title>DessertFarm</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
   <script type="text/javascript">
	
	function checkfrm(){
		if($(".name").val() !== "" && $(".id").val() !== "" 
			&& $(".pwd").val() !== "" && $(".confirm_pwd").val() !== "" && $(".tel").val() !== ""){
			$(".modibtn").css("background-color","#e13517");
		}else{
			$(".modibtn").css("background-color","#bbbbbb");
			
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
		
	})
	
	function modify(){
		var role = "${sessionScope.user}";
		
		var name = $(".name").val();
		var id = $(".id").val();
		var pwd = $(".pwd").val();
		var tel = $(".tel").val();
		
		
		$.ajax({
			url : "modify/"+role,
			data : role+"_name="+name+"&"+role+"_id="+id+"&"+role+"_pwd="+pwd+"&"+role+"_tel="+tel,
			type : "POST",
			dataType:"html",
			success : function(response){
				location.href='./modify/client';
			},
			error : function(err){
				console.log(err)
			}
		})
	}
	</script>
</head>
<body>
<c:import url="../top.jsp"/>
<div class="mypage_content">
	<div class="contentTxt">마이페이지</div>
	<div class="pagelist">
		<ul>
			<li class="click">마이페이지</li>
			<li>내찜목록</li>
			<li>장바구니</li>
			<li>주문내역</li>
			<li>문의내역</li>
		</ul>
	</div>
	<div>${loginRequest}</div>
	<div class="mypageFrm">
		<label>상점명<br><input type="text" class="name" name="client_name" placeholder="이름을 입력해주세요." value="${loginRequest.client_name }"/></label>
		<div class="err nameerr">* 상점명을 입력해주세요.</div>
		<label>아이디<br><input type="text" class="id" name="client_id" value="${loginRequest.client_id }" readonly/></label>
		<div class="err iderr">* 아이디를 입력해주세요.</div>
		<label>비밀번호<br><input type="password" class="pwd" name="client_pwd" placeholder="비밀번호를 입력해주세요."/></label>
		<div class="err pwderr">* 비밀번호를 입력해주세요.</div>
		<label>전화번호<br><input type="text" class="tel" name="client_tel" placeholder="전화번호를 입력해주세요." value="${loginRequest.client_tel }"/></label>
		<div class="err telerr">* 전화번호를 입력해주세요.</div>
		<button type="button" class="modibtn" onclick="checkfrm();">정보수정</button>
	</div>
	
</div>
<c:import url="../footer.jsp"/>
</body>
</html>