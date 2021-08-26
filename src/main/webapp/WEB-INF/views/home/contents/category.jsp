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
<div class="cate_content">
	<div class="categorybox">
		<div class="bigcate">
			<div class="bigcate_item click">
				<img src="${path }/resources/images/icon_cake_off@2x.png" style="width: 58px; height: 58px; margin: 40px auto 20px;"/>
				<div class="text">케이크</div>
			</div>
			<div class="bigcate_item">
				<img src="${path }/resources/images/icon_Bread_off@2x.png" style="width: 68px; height: 38px; margin: 62px auto 28px;"/>
				<div class="text">베이커리</div>
			</div>
			<div class="bigcate_item">
				<img src="${path }/resources/images/icon_croissant_off@2x.png" style="width: 58px; height: 55px; margin: 44px auto 20px;"/>
				<div class="text">생지</div>
			</div>
			<div class="bigcate_item">
				<img src="${path }/resources/images/icon_macarons_off@2x.png" style="width: 62px; height: 48px; margin: 47px auto 20px;"/>
				<div class="text">디저트</div>
			</div>
			<div class="bigcate_item">
				<img src="${path }/resources/images/icon_sandwich_off@2x.png" style="width: 68px; height: 63px; margin: 40px auto 20px;"/>
				<div class="text">샌드위치</div>
			</div>
			<div class="bigcate_item">
				<img src="${path }/resources/images/icon_coffebean_off@2x.png" style="width: 69px; height: 51px; margin: 46px auto 20px;"/>
				<div class="text">원두</div>
			</div>
		</div>
		<div class="midcate">
			<div class="midcate_item click">전체</div>
			<div class="midcate_item">무스케이크</div>
			<div class="midcate_item">쉬폰케이크</div>
			<div class="midcate_item">치즈케이크</div>
			<div class="midcate_item">초코케이크</div>
			<div class="midcate_item">파운드케이크</div>
			<div class="midcate_item">버터케이크</div>
			<div class="midcate_item">롤케이크</div>
			<div class="midcate_item">컵케이크</div>
			<div class="midcate_item">티라미수</div>
			<div class="midcate_item">카스테라</div>
			<div class="midcate_item">크레이프</div>
		</div>
	</div>
	<div class="cateitem_list">
		<div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_1@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_2@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_3@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_4@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_5@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_6@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_7@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_8@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_9@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/donuts.jpg"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/cake@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_3@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_3@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_3@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_3@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	    <div class="itemBox">
	    	<img class="cateItem_img" src="${path }/resources/images/image_3@2x.png"/>
	        <div class="itemTag">
	        	<div class="tag new">NEW</div>
	            <div class="tag best">BEST</div>
	            <div class="tag only_b">사업자 전용</div>
	       </div>
	       <div class="itemName"><span class="shopName">[달콤디저트]</span> 딸기 크레이프</div>
	       <div class="sale_price">
	          <div class="sale">20%</div>
	          <div class="price">8,000원</div>
	          <div class="o_price">10,000원</div>
	       </div>
	       <div class="cateItem_btn">
	          <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	          <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	       </div>
	    </div>
	</div>
	<ul class="pagingbox">
		<li><img src="${path }/resources/images/left_arrow.png" /></li>
		<li class="active">1</li>
		<li>2</li>
		<li>3</li>
		<li><img src="${path }/resources/images/right_arrow.png" /></li>
	</ul>
	
</div>
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>