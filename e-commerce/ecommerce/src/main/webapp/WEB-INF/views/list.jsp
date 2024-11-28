<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container">
  <h2>MVC 기반 온라인 커머스 구현</h2>
  <div class="card">
    <div class="card-header">로그인 화면</div>
    <div class="card-body">
      <table class="table table-bordered table-hover">
        <tr>
          <thead>
            <tr>
              <th>제품번호</th>
              <th>제품명</th>
              <th>재고량</th>
              <th>가격</th>
              <th>제조업체</th>
              <th>주문</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="product" items="${list}">
              <tr>
                <td>${product.product_code}</td>
                <td>${product.product_name}</td>
                <td>${product.inventory}</td>
                <td>${product.price}</td>
                <td>${product.manufacturer}</td>
                <td>주문</td>
              </tr>
            </c:forEach>
          </tbody>
        </tr>
      </table>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>