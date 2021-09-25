<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8">
	<title>DessertFarm</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   	<link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   	<link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   	
   	<script type="text/javascript">
   		var index = opener.document.getElementById("index").value;
   		
   		var product_name = opener.document.getElementsByClassName("product_name")[index].value;
		var product_quan = opener.document.getElementsByClassName("product_quan")[index].value;
		var product_price = opener.document.getElementsByClassName("product_price")[index].value;
		var order_date = opener.document.getElementsByClassName("order_date")[index].value;
		var order_send = opener.document.getElementById("order_send").value;
   		
		console.log(index);
		console.log(product_name);
		
		$(document).ready(function(data, err){
			$.ajax({
				type : "POST",
				url : "popUp",
				success: function(data) {
					console.log(order_send);
					document.getElementById("product_name").innerHTML = product_name;
					document.getElementById("product_quan").innerHTML = product_quan;
					document.getElementById("product_price").innerHTML = product_price;
					document.getElementById("order_date").innerHTML = order_date;
					document.getElementById("order_send").innerHTML = order_send;
					opener.location.reload();
				}, error: function(err) {
					console.log(data);
					console.log(err);
				}
			});
   		});
   	</script>
</head>
<body>
	<c:import url="../home/top.jsp"/>
	<table class="order_table">
			<thead>
				<tr>
					<th style="width: 40%;">배송번호</th>
					<th style="width: 15%;">수량</th>
					<th style="width: 15%;">금액</th>
					<th style="width: 15%;">주문날짜</th>
					<th style="width: 15%;">배송현황</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="order_itemContent">
							<div class="itemName">
								<div id="product_name" class="product_name"></div>
							</div>
		           	 	</div>
					</td>
					<td><div id="order_detid" class="order_detid"></div></td>
					<td><div id="product_quan" class="product_quan"></div></td>
					<td><div id="product_price" class="product_price"></div>원</td>
					<td><div id="order_date" class="order_date"></div></td>
					<td><div id="order_send" class="order_send"></div></td>
				</tr>
			</tbody>
		</table>
</body>
</html>