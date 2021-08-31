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
</head>
<body>
<c:import url="../top.jsp"/>
<div class="C_content">
	<div class="contentTxt">주문내역</div>
	<div class="pagelist">
		<ul>
			<li onclick="location.href='./loginMyPage';">정보변경</li>
			<li onclick="location.href='./like';">내찜목록</li>
			<li onclick="location.href='./bags';">장바구니</li>
			<li onclick="location.href='./orderlist';" class="click">주문내역</li>
			<li onclick="location.href='./qnalist';">문의내역</li>
		</ul>
	</div>
	<div>
		<table class="order_table">
			<thead>
				<tr>
					<th style="width: 40%;">상품이름</th>
					<th style="width: 15%;">수량</th>
					<th style="width: 15%;">금액</th>
					<th style="width: 15%;">주문날짜</th>
					<th style="width: 15%;">배송</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<img src="${path }/resources/images/image_7.png" class="orderitem_img"/>
						<div class="order_itemContent">
		               		<div class="tag new">NEW</div>
		               		<div class="tag only_b">사업자 전용</div>
			               	<div class="itemName"><span class="shopName">[달콤디저트]</span> 크로무슈</div>
		           	 	</div>
					</td>
					<td>2</td>
					<td>32,000원</td>
					<td>2021.02.01</td>
					<td><button class="detail_btn">배송 상세보기</button></td>
				</tr>
				<tr>
					<td>
						<img src="${path }/resources/images/cake.png" class="orderitem_img"/>
						<div class="order_itemContent">
		               		<div class="tag best">BEST</div>
			               	<div class="itemName"><span class="shopName">[달콤디저트]</span> 쿠앤크 케이크</div>
		           	 	</div>
					</td>
					<td>1</td>
					<td>16,000원</td>
					<td>2021.01.12</td>
					<td><button class="detail_btn">배송 상세보기</button></td>
				</tr>
				<tr>
					<td>
						<img src="${path }/resources/images/image_6.png" class="orderitem_img"/>
						<div class="order_itemContent">
		               		<div class="tag best">BEST</div>
			               	<div class="itemName"><span class="shopName">[달콤디저트]</span> 크로플</div>
		           	 	</div>
					</td>
					<td>1</td>
					<td>20,000원</td>
					<td>2021.01.02</td>
					<td><button class="detail_btn">배송 상세보기</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	
</div>
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>