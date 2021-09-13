<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>내 상품 조회</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        table {
          width: 100%;
          border-top: 1px solid #444444;
          border-collapse: collapse;
        }
        th, td {
          border-bottom: 1px solid #444444;
          padding: 10px;
        }
        tr > td {
            text-align: center;
        }
        .thumb {
        	width : 100px;
        	height : 100px;
        }
        
      </style>

	<script>
		$(document).ready(loadProductList);
		
		// Load Manage Product List By Ajax
		function loadProductList() {
			console.log("loadProductList 실행")
			
			$.ajax({
				type : 'POST'
				,url : 'loadProductList'
				,dataType: "json"
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
				result += '<tr><td><input type="checkbox" name="isCheck" value="'+item["product_id"]+'"></td><td>'+index+'</td>'
				result += '<td><img class="thumb" src="/dessertfarm.co.kr' + item["product_img_url"] + '"></td>'
				result += '<td>' + item["product_name"] + '</td>'
				result += '<td>' + item["category"] + '</td>'
				result += '<td>' + item["product_price"] + '</td>'
				result += '<td>' + item["product_sales_stat"] + '</td></tr>'
			})
			$('.productList').html(result).trigger("create");
		}
		
		function deleteProduct() {
			var checkBoxArr = [];
			$("input:checkbox[name='isCheck']:checked").each(function() {
				checkBoxArr.push($(this).val());
				console.log(checkBoxArr);
			})
			
			$.ajax({
				async:false
				,type : 'POST'
				,url : 'deleteProductList'
				,data : {
					'checkBoxArr' : checkBoxArr
				}
				,success : function() {
					console.log("삭제성공");
					loadProductList();
				}, error : function(err){
					console.log("error 뜸");
					console.log(err)
					loadProductList();
				}
			});
		}
	</script>
  </head>
  <body>
      <h1>
          메뉴 등록/관리
      </h1>
      <button style="float:right; margin-bottom : 10px; width : 50px;" onClick='deleteProduct()'>삭제</button>
      <a href="<c:url value='/product/testRegisterProduct' />"><button style="float:right; margin-bottom : 10px; margin-right : 10px; width : 50px;">추가</button></a>
    <table>
      <thead>
        <tr>
          <th>□</th><th>순번</th><th>메뉴이미지</th><th>메뉴이름</th><th>카테고리</th><th>가격</th><th>판매품절</th>
        </tr>
      </thead>
      <tbody class="productList">
      
      </tbody>
    </table>
    <h3><a href="<c:url value='/admin' />">관리자 페이지로</a></h3>
  </body>
</html>