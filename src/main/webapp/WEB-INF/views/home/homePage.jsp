<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
   <title>DessertFarm</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
   <link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
   
   <script>
      $(document).ready(function(){
         $(window).scroll( function() {
            if($(this).scrollTop() > 300 ) {
               $('.sideMenu').fadeIn();
            }else {
               $('.sideMenu').fadeOut();
            }
         });
         
         
         const swiper = new Swiper('.swiper-container', {
        	  loop: true, 
        	  autoplay: {
                delay: 2500,
                disableOnInteraction: false,
              },
        	  pagination: {
       		    el: '.swiper-pagination',
       		  },
       		  navigation: {
       		    nextEl: '.swiper-button-next',
       		    prevEl: '.swiper-button-prev',
       		  }
       	});
         
      })
   </script>
</head>
<body>
<c:import url="./top.jsp"/>
<div class="content">
   <!-- 메인슬라이드 -->
   <div class="mainSlide swiper-container">
   	  <div class="swiper-wrapper">
	      <div class="slideImg swiper-slide" style="background:url('${path}/resources/images/main_image.png') no-repeat;">
	         <div class="slideText">
	            <p class="text1">
	               어디서 주문할까?<br>
	               <span>디저트 팜에서 비교해보세요!</span>
	            </p>
	            <p class="text2">
	               크로와상 생지와 와플팬을 응용한 크로플<br>
	               부드러운 식감의 크로플을 여러분께 소개합니다.
	            </p>
	         </div>
	      </div>
	      
	      <div class="slideImg swiper-slide" style="background:url('${path}/resources/images/main_image.png') no-repeat;">
	         <div class="slideText">
	            <p class="text1">
	               어디서 주문할까?<br>
	               <span>디저트 팜에서 비교해보세요!</span>
	            </p>
	            <p class="text2">
	               크로와상 생지와 와플팬을 응용한 크로플<br>
	               부드러운 식감의 크로플을 여러분께 소개합니다.
	            </p>
	         </div>
	      </div>
	      
	      <div class="slideImg swiper-slide" style="background:url('${path}/resources/images/main_image.png') no-repeat;">
	         <div class="slideText">
	            <p class="text1">
	               어디서 주문할까?<br>
	               <span>디저트 팜에서 비교해보세요!</span>
	            </p>
	            <p class="text2">
	               크로와상 생지와 와플팬을 응용한 크로플<br>
	               부드러운 식감의 크로플을 여러분께 소개합니다.
	            </p>
	         </div>
	      </div>
	      
      </div>
      
	  <div class="swiper-pagination"></div>
	
	  <div class="swiper-button-prev" style="left:200px;"></div>
	  <div class="swiper-button-next" style="right: 200px;"></div>
   </div>
   
   <!-- 할인상품 -->
   <div class="saleSlide">
      <div class="saleSlide_text">이달의 <span>할인상품</span>!</div>
	      <div class="slideList">
	         <div class="item_circle ">
	            <div class="sale_img"  style="background:url('${path }/resources/images/donuts.jpg') no-repeat center; background-size:170px;"></div>
	            <p>도넛</p>
	         </div>
	         <div class="item_circle">
	            <div class="sale_img" style="background:url('${path }/resources/images/image_3@2x.png') no-repeat; background-size:170px;"></div>
	            <p>딸기 크레이프</p>
	         </div>
	         <div class="item_circle">
	            <div class="sale_img select" style="background:url('${path }/resources/images/image_6@2x.png') no-repeat; background-position:-9px 0;"></div>
	            <p>크로플</p>
	         </div>
	         <div class="item_circle">
	            <div class="sale_img" style="background:url('${path }/resources/images/image_7@2x.png') no-repeat; background-size:170px;"></div>
	            <p>크로와상</p>
	         </div>
	         <div class="item_circle">
	            <div class="sale_img" style="background:url('${path }/resources/images/image_1@2x.png') no-repeat; background-size:170px;"></div>
	            <p>다쿠아즈</p>
	         </div>
	      </div>
      </div>
   
	   <!-- 인기상품 -->
	   <div class="bestItem">
	      <div class="bestItem_text">인기 상품</div>
	      <div class="bestItem_List">
	         <div class="itemBox">
	            <img class="bestItem_img" src="${path }/resources/images/image_7@2x.png"/>
	            <div class="itemTag">
	               <div class="tag best">BEST</div>
	               <div class="tag only_b">사업자 전용</div>
	            </div>
	            <div class="itemName"><span class="shopName">[달콤디저트]</span> 버터 크로와상</div>
	            <div class="sale_price">
	               <div class="sale">20%</div>
	               <div class="price">16,000원</div>
	               <div class="o_price">20,000원</div>
	            </div>
	            <div class="bestItem_btn">
	               <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	               <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	            </div>
	         </div>
	         
	         <div class="itemBox">
	            <img class="bestItem_img" src="${path }/resources/images/cake@2x.png"/>
	            <div class="itemTag">
	               <div class="tag best">BEST</div>
	               <div class="tag only_b">사업자 전용</div>
	            </div>
	            <div class="itemName"><span class="shopName">[달콤디저트]</span> 쿠앤크 케이크</div>
	            <div class="sale_price">
	               <div class="price">13,500원</div>
	            </div>
	            <div class="bestItem_btn">
	               <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	               <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	            </div>
	         </div>
	         
	         <div class="itemBox">
	            <img class="bestItem_img" src="${path }/resources/images/image_6@2x.png"/>
	            <div class="itemTag">
	               <div class="tag new">NEW</div>
	               <div class="tag best">BEST</div>
	               <div class="tag only_b">사업자 전용</div>
	            </div>
	            <div class="itemName"><span class="shopName">[달콤디저트]</span> 크로플</div>
	            <div class="sale_price">
	               <div class="sale">20%</div>
	               <div class="price">20,000원</div>
	               <div class="o_price">25,000원</div>
	            </div>
	            <div class="bestItem_btn">
	               <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	               <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	            </div>
	         </div>
	         
	         <div class="itemBox">
	            <img class="bestItem_img" src="${path }/resources/images/image_8@2x.png"/>
	            <div class="itemTag">
	               <div class="tag new">NEW</div>
	               <div class="tag best">BEST</div>
	               <div class="tag only_b">사업자 전용</div>
	            </div>
	            <div class="itemName"><span class="shopName">[달콤디저트]</span> 마카롱</div>
	            <div class="sale_price">
	               <div class="price">10,000원</div>
	            </div>
	            <div class="bestItem_btn">
	               <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	               <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	            </div>
	         </div>
	         
	         <div class="itemBox">
	            <img class="bestItem_img" src="${path }/resources/images/image_1@2x.png"/>
	            <div class="itemTag">
	               <div class="tag new">NEW</div>
	               <div class="tag only_b">사업자 전용</div>
	            </div>
	            <div class="itemName"><span class="shopName">[달콤디저트]</span> 다쿠아즈</div>
	            <div class="sale_price">
	               <div class="sale">5%</div>
	               <div class="price">15,200원</div>
	               <div class="o_price">16,000원</div>
	            </div>
	            <div class="bestItem_btn">
	               <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	               <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	            </div>
	         </div>
	         
	         <div class="itemBox">
	            <img class="bestItem_img" src="${path }/resources/images/image_9@2x.png"/>
	            <div class="itemTag">
	               <div class="tag new">NEW</div>
	               <div class="tag only_b">사업자 전용</div>
	            </div>
	            <div class="itemName"><span class="shopName">[달콤디저트]</span> 크로무슈</div>
	            <div class="sale_price">
	               <div class="price">14,000원</div>
	            </div>
	            <div class="bestItem_btn">
	               <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	               <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	            </div>
	         </div>
	         
	         <div class="itemBox">
	            <img class="bestItem_img" src="${path }/resources/images/image_2@2x.png"/>
	            <div class="itemTag">
	               <div class="tag new">NEW</div>
	               <div class="tag best">BEST</div>
	               <div class="tag only_b">사업자 전용</div>
	            </div>
	            <div class="itemName"><span class="shopName">[달콤디저트]</span> 에그타르트</div>
	            <div class="sale_price">
	               <div class="price">22,000원</div>
	            </div>
	            <div class="bestItem_btn">
	               <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	               <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	            </div>
	         </div>
	         
	         <div class="itemBox">
	            <img class="bestItem_img" src="${path }/resources/images/image_3@2x.png"/>
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
	            <div class="bestItem_btn">
	               <div class="add_dibs"><img src="${path }/resources/images/icon_star.png" /> 찜하기</div>
	               <div class="add_bag"><img src="${path }/resources/images/icon_heart.png"/> 장바구니</div>
	            </div>
	         </div>
	      </div>
	   </div>
   
	   <div class="about">
	      <div class="abouthead_text">ABOUT</div>
	      <div class="abouthead_subText">디저트팜에 대해 알려드립니다.</div>
	      <div class="aboutBox">
	         <div class="aboutImg" style="background:url('${path}/resources/images/image_4@2x.png') no-repeat;"></div>
	         <div class="about1">
	            <p class="about_text">브랜드스토리</p>
	            <p class="about_subText">디저트팜을 소개합니다.</p>
	            <div class="about_btn"><img src="${path }/resources/images/arrow_right.png"/></div>
	         </div>
	         
	         <div class="aboutImg" style="background:url('${path}/resources/images/image_5@2x.png') no-repeat;">
	         </div>
	         <div class="about2">
	            <p class="about_text">협력업체</p>
	            <p class="about_subText">디저트팜과 함께합니다.</p>
	            <div class="about_btn"><img src="${path }/resources/images/arrow_right.png"/></div>
	         </div>
	      </div>
  		</div>
   
	   <div class="benefit">
	      <div class="benefitBox">
	         <img src="${path }/resources/images/user@2x.png"/>
	         <div class="benefit_text">신규 회원혜택</div>
	         <div class="benefit_subtext">신규 회원가입시 2,000원 쿠폰을 드립니다.</div>
	      </div>
	      <div class="benefitBox">
	         <img src="${path }/resources/images/delivery-truck@2x.png"/>
	         <div class="benefit_text">무료배송</div>
	         <div class="benefit_subtext">3만원 이상 구매시 무료배송 합니다.</div>
	      </div>
	      <div class="benefitBox">
	         <img src="${path }/resources/images/gift-box@2x.png"/>
	         <div class="benefit_text">샘플 구매</div>
	         <div class="benefit_subtext">제품이 어떤지 샘플부터 구매해보세요.</div>
	      </div>
	   </div>
   
	   <div class="sample_order">
	      <div class="sample_textbox">
	         <div class="sample_text">각 업체 샘플 주문 OPEN!</div>
	         <div class="sample_subtext">
	            이제는 찾아다니지 않으셔도 됩니다!! 디저트팜에서 샘풀 주문이 가능한 업체를 볼 수 있습니다.<br>
	            다양한 디저트를 확인해보고 확인해보고 싶은 디저트를 샘플 주문 해보세요!
	         </div>
	         <div class="sample_btn">view more<img src="${path }/resources/images/up-arrow.png"/></div>
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
<c:import url="./footer.jsp"/>
</body>
</html>