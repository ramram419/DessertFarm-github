<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />


<div class="card">
<div class="card-body">
<div class="table-responsive">
	<table class="table">
		<thead>
			<tr style="color: #000000;">
				<th>주문상태</th>
				<th>주문번호</th>
				<th>주문자</th>
				<th>상품명</th>
				<th>수량</th>
				<th>주문금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>입금완료</td>
				<td>202109091234</td>
				<td>홍길동</td>
				<td>크로와상 생지</td>
				<td>2</td>
				<td>40,000</td>
			</tr>
		</tbody>
	</table>
</div>
</div>
</div>