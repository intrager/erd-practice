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
          <div class="col text-right"><button class="btn btn-sm btn-danger" onClick="orders('<c:out value="${loginInfo.customerId}"/>', ${cartList.size()})">주문하기</button></div>
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
                  <td>
                    <label for="purchaseQuantity_${item.ordersCode}"></label>
                    <input id="purchaseQuantity_${item.ordersCode}" name="purchaseQuantity" type="number" min="1" max="5" class="form-control" value="${item.purchaseQuantity}" onchange="changeQuantity('${item.ordersCode}')"/></td>
                  <td>${item.productPrice}</td>
                  <td>${item.productAmountPrice}</td>
                  <td class="text-center"><button class="btn btn-smg badge-secondary" onclick="cancel('${item.ordersCode}', '<c:out value="${loginInfo.customerId}" />', '${item.productCode}')">빼기</button></td>
                </tr>
              </c:forEach>
              <tr>
                <td colspan="4">주문할 총 금액</td>
                <td colspan="2"><span class="badge badge-danger">${totalAmount}</span></td>
              </tr>
            </tbody>
          </tr>
        </table>
        <div class="row">
          <div class="col text-right"><button class="btn btn-sm btn-primary" onclick="location.href='/ecommerce/productList'">쇼핑 계속하기</button></div>
        </div>
      </div>
      <div class="card-footer text-center">데이터베이스 모델링_브루스한</div>
    </div>
  </div>
  <script>
    function cancel(ordersCode, customerId, productCode) {
      $.ajax({
        url: "/ecommerce/cancelProduct",
        data: JSON.stringify({"ordersCode": ordersCode, "customerId": customerId, "productCode": productCode}),
        contentType: "application/json",
        type: "POST",
        success: function(resultState) {
          if(resultState === "false") {
            alert("물건을 취소하는 데 문제가 발생했습니다. 다시 시도해주세요.");
          } else {
            alert("정상적으로 취소되었습니다.");
          }
          location.href="/ecommerce/cartList";
        },
        error: function() {
          alert("물건을 취소하는 데 문제가 발생했습니다. 다시 시도해주세요.");
        }
      });
    }

    function orders(customerId, cartSize) {
      if(cartSize === 0 || ${totalAmount} === 0) {
        alert("장바구니가 비었습니다.");
        return false;
      }
      $.ajax({
        url: "/ecommerce/orders",
        data: JSON.stringify({ "customerId": customerId, "cartSize": cartSize, "totalAmount": ${totalAmount} }),
        contentType: "application/json",
        type: "POST",
        success: function(resultState) {
          if(resultState === "false") {
            alert("주문에 실패했습니다. 다시 시도해주세요."); return false;
          }
          alert("주문이 완료됐습니다.");
          location.href="/ecommerce/cartList";
        },
        error: function() {
          alert("주문에 실패했습니다. 다시 시도해주세요."); return false;
        }
      });
    }

    function changeQuantity(ordersCode) {
      const purchaseQuantity = document.getElementById('purchaseQuantity_' + ordersCode).value;
      $.ajax({
        url: "/ecommerce/quantityChange",
        data: JSON.stringify({ "ordersCode": ordersCode, "purchaseQuantity": purchaseQuantity}),
        contentType: "application/json",
        type: "POST",
        success: function(resultState) {
          if(resultState === "false") {
            alert("다시 시도해주세요."); return false;
          }
          alert("물품 개수가 추가되었습니다.");
          location.href="/ecommerce/cartList";
        },
        error: function() {
          alert("다시 시도해주세요."); return false;
        }
      });
    }
  </script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>