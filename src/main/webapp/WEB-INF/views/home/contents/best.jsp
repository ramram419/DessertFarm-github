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
		<c:forEach var="bp" items="${bestShopList}" begin="0" end="2" varStatus="status">
			<div class="best_storeitem">
				<div class="num">${status.index+1}</div>
				<div class="store_info">
					<img src="${path }/resources/images/image_7@2x.png"/>
					${bp.manager_name}
				</div>
				<div class="imglist">
				<c:forTokens var="img" items="${bp.product_img_url}" delims=",">
					<img src="https://${img}"/>
					</c:forTokens>
				</div>
				<a href="${bp.manager_website}"><div class="store_btn">
					사이트 바로가기
					<img src="${path }/resources/images/arrow_right_c.png"/>
				</div></a>
					
			</div>
		</c:forEach>	
			
		</div>
	</div>
	<div class="best_item">
		<div class="best_title">베스트 상품</div>
		<div class="best_sub">이번주 베스트 상품을 바로 확인해보세요!</div>
		<div class="best_itemimg">
		<c:forEach var="bpl" items="${bestProductList}">
				<a href="${path}/product/${bpl.product_id}"><img src="https://${bpl.product_img_url}"/></a>
		</c:forEach>
			
		</div>
		<div class="item_btn">
			상품 구매를 원하시나요? <span>지금 당장 확인하러 가보세요!</span>
			<img src="${path }/resources/images/arrow_right_c.png"/>
		</div>
	</div>
</div>
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>