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
   		var index = $('.index').val();
   		
		function popUp(index){
			var product_name = $('.product_name').eq(index).val();
			var product_quan = $('.product_quan').eq(index).val();
			var product_price = $('.product_price').eq(index).val();
			var order_date = $('.order_date').eq(index).val();
			console.log(index);
			$('.index').val(index);
			
			$.ajax({
				type : "POST",
				url : "order/send/detail",
				dataType : "text",
				data : {"product_name": product_name, "product_quan": product_quan, "product_price": product_price, "order_date": order_date},
				success: function(data) {
					if(data != null && data != "null data"){
						console.log(data);
						$('.order_send').val(data);
						var order_send = $('.order_send').val();
						window.open("order/send/detail/popUp", "PopUpWin", "height=800px, width=800px");
						
						$.ajax({
							type: "POST",
							url: "review/new",
							dataType: "text",
							data: {"order_send" : order_send},
							success: function(data) {
								console.log(data);
							}
						});
					}else if(data == "null data"){
						console.log(data);
						alert('Error');
						location.href='./orderlist';
					}
				}, error: function(err) {
					console.log(err);
				}
			});
		}
   </script>
</head>
<body>
<c:import url="../home/top.jsp"/>
<div class="C_content">
	<div class="contentTxt">주문내역</div>
	<div class="pagelist">
		<ul>
			<li onclick="location.href='./loginMyPage';">정보변경</li>
			<li onclick="location.href='./dibs';">내찜목록</li>
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
				<c:forEach items="${orderList }" var="order" varStatus="status">
				<c:set var="index" value="${status.index}" />
				<tr>
					<td>
						<img src="${path }/resources/images/image_7.png" class="orderitem_img"/>
						<div class="order_itemContent">
		               		<div class="tag new">NEW</div>
		               		<div class="tag only_b">사업자 전용</div>
			               	<div class="itemName"><span class="shopName">[달콤디저트]</span><input type="hidden" id="product_name" class="product_name" name="product_name" value='${orderList[status.index].product_name }' /> ${order.product_name }</div>
		           	 	</div>
					</td>
					<td><input type="hidden" id="product_quan" class="product_quan" name="product_quan" value='${orderList[status.index].product_quan }' />${order.product_quan }</td>
					<td><input type="hidden" id="product_price" class="product_price" name="product_price" value='${orderList[status.index].product_price }' />${order.product_price }원</td>
					<td><input type="hidden" id="order_date" class="order_date" name="order_date" value='${orderList[status.index].order_date }' />${order.order_date }</td>
					<td id="index_td"><input type="hidden" id="index" class="index" value="${index }"/>${index }</td>
					<td><button type="button" class="detail_btn" onclick="popUp(${index});">배송 상세보기</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="hidden" id="order_send" class="order_send" />
		<ul class="pagingbox">
		<c:if test="${paging.leftArr}">
			<li onclick="location.href='?keyword=${keyword}&pageNum=${paging.sectorStart-1}'"><img src="${path }/resources/images/left_arrow.png" /></li>
		</c:if>
		<c:forEach var='i' begin="${paging.sectorStart}" end="${paging.sectorEnd}">
		<c:choose>
				<c:when test="${i eq paging.pageNum}">
					<li class="active">${i}</li>		
				</c:when>
				<c:otherwise>
					<li onclick="location.href='?keyword=${keyword}&pageNum=${i}'">${i}</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.sectorEnd < paging.totalPage}">
			<li onclick="location.href='?keyword=${keyword}&pageNum=${paging.sectorEnd+1}'"><img src="${path }/resources/images/right_arrow.png" /></li>
		</c:if>
		</ul>
	</div>
	
</div>
<c:import url="../home/sideMenu.jsp" />
<c:import url="../home/footer.jsp"/>
</body>
</html>