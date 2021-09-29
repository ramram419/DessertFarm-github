<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script>
$(document).ready(loadProductList);

// Load Manage Product List By Ajax
function loadProductList() {
	console.log("loadProductList 실행")
	
	$.ajax({
		type : 'POST'
		,url : 'product/loadProductList'
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
		result += '<tr><td><input type="checkbox" name="isCheck" value="'+item["product_id"]+'"></td><td>'+(index+1)+'</td>'
		result += '<td><img class="thumb w-15" src="https://'+ item["product_img_url"] + '"></td>'
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
<div class="card">
	<div class="d-flex flex-row-reverse bd-highlight">
	<button type="button" class="p-2 bd-highlight btn btn-primary w-10 mt-2 mr-2" onClick="location.href='./adminPage?c=4-1'">추가</button>
		<button type="button" class="p-2 bd-highlight btn btn-danger w-5 mt-2 mr-2">삭제</button>
		
	</div>	
<div class="card-body">
<div class="table-responsive">

	<table class="table">
		<thead>
			<tr style="color: #000000;">
				<th><input type="checkbox"></th>
				<th>순번</th>
				<th>대표이미지</th>
				<th>상품명</th>
				<th>카테고리</th>
				<th>가격</th>
				<th>판매여부</th>
			</tr>
		</thead>
		<tbody class="productList">
			
		</tbody>
	</table>
</div>
</div>
</div>