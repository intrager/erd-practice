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

  <div class="container pt-5">
    <h2>MVC 기반 온라인 커머스 구현</h2>
    <div class="card">
      <div class="card-header">
        <div class="row">
          <div class="col-5">
            <c:if test="${empty loginInfo}">
              <h5>Welcome, Guest</h5>
            </c:if>
            <c:if test="${!empty loginInfo}">
              <h5 class="text-right">Welcome, ${loginInfo.customerName} 적립금 :
                <span class="badge badge-danger">${loginInfo.savings}</span>
              </h5>
            </c:if>
          </div>
          <div class="col-7">
            <c:if test="${empty loginInfo}">
              <form class="form-inline" action="login" method="post">
                <label for="customerId">아이디 : </label>
                <input id="customerId" name="customerId" type="text" class="form-control" placeholder="Enter ID">
                <label for="password">패스워드 : </label>
                <input  id="password" name="password" type="password" class="form-control" placeholder="Enter password">

                &nbsp;<button type="submit" class="btn btn-primary btn-sm">로그인</button>
              </form>
            </c:if>
            <c:if test="${!empty loginInfo}">
              <form class="form-inline" action="logout" method="post">
                <button type="submit" class="btn btn-primary btn-sm">로그아웃</button>
              </form>
            </c:if>
          </div>
        </div>
      </div>
      <div class="card-body">
        <div class="row">
          <div class="col text-right"><button class="btn btn-sm btn-danger" onClick="">주문하기</button></div>
        </div>
        <h3>Cart List</h3>
        <table class="table table-bordered table-hover">
          <tr>
            <thead>
              <tr>
                <th>제품번호</th>
                <th>제품명</th>
                <th>수량</th>
                <th>가격</th>
                <th>금액</th>
                <th class="text-center">장바구니에서 빼기</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="item" items="${cartList}">
                <tr>
                  <td>${item.productCode}</td>
                  <td>${item.productName}</td>
                  <td>${item.purchaseQuantity}</td>
                  <td>${item.productPrice}</td>
                  <td>${item.productAmountPrice}</td>
                  <td class="text-center"><button class="btn btn-smg badge-secondary" onclick="cancel('${item.ordersCode}')">빼기</button></td>
                </tr>
              </c:forEach>
              <tr>
                <td colspan="4">주문할 총 금액</td>
                <td colspan="2"><span class="badge badge-danger">${totalAmount}</span></td>
              </tr>
            </tbody>
          </tr>
        </table>
      </div>
      <div class="card-footer text-center">데이터베이스 모델링_브루스한</div>
    </div>
  </div>
  <script>
    function cancel(ordersCode) {
      $.ajax({

      });
    }
  </script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>