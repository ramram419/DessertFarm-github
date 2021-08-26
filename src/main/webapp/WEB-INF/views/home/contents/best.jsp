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
<div class="best_content">
	<div class="best_store">
		<div class="best_title">베스트 상점</div>
		<div class="best_sub">이번주 베스트 상점 3위를 바로 확인해보세요!</div>
		<div style="margin-top: 60px;">
			<div class="best_storeitem">
				<div class="num">1</div>
				<div class="store_info">
					<img src="${path }/resources/images/image_7@2x.png"/>
					달콤디저트
				</div>
				<div class="imglist">
					<img src="${path }/resources/images/image_8@2x.png"/>
					<img src="${path }/resources/images/image_8@2x.png"/>
					<img src="${path }/resources/images/image_8@2x.png"/>
				</div>
				<div class="store_btn">
					사이트 바로가기
					<img src="${path }/resources/images/arrow_right_c.png"/>
				</div>
			</div>
			
			<div class="best_storeitem">
				<div class="num">2</div>
				<div class="store_info">
					<img src="${path }/resources/images/image_7@2x.png"/>
					달콤디저트
				</div>
				<div class="imglist">
					<img src="${path }/resources/images/image_8@2x.png"/>
					<img src="${path }/resources/images/image_8@2x.png"/>
					<img src="${path }/resources/images/image_8@2x.png"/>
				</div>
				<div class="store_btn">
					사이트 바로가기
					<img src="${path }/resources/images/arrow_right_c.png"/>
				</div>
			</div>
			
			<div class="best_storeitem">
				<div class="num">3</div>
				<div class="store_info">
					<img src="${path }/resources/images/image_7@2x.png"/>
					달콤디저트
				</div>
				<div class="imglist">
					<img src="${path }/resources/images/image_8@2x.png"/>
					<img src="${path }/resources/images/image_8@2x.png"/>
					<img src="${path }/resources/images/image_8@2x.png"/>
				</div>
				<div class="store_btn">
					사이트 바로가기
					<img src="${path }/resources/images/arrow_right_c.png"/>
				</div>
			</div>
		</div>
	</div>
	<div class="best_item">
		<div class="best_title">베스트 상품</div>
		<div class="best_sub">이번주 베스트 상품을 바로 확인해보세요!</div>
		<div class="best_itemimg">
			<img src="${path }/resources/images/image_1@2x.png"/>
			<img src="${path }/resources/images/image_2@2x.png"/>
			<img src="${path }/resources/images/image_3@2x.png"/>
			<img src="${path }/resources/images/image_4@2x.png"/>
			<img src="${path }/resources/images/image_5@2x.png"/>
			<img src="${path }/resources/images/image_6@2x.png"/>
			<img src="${path }/resources/images/image_7@2x.png"/>
			<img src="${path }/resources/images/image_8@2x.png"/>
			<img src="${path }/resources/images/image_9@2x.png"/>
			<img src="${path }/resources/images/cake@2x.png"/>
			<img src="${path }/resources/images/donuts.jpg"/>
			<img src="${path }/resources/images/image_8@2x.png"/>
			<img src="${path }/resources/images/image_8@2x.png"/>
			<img src="${path }/resources/images/image_8@2x.png"/>
			<img src="${path }/resources/images/image_8@2x.png"/>
			<img src="${path }/resources/images/image_8@2x.png"/>
			<img src="${path }/resources/images/image_8@2x.png"/>
			<img src="${path }/resources/images/image_8@2x.png"/>
			<img src="${path }/resources/images/image_8@2x.png"/>
			<img src="${path }/resources/images/image_8@2x.png"/>
		</div>
		<div class="item_btn">
			상품 구매를 원하시나요? <span>지금 당장 확인하러 가보세요!</span>
			<img src="${path }/resources/images/arrow_right_c.png"/>
		</div>
	</div>
</div>
<div class="sideMenu">
   <div class="sideMenu_box">
      <img src="${path }/resources/images/icon_star@2x.png" style="margin-top:18px;"/>
      상점즐겨찾기
   </div>
   <div class="sideMenu_box">
      <img src="${path }/resources/images/shopping-cart@2x.png"/>
      장바구니
   </div>
   <div class="sideMenu_box">
      <img src="${path }/resources/images/icon_heart@2x.png"/>
      찜리스트
   </div>
   <div class="sideMenu_box">
      <img src="${path }/resources/images/chat@2x.png"/>
      카카오톡 상담
   </div>
   <div class="sideMenu_box">
      <img src="${path }/resources/images/icon_phonecall_off@2x.png"/>
      고객센터
   </div>
   <div class="TOP" onclick="$('html, body').animate({scrollTop: '0'}, 1000);">
      <img src="${path }/resources/images/top@2x.png"/>
      TOP
   </div>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>