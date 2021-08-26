<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />


<c:set var="user" value='${sessionScope.user}'/>
<c:set var="admin" value='${sessionScope.admin}'/>
   			

<div class="sideMenu">

<c:if test="${empty user && empty admin || not empty user }">
   <div class="sideMenu_box">
      <img src="${path }/resources/images/icon_star@2x.png" style="margin-top:18px;"/>
      상점즐겨찾기
   </div>
   <div class="sideMenu_box" onclick="location.href='./bags'">
      <img src="${path }/resources/images/shopping-cart@2x.png" style="margin-top:20px;"/>
      장바구니
   </div>
   <div class="sideMenu_box" onclick="location.href='./like'">
      <img src="${path }/resources/images/icon_heart@2x.png" style="margin-top:15px;"/>
      찜리스트
   </div>
</c:if>
   <div class="sideMenu_box">
      <img src="${path }/resources/images/chat@2x.png"  style="margin-top:15px;"/>
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