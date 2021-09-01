<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
   <title>DessertFarm</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/basic.css"/>">
   <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<c:import url="../top.jsp"/>
<div class="C_content">
	<div class="contentTxt">문의내역</div>
	<div class="pagelist">
		<ul>
			<li onclick="location.href='./loginMyPage';">정보변경</li>
			<li onclick="location.href='./like';">내찜목록</li>
			<li onclick="location.href='./bags';">장바구니</li>
			<li onclick="location.href='./orderlist';">주문내역</li>
			<li onclick="location.href='./qnalist?pageNum=1';" class="click">문의내역</li>
		</ul>
	</div>
	<div>
		<table class="qna_table">
			<thead>
				<tr>
					<th style="width: 10%">순번</th>
					<th style="width: 50%">제목</th>
					<th style="width: 20%">문의 날짜</th>
					<th style="width: 20%">답변 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="vo" varStatus="var">
					<tr>
						<td>${var.count}</td>
						<td>${vo.qna_title }</td>
						<td>${vo.qna_date }</td>
						<td>대기중</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<ul class="pagingbox">
				<c:if test="${paging.leftArr}">
					<a href="?pageNum=${paging.sectorStart-1}"><li><img src="${path }/resources/images/left_arrow.png" /></li></a>
				</c:if>
			<c:forEach var='i' begin="${paging.sectorStart}" end="${paging.sectorEnd}">
				<c:choose>
					<c:when test="${i eq paging.pageNum}">
						<li class="active">${i}</li>		
					</c:when>
					<c:otherwise>
						<a href="?pageNum=${i}"><li>${i}</li></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		
			<c:if test="${paging.sectorEnd < paging.totalPage}">
				<a href="?pageNum=${paging.sectorEnd+1}"><li><img src="${path }/resources/images/right_arrow.png" /></li></a>
			</c:if>
	</ul>
			<p><a href="<c:url value='/qnalist/new' />">문의하기</a></p>
	</div>
</div>
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>