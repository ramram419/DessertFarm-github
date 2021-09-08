<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DessertFarm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
          
    <style>
        .content {
            width : 1096px;
            margin : auto;
            /* border : 1px solid red; */
        }

        .imgTd {
            margin : 0;
            text-align: right;
            vertical-align: top;
            width : 100px;
            
        }

        td {
            border-collapse : collapse;
            border-spacing: 0;
        }

        .thumb {
        	width : 296px;
            display : block;
            float : right;
            margin-left: -40px;
        }
        .product_info {
            margin : auto;
            border-collapse : collapse;
            border-spacing: 0;
        }

        .p-title {
            margin-top : 50px;
            margin-left : 10px;
            padding : 0px;
            text-align: left;
        }

        .p-price {
            margin-top : 0px;
            margin-bottom : 0px;
            margin-left : 10px;
            font-weight: bold;
        }

        .p-value {
            margin : 5px 0 0 10px;
            font-size : 12px;
        }
        .p-rating {
            margin-top : 20px;
            margin-bottom : 0px;
            margin-left : 10px;
            font-weight: bold;
        }

        .basket {
            margin : 0 0 0 10px;
            
            padding : 0px;
            width : 160px;
            height : 50px;
            color : white;
            background-color: rgba(35, 130, 255, 0.801);
            border-radius: 15px;
            font-size : 15px;
            font-weight: bold;
            border : none;
        }

        .order {
            margin-left: -0px;
            padding : 0px;
            width : 375px;
            height : 50px;
            color : white;
            background-color: rgba(255, 30, 0, 0.801);
            font-size : 15px;
            font-weight: bold;
            border : none;
            border-radius: 15px;
        }
        .product-detail {
            width: auto;
            height : 100px;
           
        }
        .show-detail {
            border-top : 2px solid rgb(255, 87, 87);
            font-size: 20px;
            color: rgb(255, 87, 87);
            font-weight: bold;
            margin-top : 10px;
            padding-top : 20px;
            padding-bottom: 20px;
            border-bottom : 2px solid rgb(255, 87, 87);
            text-align: center;
        }
        

        .product-explain-img {
            margin-top : 10px;
        }
        .star {
            display : inline-block;
            vertical-align: bottom;
        
         
           margin:0;
           padding : 0;
        }
    

        
            
    </style>
    <script>

 	
    $(document).ready(function() {
    	var orderList = [];
        orderList.push($('.content').attr("data-product-id"));
    	$('.order').click(function() {
    		console.log(orderList)
    		$.ajax({
				async:false
				,type : 'POST'
				,url : '/order'
				,data : {
					'orderList' : orderList
				}
				,success : function() {
					
					
				}, error : function(err){
					
				}
			});
    	})
    })
    </script>
    
</head>
<body>
<c:import url="../home/top.jsp" />
    <div class="content" data-product-id = '${product.DTO.product_id}'>
        <table class = 'product_info' width = 1096px height = 296px>
            <tr>
                <td class = 'imgTd' rowspan = 5 height = '296px' > <img class='thumb' src="${path}${product.IMG[0]}"></td>
                <td width = '26px' rowspan='5'></td>
                <td width = '300px' height = '30px'><p class = "p-title">${product.DTO.product_name}</p></td>
                <td width = '70px' rowspan='5'></td>
                
            </tr>
            
            <tr> <!-- 가격 정보 -->
                <td height = '10px' ><p class='p-price'>${product.DTO.product_price}원</p></td>
            </tr> 
            <tr> <!-- 상품설명 -->
                <td height = '29px'><p class='p-value'>${product.DTO.product_value}</p></td>
            </tr>
            <tr> <!-- 평점정보 -->
                <td height = '70px'><p class='p-rating'>평점 : ${product.DTO.product_rating} <span style="font-size : 12px">(319)</span></p></td>
            </tr>
            <tr> <!-- 주문버튼 -->
                <td  width='353px' style='vertical-align: bottom;'>
                    <button class='basket'>장바구니</button>
                    <button class='order'>주문하기</button>
                </td>
            </tr>
        </table>
        <div class="product-detail">
            <div class="product_detail_value">
            	<div class="show-detail">상품 상세정보</div>
            	<c:forEach var='i' items="${product.IMG}" begin='1'>
            		<img class="product-explain-img" src="${path}${i}" alt="">
            	</c:forEach>
            	
            </div>
            <div class="product-delivery"><div class="show-detail">배송 정보</div>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Harum debitis ducimus a molestias consectetur temporibus alias, consequatur deserunt accusamus ad aspernatur quisquam minus? Dolore incidunt sit aut asperiores? Delectus, odio.lo Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente accusamus quos, maxime iure accusantium ex dignissimos odio unde? Perspiciatis exercitationem iste vel in harum nulla. Distinctio ullam deleniti assumenda magni. Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa dolore quas, reprehenderit fuga ipsum, nihil eum quidem unde, praesentium iste fugit quibusdam. Eligendi beatae ad incidunt eum iusto rerum quisquam.</div>
            <div class="product-review"><div class="show-detail">상품 후기</div>
        </div>
        </div>
    </div>
</body>
</html>