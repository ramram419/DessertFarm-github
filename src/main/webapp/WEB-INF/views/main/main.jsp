<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>DessertFarm</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
	
	
</head>
<body>

	<div class="header">
		<div class="header_top">
			<div class="top_menu">
				<p><a>로그인</a>|</p>
	            <p><a>회원가입</a>|</p>
	            <p><a>마이페이지</a>|</p>
             	<p><a>관리자페이지</a></p>
             </div>
		</div>
		<div class="header_mid">
			<div class="logo">로고</div>
			<div class="search_box">
				<input type="text" class="search_text"/>
				<div class="search_icon"></div>
			</div>
		</div>
		<div class="header_btm">
			<div class="menu_box">
				<div class="cate"><img />전체 카테고리</div>
				<div class="menu">
					<ul>
                		<li><a>브랜드스토리</a></li>
                		<li><a>신상품</a></li>
                		<li><a>베스트상품/상점</a></li>
                		<li><a>이달의 <span>할인</span></a></li>
                		<li><a>샘플 상품 주문</a></li>
            		</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="mainSlide">
		<div class="slideImg">
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
	
	<div class="saleSlide">
		<div class="saleSlide_text">이달의 <span>할인상품</span>!</div>
		<div class="slideList">
			<div class="item_circle">
				<div class="sale_img"></div>
				<p>도넛</p>
			</div>
			<div class="item_circle">
				<div class="sale_img"></div>
				<p>딸기 크레이프</p>
			</div>
			<div class="item_circle">
				<div class="sale_img select"></div>
				<p>크로플</p>
			</div>
			<div class="item_circle">
				<div class="sale_img"></div>
				<p>크로와상</p>
			</div>
			<div class="item_circle">
				<div class="sale_img"></div>
				<p>다쿠아즈</p>
			</div>
		</div>
	</div>
	
	<div class="bestItem">
		<div class="bestItem_text">인기 상품</div>
		<div class="bestItem_List">
			<div class="itemBox">
				<img class="bestItem_img"/>
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
					<div class="add_dibs"><img/> 찜하기</div>
					<div class="add_bag"><img/> 장바구니</div>
				</div>
			</div>
			
			<div class="itemBox">
				<img class="bestItem_img"/>
				<div class="itemTag">
					<div class="tag best">BEST</div>
					<div class="tag only_b">사업자 전용</div>
				</div>
				<div class="itemName"><span class="shopName">[달콤디저트]</span> 쿠앤크 케이크</div>
				<div class="sale_price">
					<div class="price">13,500원</div>
				</div>
				<div class="bestItem_btn">
					<div class="add_dibs"><img/> 찜하기</div>
					<div class="add_bag"><img/> 장바구니</div>
				</div>
			</div>
			
			<div class="itemBox">
				<img class="bestItem_img"/>
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
					<div class="add_dibs"><img/> 찜하기</div>
					<div class="add_bag"><img/> 장바구니</div>
				</div>
			</div>
			
			<div class="itemBox">
				<img class="bestItem_img"/>
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
					<div class="add_dibs"><img/> 찜하기</div>
					<div class="add_bag"><img/> 장바구니</div>
				</div>
			</div>
			
			<div class="itemBox">
				<img class="bestItem_img"/>
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
					<div class="add_dibs"><img/> 찜하기</div>
					<div class="add_bag"><img/> 장바구니</div>
				</div>
			</div>
			
			<div class="itemBox">
				<img class="bestItem_img"/>
				<div class="itemTag">
					<div class="tag new">NEW</div>
					<div class="tag only_b">사업자 전용</div>
				</div>
				<div class="itemName"><span class="shopName">[달콤디저트]</span> 크로무슈</div>
				<div class="sale_price">
					<div class="price">14,000원</div>
				</div>
				<div class="bestItem_btn">
					<div class="add_dibs"><img/> 찜하기</div>
					<div class="add_bag"><img/> 장바구니</div>
				</div>
			</div>
			
			<div class="itemBox">
				<img class="bestItem_img"/>
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
					<div class="add_dibs"><img/> 찜하기</div>
					<div class="add_bag"><img/> 장바구니</div>
				</div>
			</div>
			
			<div class="itemBox">
				<img class="bestItem_img"/>
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
					<div class="add_dibs"><img/> 찜하기</div>
					<div class="add_bag"><img/> 장바구니</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>