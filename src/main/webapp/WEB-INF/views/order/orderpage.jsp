<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DessertFarm</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>
		.order-title {
			font-size : 25px;
			color : #111111;
			font-weight : bold;
		}
		
		.delivery-title {
			font-size : 25px;
			color : #111111;
			font-weight : bold;
		}
		
		.tab {
			width : 1280px;
			margin-top : 10px;
			border-top : 2px solid #CECECE;
		
		}
		
		.info {
			font-family : 맑은고딕, Malgun Gothic, gulim, sans-serif;
			margin-bottom : 20px;
		}
		
		.title {
			color : #111111;
			font-size : 13px;
			font-weight : bold;
			padding : 15px;
			text-align : right;
			width : 150px;
			background-color : #F4F4F4;
			border-right : 1px solid #E4E4E4;
			border-bottom : 1px solid #E4E4E4;
		}
		
		td {
			font-size : 13px;
		}
		
		.value {
			padding-left : 10px;
			border-bottom : 1px solid #E4E4E4;
		}
		
		.delivery-person {
			margin-top : 20px;                  
		}
		
		.guide-count {
			margin-top : 10px;
			margin-bottom : 10px;
			font-size : 17px;
		}
		
		.guide {
			font-size : 15px;
			background-color : #F4F4F4;
			padding : 20px;
			
			border-top : 2px solid #CECECE;  
			cursor: pointer;
		}
		
		.order-brief {
			display : inline-block;
			margin-left : 20px;
		}
		
		.gangjo {
			
			font-size : 25px;
		}
		.pulldown {
			border : 3px solid #F4F4F4;
			background-color : #fff;
			width : auto;
			height : 200px;
		
		}
		.account-info {
			padding-top : 50px;
			padding-left : 20px;	
		}
		.acc {
			font-size : 13px;
			margin-left : 38px;
			margin-bottom: 15px;	
			font-weight : bold;
		}
		
		.inputtxt {
			border : 1px solid #E8EDEF;
			background-color : #F7F7F7;
			height : 25px;
			border-radius : 5px;
			font-size: 13px;
		}
		
		#address-button {
			cursor: pointer;
		}
		
		
	</style>
	
	<script>
	
	$(document).ready(function() {
		$('.pulldown').hide();
		$('#address-button').click(function() {
			new daum.Postcode({
		        oncomplete: function(data) {
		        	 var addr = '';
		        	 
		        	 if (data.userSelectedType === 'R') {
		                    addr = data.roadAddress;
		                } else { 
		                    addr = data.jibunAddress;
		                }
		        	 
		        	  document.getElementById('postcode').value = data.zonecode;
		        	  document.getElementById('basic-add').value = addr;
		        	  document.getElementById("detail-add").focus();
		        }
		    }).open();
		})
	}); 
		
	
		
	$(document).ready(function() {
		$('.guide').click(function() {
			$(this).next().toggle();
		});
	});
	
	var index = $('.index').val();
	var indexArr = new Array();
	var pdmap = new Map();
	var pdname = new Array();
	var pdquan = new Array();
	var pdprice = new Array();
	
	function order(index) {
		console.log(index);
		
		for(var j=0;j<=index;j++){
			console.log(j);
			indexArr.push(j);
		}
		
		console.log(indexArr);
		
		for(var i=0;i<indexArr.length;i++){
   			var product_name = $('.p_name').eq(indexArr[i]).val();
   			var product_quan = $('.p_quan').eq(indexArr[i]).val();
   			var product_price = $('.p_price').eq(indexArr[i]).val();
   			console.log(product_name);
   			
   			pdname.push(product_name);
   			pdquan.push(product_quan);
   			pdprice.push(product_price);
   			
   			pdmap.set("product_name", pdname);
   			pdmap.set("product_quan", pdquan);
   			pdmap.set("product_price", pdprice);
		}
		
			console.log(pdname);
			console.log(pdquan);
			console.log(pdprice);
			
			$('.pdname').val(pdname);
			$('.pdquan').val(pdquan);
			$('.pdprice').val(pdprice);
			
   			var oFrm = document.oFrm;
   			oFrm.submit();
	}

	</script>
