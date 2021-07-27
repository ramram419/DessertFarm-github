<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header">
	<div class="header_top">
		<div class="top_menu">
		
			<c:if test="${sessionScope.user eq null }">
				<p><a href="<c:url value='/login' />" >로그인</a>|</p>
	           	<p><a href="<c:url value='/joinForm' />">회원가입</a>|</p>
	           	<p><a href="<c:url value='/myPage' />">마이페이지</a></p>
           	</c:if>
           	<c:if test="${sessionScope.user ne null }">
           		<p><a href="<c:url value='/logout' />" >로그아웃</a>|</p>
           		<p><a>관리자페이지</a></p>
           	</c:if>
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
			<div class="cate"><img src="${path}/resources/images/icon_bars@2x.png"/>전체 카테고리</div>
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
		<div class="menulist" style="display:none;">
			<div class="bigmenu">
				<div class="category select"><img src="${path }/resources/images/icon_list_on@2x.png"/>카테고리</div>
				<div class="community"><img src="${path }/resources/images/icon_chat_off@2x.png"/>커뮤니티</div>
			</div>
			<div class="midmenu">
				<div class="catelist">
					<ul>
						<li class="select"><img src="${path}/resources/images/icon_cake_on@2x.png" style="margin-top:17px; margin-right:20px;"/>케이크</li>
						<li><img src="${path}/resources/images/icon_Bread_off@2x.png" style="margin-top:25px; margin-right:12px;"/>베이커리</li>
						<li><img src="${path}/resources/images/icon_croissant_off@2x.png" style="margin-top:20px; margin-right:27px;"/>생지</li>
						<li><img src="${path}/resources/images/icon_macarons_off@2x.png" style="margin-top:24px; margin-right:17px;"/>디저트</li>
						<li><img src="${path}/resources/images/icon_sandwich_off@2x.png" style="margin-top:20px; margin-right:12px;"/>샌드위치</li>
						<li><img src="${path}/resources/images/icon_coffebean_off@2x.png" style="margin-top:24px; margin-right:26px;"/>원두</li>
					</ul>
				</div>
				<div class="comulist">
					<ul>
						<li>브랜드스토리</li>
						<li>문의하기</li>
						<li>구매후기</li>
						<li>공지사항</li>
						<li>배송정보</li>
					</ul>
				</div>
			</div>
			<div class="minmenu">
				<div class="cakelist">
					<ul class="cake1">
						<li>무스케이크</li>
						<li>쉬폰케이크</li>
						<li>치즈케이크</li>
						<li>초코케이크</li>
						<li>파운드케이크</li>
					</ul>
					<ul class="cake2">
						<li>버터케이크</li>
						<li>롤케이크</li>
						<li>컵케이크</li>
						<li>티라미수</li>
						<li>카스테라</li>
						<li>크레이프</li>
					</ul>
				</div>
				
				<div class="bakelist" style="display:none;">
					<ul class="bake1">
						<li>크로플</li>
						<li>에그타르트</li>
						<li>마들렌</li>
						<li>머핀</li>
						<li>도넛</li>
					</ul>
					<ul class="bake2">
						<li>쿠키</li>
						<li>플레인</li>
						<li>베이글</li>
						<li>크로칸슈</li>
						<li>몽블랑</li>
						<li>브라우니</li>
						<li>와플</li>
					</ul>
				</div>
				
				<div class="dough" style="display:none;">
					<ul>
						<li>크로와상</li>
						<li>타르트/파이</li>
						<li>스콘/볼</li>
						<li>식빵</li>
					</ul>
				</div>
				
				<div class="dessert" style="display:none;">
					<ul>
						<li>마카롱</li>
						<li>뚱카롱</li>
						<li>다쿠아즈</li>
						<li>오믈렛</li>
						<li>초콜릿</li>
						<li>슈크림</li>
						<li>아이스크림</li>
						<li>치아바타</li>
						<li>크로크무슈</li>
					</ul>
				</div>
			</div>
			
			<div class="menuimg">
				<img src="${path }/resources/images/menu_image@2x.png"/>
				달콤하고 진한 초코 케이크!
			</div>
		</div>
	</div>
</div>