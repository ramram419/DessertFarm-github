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
   	var k = [['무스케이크','K011'],['쉬폰케이크','K012'],['치즈케이크','K013'],['초코케이크','K001'],['파운드케이크','K002'],['버터케이크','K003'],['스펀지케이크','K004'],['롤케이크','K005'],['컵케이크','K006'],
   		['티라미수','K007'],['카스텔라','K08'],['크레이프','K09'],['타르트','K010']]
   	var b = [['크로플','B001'],['에그타르트','B002'],['마들렌','B003'],['머핀','B004'],['도넛','B005'],['쿠키','B006'],['플레인','B007'],
   		['베이글','B008'],['크로칸슈','B009'],['몽블랑','B010'],['브라우니','B011'],['식빵','B012'],['샌드위치','B013'],['크로아상','B014'],
   		['와플','B015'],['스콘','B016']]
   	var s = [['크로아상','S001'],['타르트/파이','S002'],['스콘/볼','S003'],['식빵','S004']]
   	var d = [['마카롱','D001'],['뚱카롱','D002'],['다쿠아즈','D003'],['오믈렛','D004'],['초콜렛','D005'],['슈크림','D006'],['아이스크림','D007']]
   	var c = [['샌드위치','C001'],['치아바타','C002'],['크로크무슈','C003']];
   	var w = [['원두','W001']]
   
      $(document).ready(function(){
         $(window).scroll( function() {
            if($(this).scrollTop() > 300 ) {
               $('.sideMenu').fadeIn();
            }else {
               $('.sideMenu').fadeOut();
            }
         });
         
      })
      
      $(document).ready(function() {
    	  $('.bigcate_item').removeClass('click');
    	  var path = (window.location.pathname).split('/');
    	  var category = path[3];
    	  category = category.toLowerCase();
    	  var loop;
    	  
    	  if (category == 'k') {
    		  loop = k;
    	  } else if (category == 'b') {
    		  loop = b;
    	  } else if (category == 's') {
    	      loop = s;
    	  } else if (category == 'd') {
    		  loop = d;
    	  } else if (category == 'c') {
    		  loop = c;
    	  } else if (category == 'w') {
    		  loop = w;
    	  }
    	  
    	  console.log(loop)
    	  
    	  $('.'+category).addClass('click');
    	  
    	  	$('.midcate').empty();
    	  	var result = '<div class="midcate_item">전체</div>'
    	  	$('.midcate').append(result);
    	  	for (var i=0; i<loop.length; i++) {
    	 		result =''
    	  		result += '<a href="${path}/category/' + category.toUpperCase()+ "/" + loop[i][1] + "?pageNum=1" +'"<div class="midcate_item '+ loop[i][1] +'">' + loop[i][0] +'</div></a>'
    	 		$('.midcate').append(result);
    	 	}
    	  	
    	  	if (path[4] != null) {
    	  		$('.'+path[4]).addClass("click")
    	  	}
    	  	
    	  
     
    	 	
    	  
      })
   </script>
   

</head>
<body>
<c:import url="../top.jsp"/>
<div class="cate_content">
	<div class="categorybox">
		<div class="bigcate">
			<a href="${path}/category/K?pageNum=1">
			<div class="bigcate_item K click">
				<img src="${path }/resources/images/icon_cake_off@2x.png" style="width: 58px; height: 58px; margin: 40px auto 20px;"/>
				<div class="text">케이크</div>
			</div>
			</a>
			<a href="${path}/category/B?pageNum=1">
			<div class="bigcate_item B">
				<img src="${path }/resources/images/icon_Bread_off@2x.png" style="width: 68px; height: 38px; margin: 62px auto 28px;"/>
				<div class="text">베이커리</div>
			</div>
			</a>
			<a href="${path}/category/S?pageNum=1">
			<div class="bigcate_item S">
				<img src="${path }/resources/images/icon_croissant_off@2x.png" style="width: 58px; height: 55px; margin: 44px auto 20px;"/>
				<div class="text">생지</div>
			</div>
			</a>
			<a href="${path}/category/D?pageNum=1">
			<div class="bigcate_item D">
				<img src="${path }/resources/images/icon_macarons_off@2x.png" style="width: 62px; height: 48px; margin: 47px auto 20px;"/>
				<div class="text">디저트</div>
			</div>
			</a>
			
				<div class="bigcate_item C?pageNum=1">
					<a href="${path}/category/C">
					<img src="${path }/resources/images/icon_sandwich_off@2x.png" style="width: 68px; height: 63px; margin: 40px auto 20px;"/>
					<div class="text">샌드위치</div>
					</a>
				</div>
			
			<a href="${path}/category/W?pageNum=1">
			<div class="bigcate_item W">
				<img src="${path }/resources/images/icon_coffebean_off@2x.png" style="width: 69px; height: 51px; margin: 46px auto 20px;"/>
				<div class="text">원두</div>
			</div>
			</a>
		</div>
		<div class="midcate">
			<div class="midcate_item">전체</div>
			<div class="midcate_item click">무스케이크</div>
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
	<c:forEach var="item" items="${productList}">
		<div class="itemBox">
	    	<img class="cateItem_img" src="${path }${item.pro_img_server}"/>
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
	
	<ul class="pagingbox">
		<c:if test="${paging.leftArr}">
			<a href="?pageNum=${paging.sectorStart-1}"><li><img src="${path }/resources/images/left_arrow.png" /></li></a>
		</c:if>
		<c:forEach var='i' begin="${paging.sectorStart}" end="${paging.sectorEnd}">
		<c:choose>
				<c:when test="${i eq paging.pageNum}">
					<li class="active">${i}</li>		
				</c:when>
				<c:otherwise>
					<a href="?pageNum=${i}"><li>${i}</li></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.sectorEnd < paging.totalPage}">
		<a href="?pageNum=${paging.sectorEnd+1}"><li><img src="${path }/resources/images/right_arrow.png" /></li></a>
		</c:if>
	</ul>
	
</div>
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>