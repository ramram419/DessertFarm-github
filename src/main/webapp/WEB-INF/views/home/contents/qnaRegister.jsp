<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DessertFarm</title>
</head>
<body>
	<h1>New QnA</h1>
	<form action="${path}/qnalist/register" method="get">
		제목 : <input type="text" name="qna_title" />
		내용 : <input type="text" name="qna_value" />
		<input type="submit" value="문의등록" />
	</form>
</body>
</html>