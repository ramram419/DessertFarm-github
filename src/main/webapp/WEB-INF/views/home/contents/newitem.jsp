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
   
   <script>
      $(document).ready(function(){
         $(window).scroll( function() {
            if($(this).scrollTop() > 300 ) {
               $('.sideMenu').fadeIn();
            }else {
               $('.sideMenu').fadeOut();
            }
         });
         
      })
   </script>
</head>
<body>
<c:import url="../top.jsp"/>
<div class="new_content">
	<div class="title">신상품</div>
	<div class="newlist">
		<div class="count">총 <span>20</span>개의 상품</div>
		<div class="listcate">
			<div class="click">추천순</div>
			<div>높은가격순</div>
			<div>낮은가격순</div>
		</div>
	</div>
	<div class="newitem_list">
		<c:forEach var="item" items="${newProductList}">
		<div class="itemBox">
	    	<img class="cateItem_img" src="https://${item.product_img_url}"/>
	        <div class="itemTag">
	        <c:if test="${item.product_new}">
	        	<div class="tag new">NEW</div>
	        </c:if>
	        <c:if test="${item.product_best}">
	            <div class="tag best">BEST</div>
	        </c:if>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName" onclick="location.href='${path}/product/${item.product_id}'">[${item.manager_name}]</span> ${item.product_name}</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">${item.product_price}</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs" data-id="${item.product_id}"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	</c:forEach>
	    

	</div>
	<ul class="pagingbox">
		<c:if test="${paging.leftArr}">
			<li onclick="location.href='?pageNum=${paging.sectorStart-1}'"><img src="${path }/resources/images/left_arrow.png" /></li>
		</c:if>
		<c:forEach var='i' begin="${paging.sectorStart}" end="${paging.sectorEnd}">
		<c:choose>
				<c:when test="${i eq paging.pageNum}">
					<li class="active">${i}</li>		
				</c:when>
				<c:otherwise>
					<li onclick="location.href='?pageNum=${i}'">${i}</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.sectorEnd < paging.totalPage}">
			<li onclick="location.href='?pageNum=${paging.sectorEnd+1}'"><img src="${path }/resources/images/right_arrow.png" /></li>
		</c:if>
	</ul>
	
</div>
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>