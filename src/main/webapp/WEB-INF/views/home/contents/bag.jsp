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
   <style type="text/css">
   		.all_check_label {
   			cursor: pointer;
   		}
   		
   		.all_check_label .all_check-icon {
   			display: inline-block;
   			width: 40px;
   			height: 22px;
   			background: url("${path}/resources/images/icon_checkmark_off.png") no-repeat;
   		}
   		
   		.all_check_label input[type="checkbox"] {
   			display: none;
   		}
   		
   		.all_check_label input[type="checkbox"]:checked + .all_check-icon{
   			background: url("${path}/resources/images/icon_checkmark_on.png") no-repeat;
   		}
   		
   		.sub_check_label {
   			cursor: pointer;
   		}
   		
   		.sub_check_label .check-icon {
   			display: inline-block;
   			width: 35px;
   			height: 27px;
   			background: url("${path}/resources/images/icon_checkmark_off.png") no-repeat;
   		}
   		
   		.sub_check_label input[type="checkbox"] {
   			display: none;
   		}
   		
   		.sub_check_label input[type="checkbox"]:checked + .check-icon {
   			background: url("${path}/resources/images/icon_checkmark_on.png") no-repeat;
   		}
   </style>
   
   <script type="text/javascript">
   		var index = $('.index').val();
   		var indexarr = new Array();
   		var pdmap = new Map();
   		var pdname = new Array();
   		var pdquan = new Array();
   		var pdprice = new Array();
   		
   		function allCheck() {
   			if($(".all_check").prop("checked")){
   				$("input[name=sub_check]").prop("checked", true);
   				var ifChecked = $("input[name=sub_check]").is(":checked");
   				console.log(ifChecked);
   			}else {
   				$("input[name=sub_check]").prop("checked", false);
   				var ifChecked = $("input[name=sub_check]").is(":checked");
   				console.log(ifChecked);
   			}
   		}
   		
   		function subCheck(index){
   			$('.index').val(index);
   			var ind = $('.index').val();
   			console.log(ind);
	   		$("input[name=sub_check]:checked").each(function (){
   				indexarr.push(ind);
   				return false;
   			});
	   		console.log(indexarr);
   			return indexarr;
   		}
   		
   		function order(index) {
   			var index = $('.index').val();
   			console.log(index);
   			console.log(indexarr);
   			
   			for(var i=0;i<indexarr.length;i++){
	   			var product_name = $('.bl_p_name').eq(indexarr[i]).val();
	   			var product_quan = $('.bl_p_quan').eq(indexarr[i]).val();
	   			var product_price = $('.bl_p_price').eq(indexarr[i]).val();
	   			console.log(product_name);
	   			
	   			pdname.push(product_name);
	   			pdquan.push(product_quan);
	   			pdprice.push(product_price);
	   			
	   			pdmap.set("product_name", pdname);
	   			pdmap.set("product_quan", pdquan);
	   			pdmap.set("product_price", pdprice);
   			}
   			console.log(pdname);
   			console.log(pdquan);
   			console.log(pdprice);
			$('.pdname').val(pdname);
			$('.pdquan').val(pdquan);
			$('.pdprice').val(pdprice);
	   		var bFrm = document.bFrm;
	   		bFrm.submit();
	   	}
   </script>
</head>
<body>
<c:import url="../top.jsp"/>
<div class="C_content">
	<div class="contentTxt">장바구니</div>
	<div class="pagelist">
		<ul>
			<li onclick="location.href='./loginMyPage';">정보변경</li>
			<li onclick="location.href='./dibs';">내찜목록</li>
			<li onclick="location.href='./bags';" class="click">장바구니</li>
			<li onclick="location.href='./orderlist';">주문내역</li>
			<li onclick="location.href='./qnalist?pageNum=1';">문의내역</li>
		</ul>
	</div>
	
	<!-- All CheckBox -->
	<div class="allcheck">
		<label class="all_check_label">
			<input type="checkbox" class="all_check" name="all_check" value="all_check" onclick="allCheck();"/>
			<i class="all_check-icon"></i>
		</label>
		전체선택
	</div>
	
	<form action="bag/order" name="bFrm" method="POST">
	<div style="display:flex;">
		<div class="like_list">
		<c:forEach items="${basketList }" var="bl" varStatus="status">
		<c:set var="index" value="${status.index}" />
			<div class="like_item">
			
			<!-- Sub CheckBox -->
				<label class="sub_check_label">
					<input type="checkbox" name="sub_check" onclick="subCheck(${index});" />
					<i class="check-icon"></i>
				</label>
				
				<img src="${path }/resources/images/image_7.png" class="itemimg"/>
				
				<div class="like_itemContent">
               		<div class="tag new">NEW</div>
               		<div class="tag only_b">사업자 전용</div>
					<div class="itemName">
						<span class="shopName">[달콤디저트]</span>
						<input type="hidden" id="bl_p_name" class="bl_p_name" name="bl_p_name" value="${basketList[status.index].product_name }" />${bl.product_name }
					</div>
           		</div>
           		
           		<div class="item_quan">
           			<input type="hidden" id="bl_p_quan" class="bl_p_quan" name="bl_p_quan" value="${basketList[status.index].product_quan}" />
           		</div>
           	 
           	 	<div class="item_price">
               		<div class="sale">5%</div>
               		<div class="o_price">16,000원</div>
               		<div class="price"><input type="hidden" id="bl_p_price" class="bl_p_price" name="bl_p_price" value="${basketList[status.index].product_price}" />${bl.product_price }원</div>
            	</div>
            	<input type="hidden" id="index" class="index" value="${index }"/>
            	<input type="hidden" class="pdname" name="pdname" />
            	<input type="hidden" class="pdquan" name="pdquan" />
            	<input type="hidden" class="pdprice" name="pdprice" />
            	<input type="hidden" class="pdmap" name="pdmap" />
			</div>
		</c:forEach>
		</div>
		
		<div class="nokakao">
			<div style="color:#111111; font-size:22px; font-weight:bold; margin-bottom:20px; font-family:'NanumSquare'">아직 <span style="color:#e13517;">사업자 인증</span>을 안받으셨나요?</div>
			<div style="color:#333333; line-height:1.43; width:260px; margin:0 auto 50px;">인증을 받으셔야만 사업자 전용 디저트 구매가 가능합니다.</div>
			<div class="bags_btns">
				<button style="color:#e13517; border:1px solid #e13517; background-color:#ffffff;">삭제하기</button>
				<button type="button" style="background-color:#e13517; color:#ffffff;" onclick="order(${index});">주문하기</button>
			</div>
		
		</div>
	</div>
	</form>
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
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>