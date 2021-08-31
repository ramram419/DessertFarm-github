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
			<li onclick="location.href='./qnalist';" class="click">문의내역</li>
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
			<ul class="pagination">
				<li><img src="${path}/resources/images/left_arrows.png"/></li>
				<li><img src="${path}/resources/images/left_arrow.png"/></li>
				<li class="active">1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li>5</li>
				<li><img src="${path}/resources/images/right_arrow.png"/></li>
				<li><img src="${path}/resources/images/right_arrows.png"/></li>
			</ul>
			<p><a href="<c:url value='/qnalist/new' />">문의하기</a></p>
	</div>
</div>
<c:import url="../sideMenu.jsp" />
<c:import url="../footer.jsp"/>
</body>
</html>