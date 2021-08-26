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
	<div class="contentTxt">장바구니</div>
	<div class="pagelist">
		<ul>
			<li onclick="location.href='./loginMyPage';">마이페이지</li>
			<li onclick="location.href='./like';">내찜목록</li>
			<li onclick="location.href='./bags';" class="click">장바구니</li>
			<li onclick="location.href='./orderlist';">주문내역</li>
			<li onclick="location.href='./qnalist';">문의내역</li>
		</ul>
	</div>
	<div class="allcheck">
		<img src="${path}/resources/images/icon_checkmark_off.png" class="checkonoff"  style="vertical-align: sub;" />
		전체선택
	</div>
	<div style="display:flex;">
		<div class="like_list">
			<div class="like_item">
				<img src="${path}/resources/images/icon_checkmark_off.png" class="check"/>
				<img src="${path }/resources/images/image_7.png" class="itemimg"/>
				<div class="like_itemContent">
               		<div class="tag new">NEW</div>
               		<div class="tag only_b">사업자 전용</div>
					<div class="itemName"><span class="shopName">[달콤디저트]</span> 크로무슈</div>
           	 	</div>
           	 	<div class="item_price">
               		<div class="sale">5%</div>
               		<div class="o_price">16,000원</div>
               		<div class="price">15,200원</div>
            	</div>
			</div>
			<div class="like_item">
				<img src="${path}/resources/images/icon_checkmark_off.png" class="check"/>
				<img src="${path }/resources/images/image_7.png" class="itemimg"/>
				<div class="like_itemContent">
               		<div class="tag new">NEW</div>
               		<div class="tag only_b">사업자 전용</div>
	               	<div class="itemName"><span class="shopName">[달콤디저트]</span> 크로무슈</div>
           	 	</div>
				<div class="item_price">
               		<div class="sale">5%</div>
               		<div class="o_price">16,000원</div>
               		<div class="price">15,200원</div>
            	</div>
			</div>
		</div>
		
		<div class="nokakao">
			<div style="color:#111111; font-size:22px; font-weight:bold; margin-bottom:20px; font-family:'NanumSquare'">아직 <span style="color:#e13517;">사업자 인증</span>을 안받으셨나요?</div>
			<div style="color:#333333; line-height:1.43; width:260px; margin:0 auto 50px;">인증을 받으셔야만 사업자 전용 디저트 구매가 가능합니다.</div>
			<div class="bags_btns">
				<button style="color:#e13517; border:1px solid #e13517; background-color:#ffffff;">삭제하기</button>
				<button style="background-color:#e13517; color:#ffffff;">주문하기</button>
			</div>
		</div>
	</div>
	
</div>
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>