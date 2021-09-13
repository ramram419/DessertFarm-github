<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	Map<String, Object> userList = (Map<String, Object>)session.getAttribute("user");
%>

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
			
			if($('.client_pwd').val() == ""){
				$(".pwd").css("border","1px solid #FA464E");
				$(".pwderr").show();
			}
			
			if($('.confirm_pwd').val() == ""){
				$(".confirm_pwd").css("border","1px solid #FA464E");
				$(".pwdchkerr").show();
			}
			
			if($('.origin_pwd').val() == ""){
				$(".origin_pwd").css("border","1px solid #FA464E");
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
			url : "modify/client",
			dataType:"JSON",
			data : {"name" : name, "id" : id, "pwd": pwd, "tel": tel},
			type : "POST",
			success : function(response){
				location.href='./modify/client';
			},
			error : function(err){
				console.log(err)
			}
		});
	}
	</script>
</head>
<body>
<c:import url="../top.jsp"/>
<div class="C_content">
	<div class="contentTxt">마이페이지</div>
	<div class="pagelist">
		<ul>
			<li onclick="location.href='./loginMyPage';" class="click">정보변경</li>
			<li onclick="location.href='./like';">내찜목록</li>
			<li onclick="location.href='./bags';">장바구니</li>
			<li onclick="location.href='./orderlist';">주문내역</li>
			<li onclick="location.href='./qnalist?pageNum=1';">문의내역</li>
		</ul>
	</div>
	<div class="mypageFrm">
	<form name="modifyForm" action="/modify/client" method="post">
		<label>
			상점명<br>
			<input type="text" class="name" name="client_name" value="<%=userList.get("client_name").toString() %>"/>
		</label>
		<div class="err nameerr">* 상점명을 입력해주세요.</div>
		<label>아이디<br><input type="text" class="id" name="client_id" value="<%=userList.get("client_id").toString() %>" readonly/></label>
		<div class="err iderr">* 아이디를 입력해주세요.</div>
		<label>현재 비밀번호<br><input type="password" class="origin_pwd" name="origin_client_pwd" placeholder="비밀번호를 입력해주세요."/></label>
		<div class="err pwderr">* 비밀번호를 입력해주세요.</div>
		<label>새로운 비밀번호<br><input type="password" class="pwd" name="client_pwd" placeholder="비밀번호를 입력해주세요."/></label>
		<div class="err pwderr">* 비밀번호를 입력해주세요.</div>
		<label>비밀번호 재입력<br><input type="password" class="confirm_pwd" name="confirm_pwd" placeholder="한번 더 입력해주세요."/></label>
		<div class="err pwderr">* 한번 더 입력해주세요.</div>
		<label>전화번호<br><input type="text" class="tel" name="client_tel" value="<%=userList.get("client_tel").toString() %>"/></label>
		<div class="err telerr">* 전화번호를 입력해주세요.</div>
		<button type="button" class="modibtn" onclick="modify();">정보수정</button>
		</form>
	</div>
	
</div>
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>