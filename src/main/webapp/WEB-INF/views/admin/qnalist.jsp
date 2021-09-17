<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="card">
<div class="card-body">
<div class="table-responsive">
	<table class="table">
		<thead>
			<tr style="color:#000000;">
				<th>NO</th>
				<th>작성자</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td scope="row">1</td>
				<td>홍길동</td>
				<td>문의합니다!</td>
				<td>테스트 상품을 따로 받아볼수는 없나요?</td>
				<td>2021.08.23</td>
			</tr>
		</tbody>
	</table>
</div>
</div>
</div>