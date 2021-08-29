<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="pageCount" value="23" scope="page"/>
<c:set var="displayPage" value="10" scope="page"/>
<c:set var="sector" value="1" scope="page"/>
<html>
<head>
   <title>aJax Test</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
   <script>

   </script>
</head>
<body>
<c:if test="${sector > 1}">
	<span> ◀ </span>
</c:if>
<c:choose>
	<c:when test="${sector*displayPage < pageCount}">
		<c:forEach var="i" begin ="${(sector*displayPage) - (displayPage-1)}" end="${sector*displayPage}">
			<span>${i}</span>
		</c:forEach>
	</c:when>
	<c:when test="${sector*displayPage >= pageCount}">
		<c:forEach var="i" begin ="${(sector*displayPage) - (displayPage-1)}" end="${pageCount}">
			<span>${i}</span>
		</c:forEach>
	</c:when>
</c:choose>
<c:if test="${sector*displayPage < pageCount}">
	<span> ▶ </span>
</c:if>
</body>
</html>