</head>
<body>
<c:import url="../home/top.jsp" />
<form name="oFrm" action="${path}/orderlist/register" method="post" encType="utf-8">
	<div class="C_content" >
	<div class="info ordering-person">
			<table class='tab'>
				<thead>
					<tr style='height: 30px;'>
						<td class='title img' style='text-align : center'>이미지</td>
						<td class='title name' style='text-align : center; width : 70%;'>상품내용</td>
						<td class='title each' style='text-align : center'>수량</td>
						<td class='title' style='text-align : center'>가격</td>
					</tr>
				</thead>
			
				<tbody>
				<c:forEach items="${pdList}" var="pdMap" varStatus="status">
				<c:set var="index" value="${status.index}" />
					<tr style=' height : 50px; border-bottom : 1px solid black;'>
						<td style='text-align : center;'>
							<img style='margin : 5px 5px; vertical-align : middle; text-align : center; width : 100px; height : 100px;' src='${path}/resources/product_img/20210829_33_jinAdmin_thumb.jpg'>
						</td>
						<td style='text-align : center;'><input type="hidden" class="p_name" name="p_name" value="${pdList[status.index].name}" />${pdList[status.index].name}</td>
						<td style='text-align : center;'><input type="hidden" class="p_quan" name="p_quan" value="${pdList[status.index].quan}" />${pdList[status.index].quan}</td>
						<td style='text-align : center;'><input type="hidden" class="p_price" name="p_price" value="${pdList[status.index].price}" />${pdList[status.index].price}원</td>
					</tr>
					<input type="hidden" value="${index}" class="index" name="index" />
					<input type="hidden" class="pdname" name="pdname" />
            		<input type="hidden" class="pdquan" name="pdquan" />
            		<input type="hidden" class="pdprice" name="pdprice" />
            		<input type="hidden" class="pdmap" name="pdmap" />
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="info ordering-person">
			<p class="order-title">주문자 정보</p>
			<c:set value="${user}" var="user" />
			<table class='tab'>
				<tr>
					<td class='title'>이름</td>
					<td class='value'>${user.client_name }</td>
				</tr>
				<tr>
					<td class='title'>이메일</td>
					<td class='value'>${user.client_email }</td>
				</tr>
				<tr>
					<td class='title'>전화번호</td>
					<td class='value'>${user.client_tel }</td>
				</tr>
			</table>
			
	
		</div>
		
		<div class="info delivery">
			<p class="order-title">배송 정보</p>
			<c:set value="${orderInfo}" var="info"/>
			<table class='tab'>
				<tr>
					<td class='title'>배송정보</td>
					<td class='value'><input type="radio" name='deli' checked> 기존 배송정보 <input name='deli' type="radio">새 배송정보 입력</td>
				</tr>
				<tr>
					<td class='title'>수령인</td>
					<td class='value'><input class='inputtxt' type='text' placeholder='${info[0].client_name}' value='${info[0].client_name}'></td>
				</tr>
				
				<tr>
					<td class='title'>주소</td>
						<td class='value'>
							<input id='postcode' style='width:70px; text-align : center;' type='text' class='inputtxt' placeholder='${info[0].postal_code }' value='${info[0].postal_code}'>
							<button id='address-button' style='margin-bottom: 6px; padding-bottom:2px; width:80px; height : 29px; text-align : center;' class='inputtxt'>주소찾기</button> <br>
							<input id='basic-add' style='margin-bottom: 6px; width:300px; text-align : center;' type='text' class='inputtxt' placeholder='${info[0].address}' value='${info[0].address}'><br>
							<input id='detail-add' style='margin-bottom: 6px; width:300px; text-align : center;' type='text' class='inputtxt' placeholder='${info[0].detail_address}' value='${info[0].detail_address}'>
						</td>
				</tr>
				<tr>
					<td class='title'>전화번호</td>
					<td class='value'><input style='width: 50px' class='inputtxt' type='text' placeholder='010'> - <input style='width: 100px' class='inputtxt' type='text' placeholder='010'> - <input style='width: 100px' class='inputtxt' type='text' placeholder='010'></td>
				</tr>
			</table>
			
	
		</div>
		<div class="info delivery-person">
			<p class="delivery-title">결제</p>
			<h1 class='guide-count'> 총 <b class='gangjo'>3</b> 곳의 납품업체</h1>
			<div class="supplier">
				<div class='guide'>
					<i class="fas fa-angle-down fa-lg"></i>
					<span class='order-brief'>[테스트 상점] 초코초코 케이크 1개</span>
				</div>
				<div class='pulldown'>
					<div class='account-info'>
						<p class='acc holder'>예금주 : 홍길동</p>
						<p class='acc number'>계좌번호 : 654123-12-123456</p> 
					</div>
				</div>
			</div>
			<div class="supplier">
				<div class='guide'>
					<i class="fas fa-angle-down fa-lg"></i>
					<span class='order-brief'>[테스트 상점] 달달한 마카롱 1Box(6pcs)</span>
				</div>
				<div class='pulldown'></div>
			</div>
			<div class="supplier">
				<div class='guide'>
					<i class="fas fa-angle-down fa-lg"></i>
					<span class='order-brief'>[테스트 상점] 부드러운 카스테라 1Box(10pcs)</span>
				</div>
				<div class='pulldown'></div>
			</div>	
		</div>
		
		<div class="order_btns">
			<button type="button" style="background-color:#e13517; color:#ffffff; margin: 0 auto;" onclick="order(${index})">주문하기</button>
		</div>
	</div>
</form>
</body>
</html>