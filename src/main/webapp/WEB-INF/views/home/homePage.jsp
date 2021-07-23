<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
	<title>DessertFarm</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<script>
		$(window).scroll( function() {
			if($(this).scrollTop() > 300 ) {
				$('.sideMenu').fadeIn();
			}else {
				$('.sideMenu').fadeOut();
			}
		});
	</script>
</head>
<body>

	<div class="header">
		<div class="header_top">
			<div class="top_menu">
				<p><a href="<c:url value='/login' />" >로그인</a>|</p>
             	<p><a href="<c:url value='/joinForm' />">회원가입</a>|</p>
             	<p><a href="<c:url value='/myPage' />">마이페이지</a></p>
             </div>
		</div>
		<div class="header_mid">
			<div class="logo"></div>
			<div class="search_box">
				<input type="text" class="search_text"/>
				<div class="search_icon"></div>
			</div>
		</div>
		<div class="header_btm">
			<div class="menu_box">
				<div class="cate"><img src="${path}/resources/images/icon_bars@2x.png" />전체 카테고리</div>
				<div class="menu">
					<ul>
                		<li><a>브랜드스토리</a></li>
                		<li><a>신상품</a></li>
                		<li><a>베스트상품/상점</a></li>
                		<li><a>이달의 <span style="color:#ff6363;">할인</span></a></li>
                		<li><a>샘플 상품 주문</a></li>
            		</ul>
				</div>
			</div>
			<div class="menulist">
				<ul>
					<li class="category">
						카테고리
						<ul class="catelist">
							<li><img src="${path}/resources/images/icon_cake_on@2x.png"/>케이크</li>
							<li><img src="${path}/resources/images/icon_Bread_off@2x.png"/>베이커리</li>
							<li><img src="${path}/resources/images/icon_croissant_off@2x.png"/>생지</li>
							<li><img src="${path}/resources/images/icon_macarons_off@2x.png"/>디저트</li>
							<li><img src="${path}/resources/images/icon_sandwich_off@2x.png"/>샌드위치</li>
							<li><img src="${path}/resources/images/icon_coffebean_off@2x.png"/>원두</li>
						</ul>
					</li>
					<li class="community">
						커뮤니티
						<ul class="comulist">
							<li>브랜드스토리</li>
							<li>문의하기</li>
							<li>구매후기</li>
							<li>공지사항</li>
							<li>배송정보</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 메인슬라이드 -->
	<div class="mainSlide">
		<div class="slideImg" style="background:url('${path}/resources/images/main_image.png') no-repeat;">
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
	
	<!-- 할인상품 -->
	<div class="saleSlide">
		<div class="saleSlide_text">이달의 <span>할인상품</span>!</div>
		<div class="slideList">
			<div class="item_circle">
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
	
	<div class="bottom_menu">
		<div class="custmer_center">
			<div class="custmer_centertext">CUSTMER CENTER</div>
			<div class="phonenum">032-123-4567</div>
			<div class="center_about">
				※ 평일 : 09:00~18:00<br>
     			<span style="margin-left:20px;">(점심시간 12:00~1시)</span> <br>
     			※ 주말(토,일,공휴일) : 미운영 
			</div>
		</div>
		
		<div class="notice">
			<div class="notice_text">NOTICE & NEWS <span>더보기 +</span></div>
			<div class="notice_list">[카카오톡 상담톡 오픈!]<span>2021-07-04</span></div>
			<div class="notice_list">[21년 설 명절 이 후 배송 안내]<span>2021-07-04</span></div>
			<div class="notice_list">[크리스마스, 신정] 택배 배송 안내<span>2021-07-04</span></div>
		</div>
		
		<div class="bottom_btn">
			<div class="button">
				1:1문의하기 <img src="${path }/resources/images/arrow.png"/>
			</div>
			<div class="button">
				공지사항 <img src="${path }/resources/images/arrow.png"/>
			</div>
			<div class="button">
				FAQ 바로가기 <img src="${path }/resources/images/arrow.png"/>
			</div>
			<div class="kakao">
				<img src="${path }/resources/images/kakao.png"/>디저트팜
			</div>
		</div>
	</div>
	
	<div class="footer">
		<div style="width:1280px; margin:0 auto;">
			<div class="footer_menu">
				<p><a>회사소개</a><span>|</span></p>
				<p><a>개인정보처리방침</a><span>|</span></p>
				<p><a>이용약관</a><span>|</span></p>
				<p><a>공지사항</a><span>|</span></p>
				<p><a>회사소개</a><span>|</span></p>
				<p><a>고객센터</a><span>|</span></p>
				<p><a>FAQ</a><p>
			</div>
			<div class="footer_text">
				디저트팜<span>|</span>대표 : 팜팜<span>|</span>인천광역시 부평구 부평동1234<br>
				전화번호 : 032-123-4567<span>|</span>문자상담 : 1234-5678<span>|</span>메일 : dessertfarm@naver.com<br>
				사업자등록번호 : 380-41-00272<span>|</span>개인정보관리자 : 디저트팜            
			</div>
			<div class="footer_logo"></div>
			<div class="copyright">Copyright © Dessertfarm All rights reserved</div>
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
</body>
</html>