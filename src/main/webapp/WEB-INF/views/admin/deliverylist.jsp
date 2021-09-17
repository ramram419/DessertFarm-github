<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />



<div class="card">
<div class="card-body">
<div class="table-responsive">
	<table class="table">
		<thead>
			<tr style="color: #000000;">
				<th>주문번호</th>
				<th>주문자</th>
				<th>아이디</th>
				<th>수령자</th>
				<th>주소</th>
				<th>연락처</th>
				<th>주문날짜</th>
				<th>처리상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>202109091234</td>
				<td>홍길동</td>
				<td>hong123</td>
				<td>홍길동</td>
				<td>[우편번호]주소</td>
				<td>010-1234-1243</td>
				<td>2021.09.12</td>
				<td>준비중</td>
			</tr>
		</tbody>
	</table>
</div>
</div>
</div>