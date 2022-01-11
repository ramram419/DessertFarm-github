<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
   <title>aJax Test</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
   <script>
   
   function printList(response) {
	   var result = '';
	   result += '<table border = 1>'
	   result += '<tr><th>이름</th><th>사진</th><th>상품번호</th></tr>'
	   $.each(response,function(index,item) {
		   result += '<tr><td>'+item["product_name"]+'</td><td><img src ="/dessertfarm.co.kr' + item["pro_img_server"] + '">'  + '</td><td>' + item["product_id"] + '</td></tr>'
	   }) 
	   result += '</table>'
	   $('.productlist').html(result);
} 
   
   function deleteProduct() {
	  var testMsg = $("#a").val();
	   console.log("delete() 실행")
	  
	   $.ajax({
			url : 'ajaxTest',
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			dataType: "json",
			success : function(response){
			
			},
			error : function(err){
				console.log(err)
			}
		})
   }
   </script>
</head>
<body>
	<p>
		<input type="checkbox" id="a" value="acheck"> A 체크박스
	</p>
	<p>
		<input type="checkbox" value="bcheck"> B 체크박스
	</p>
	<p>
		<input type="button" value="삭제하기" onClick="deleteProduct()">
	</p>
	<div class="productList">
	
	</div>
</body>
</html>
