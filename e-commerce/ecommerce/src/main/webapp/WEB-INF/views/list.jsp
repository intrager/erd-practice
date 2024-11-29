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
    <div class="card-header">
      <form class="form-inline" action="/action_page.php">
        <label for="customerId">아이디 : </label>
        <input id="customerId" name="customerId" type="text" class="form-control" placeholder="Enter ID">
        <label for="password">패스워드 : </label>
        <input  id="password" name="password" type="password" class="form-control" placeholder="Enter password">

        <button type="submit" class="btn btn-primary btn-sm">로그인</button>
      </form>
    </div>
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
                <td>${product.productCode}</td>
                <td>${product.productName}</td>
                <td>${product.stockQuantity}</td>
                <td>${product.productPrice}</td>
                <td>${product.manufacturer}</td>
                <td><button class="btn btn-small btn-primary">장바구니 추가하기</button></td>
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