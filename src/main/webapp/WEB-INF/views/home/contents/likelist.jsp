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
	function loadDibsList() {
		
		var param = document.location.href.split("?pageNum=");
		console.log(param[1]);
		$.ajax({
			type : 'POST'
			,url : '${pageContext.request.contextPath}/dibs/read'
			,data : 
				{
				"pageNum" : param[1]
				}
			,success : function(response) {
				showProductList(response)
			}
			,error : function(err){
				console.log(err)
			}
		
				})
	}
	
	function showProductList(response) {
		var result = '';
		$.each(response,function(index,item) {
			result += '<div class="like_item" data-pid="'+item["product_id"]+'">';
			result += '<img src="${path}/resources/images/icon_checkmark_off.png" class="check"/>';
			result += '<img src="https://'+ item["product_img_url"] + '" class="itemimg"/>'
			result += '<div class="like_itemContent">';
			if (item["product_new"] == true){result += '<div class="tag new">NEW</div>';}
			if (item["product_best"] == true){result += '<div class="tag best">BEST</div>';}
			result += '<div class="itemName"><span class="shopName">'+ item["manager_name"] + '</span>' + item["product_name"] + '</div></div>';
			result += '<div class="item_price"><div class="sale">5%</div><div class="o_price">16,000원</div><div class="price">'+ item["product_price"] +'원</div></div></div></div>';
		})
		$('.like_list').html(result).trigger("create");
	}
	
	

	$(document).ready(function() {
		console.log("dd")	
		loadDibsList();
	})


</script>
</head>

<body>
<c:import url="../top.jsp"/>
<div class="C_content">
	<div class="contentTxt">내찜목록</div>
	<div class="pagelist">
		<ul>
			<li onclick="location.href='./loginMyPage';">정보변경</li>
			<li onclick="location.href='./dibs';"class="click">내찜목록</li>
			<li onclick="location.href='./bags';">장바구니</li>
			<li onclick="location.href='./orderlist';">주문내역</li>
			<li onclick="location.href='./qnalist?pageNum=1';">문의내역</li>
		</ul>
	</div>
	<div class="allcheck">
		<img src="${path}/resources/images/icon_checkmark_off.png" class="checkonoff"  style="vertical-align: sub;"/>
		전체선택
	</div>
	<div style="display:flex;">
		<div class="like_list">
			
		</div>
		
		
		<div class="nokakao">
			<div style="color:#111111; font-size:22px; font-weight:bold; margin-bottom:20px; font-family:'NanumSquare'">아직 <span style="color:#e13517;">사업자 인증</span>을 안받으셨나요?</div>
			<div style="color:#333333; line-height:1.43; width:260px; margin:0 auto 50px;">인증을 받으셔야만 사업자 전용 디저트 구매가 가능합니다.</div>
			<button class="gokakao">인증하러가기</button>
		</div>
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
	<div class="like_btns">
		<button style="color:#e13517; border:1px solid #e13517; background-color:#ffffff;">삭제하기</button>
		<button style="background-color:#e13517; color:#ffffff;">장바구니</button>
	</div>
	
</div>

<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>