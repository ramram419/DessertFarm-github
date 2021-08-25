<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
   <title>ajax Test</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
   <script>
   
   function deleteProduct() {
	  var testMsg = $("#a").val();
	   console.log("delete() 실행")
	  
	   $.ajax({
			url : 'ajaxTest',
			data : testMsg,
			type : "POST",
			dataType: 'text',
			contentType: "application/text; charset=UTF-8",
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
</body>
</html>
