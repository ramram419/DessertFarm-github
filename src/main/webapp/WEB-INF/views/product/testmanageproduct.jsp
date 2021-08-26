<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>내 상품 조회</title>
    <style>
        table {
          width: 100%;
          border-top: 1px solid #444444;
          border-collapse: collapse;
        }
        th, td {
          border-bottom: 1px solid #444444;
          padding: 10px;
        }
        tr > td {
            text-align: center;
        }
      </style>
  </head>
  <body>
      <h1>
          메뉴 등록/관리
      </h1>
      <button style="float:right; margin-bottom : 10px; width : 50px;">삭제</button>
      <a href="testRegisterProduct"><button style="float:right; margin-bottom : 10px; margin-right : 10px; width : 50px;">추가</button></a>
    <table>
      <thead>
        <tr>
          <th>□</th><th>순번</th><th>메뉴이미지</th><th>메뉴이름</th><th>카테고리</th><th>가격</th><th>판매품절</th>
        </tr>
      </thead>
      <tbody>
       <c:forEach var="manageProductList" items="${manageProductList}">
        <tr>
          <td>□</td><td>0</td><td><img src="/dessertfarm.co.kr${manageProductList.pro_img_server}" width="100" height="100"></td><td>${manageProductList.product_name}</td><td>${manageProductList.category}</td><td>${manageProductList.product_price}</td><td>${manageProductList.product_sales_stat}</td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
    <h3><a href="<c:url value='/admin' />">관리자 페이지로</a></h3>
    <h3><a href="<c:url value='/product/testRegisterProduct' />">메뉴 등록하기</a></h3>
  </body>
</html>