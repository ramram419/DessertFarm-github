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
			<li onclick="location.href='./qnalist?pageNum=1';">문의내역</li>
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
				<c:forEach items="${orderList }" var="order">
				<tr>
					<td>
						<img src="${path }/resources/images/image_7.png" class="orderitem_img"/>
						<div class="order_itemContent">
		               		<div class="tag new">NEW</div>
		               		<div class="tag only_b">사업자 전용</div>
			               	<div class="itemName"><span class="shopName">[달콤디저트]</span> ${order.product_name }</div>
		           	 	</div>
					</td>
					<td>${order.product_quan }</td>
					<td>${order.product_price }원</td>
					<td>${order.order_date }</td>
					<td><button class="detail_btn">배송 상세보기</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<ul class="pagingbox">
		<c:if test="${paging.leftArr}">
			<a href="?keyword=${keyword}&pageNum=${paging.sectorStart-1}"><li><img src="${path }/resources/images/left_arrow.png" /></li></a>
		</c:if>
		<c:forEach var='i' begin="${paging.sectorStart}" end="${paging.sectorEnd}">
		<c:choose>
				<c:when test="${i eq paging.pageNum}">
					<li class="active">${i}</li>		
				</c:when>
				<c:otherwise>
					<a href="?keyword=${keyword}&pageNum=${i}"><li>${i}</li></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.sectorEnd < paging.totalPage}">
		<a href="?keyword=${keyword}&pageNum=${paging.sectorEnd+1}"><li><img src="${path }/resources/images/right_arrow.png" /></li></a>
		</c:if>
		</ul>
	</div>
	
</div>
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>