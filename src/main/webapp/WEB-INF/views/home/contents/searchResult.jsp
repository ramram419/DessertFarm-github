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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
   <style type="text/css">
   	.search_icon{
   		margin-top: -32px !important;
   	}
   </style>
</head>
<body>
<c:import url="../top.jsp" />
<div class="cate_content">
	<div class="cateitem_list">
		<c:forEach var="item" items="${searchList}">
			<div class="itemBox">
		    	<img class="cateItem_img" src="https://${item.product_img_url}"/>
		        <div class="itemTag">
		        	<div class="tag new">NEW</div>
		            <div class="tag best">BEST</div>
		            <div class="tag only_b">사업자 전용</div>
		       </div>
		       <div class="itemName"><span class="shopName">[${item.manager_name}]</span> ${item.product_name}</div>
		       <div class="sale_price">
		          <div class="sale">20%</div>
		          <div class="price">${item.product_price}</div>
		          <div class="o_price">10,000원</div>
		       </div>
		       <div class="cateItem_btn">
		          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
		          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
		       </div>
		    </div>
		</c:forEach>
	</div>
	
	<div class="cate_content">
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
<c:import url="../sideMenu.jsp" />
</body>
</html>