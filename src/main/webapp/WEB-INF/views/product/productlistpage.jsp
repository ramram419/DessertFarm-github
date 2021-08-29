<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DessertFarm</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<style>
        .content {
            width : 1281px;
            margin : auto;
        }
        img {
            image-rendering: -moz-auto;
            image-rendering: -o-auto;
            image-rendering: -webkit-optimize-contrast;
            image-rendering: auto;

        }
        .itemList{
            width : 100%;
            text-align: left;
        }
        .itemBox {
            width : 296px;
            height : 452px;
            border : solid 1px #eeeeee;
            display : inline-block;
            margin : 12px;
        }

        .itemBox:nth-child(4n+1) {
            margin-left : 0;
        }

        .itemBox:nth-child(4n) {
            margin-right : 0;
        }

        .item_img {
            width :296px;
            height : 296px;
        }

        .itemTag {
            margin-left : 10px;
        }
        .tag {
            display : inline-block;
            font-size : 12px;
        }

        .new {
           background-color: rgb(255, 60, 60);
           padding: 2px 5px 2px 5px;
           font-weight : bold;
           color : white;
        }

        .best {
           background-color: rgb(255, 169, 41);
           padding: 2px 5px 2px 5px;
           font-weight : bold;
           color : white;
        }

        .only_b {
            border : 2px solid rgb(39, 128, 245);
            padding: 1px 4px 1px 4px;
            color :rgb(39, 128, 245);
            font-weight : bold;
           
        }
        .itemName {
            margin-top : 10px;
            margin-left : 10px;
        }

        .price {
            margin-left : 10px;
        }
        .item_btn {
            width : 296px;
            height : 56px;
            background-color: rgb(214, 214, 214);
            margin-top : 40px;
        }
        .btn {
            display : inline-block;
            text-align: center;
        }

        .dibs {
            width : 110px;
            padding : 16px;
            color :rgb(51, 51, 51)
        }
        
        .basket {
            width : 110px;
            padding : 16px;
            color :rgb(51, 51, 51)
        }
    </style>
</head>
<body>
<div class="content">
    <div class="itemList">
        
        <div class="itemBox">
            <img src="마카롱 사진\지수2_수정.png" alt="" class="item_img">
            <div class="itemTag">
                <div class="tag new">NEW</div>
                <div class="tag best">BEST</div>
                <div class="tag only_b">사업자전용</div>
            </div>
            <div class="itemName">
                <span><b>[달콤초코]</b></span>
                <span>초코케이크</span>
            </div>
            <div class="price">30,000원</div>
            <div class="item_btn">
                <div class="btn dibs"><strong>찜하기</strong></div>
                <div class="btn basket"><b>장바구니</b></div>

            </div>
        </div>

        </div>
    </div>
</body>
</html>