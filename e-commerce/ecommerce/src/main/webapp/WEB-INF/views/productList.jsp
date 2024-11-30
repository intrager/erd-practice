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
          <div class="col text-right"><button class="btn btn-sm btn-danger" onClick="viewCartList()">장바구니</button></div>
        </div>
        <h3>Product List</h3>
        <table class="table table-bordered table-hover">
          <tr>
            <thead>
              <tr>
                <th>제품번호</th>
                <th>제품명</th>
                <th>재고량</th>
                <th>가격</th>
                <th>제조업체</th>
                <th class="text-center">주문</th>
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
                  <td class="text-center"><button class="btn btn-small btn-primary" onclick="addToCart('${product.productCode}')">장바구니 추가하기</button></td>
                </tr>
              </c:forEach>
            </tbody>
          </tr>
        </table>
      </div>
      <div class="card-footer text-center">데이터베이스 모델링_브루스한</div>
    </div>
  </div>
  <script>
    function viewCartList() {
      if(${empty loginInfo}) {
        alert("로그인 후 이용 바랍니다.");
        return false;
      }
      location.href="/ecommerce/cartList";
    }

    function addToCart(product) {
      if(${empty loginInfo}) {
        alert("로그인 후 이용 바랍니다.");
        return false;
      }
      $.ajax({
        url: "/ecommerce/addProduct",
        data: JSON.stringify({"customerId" : "<c:out value='${loginInfo.customerId}' />", "productCode" : product}),
        contentType: "application/json",
        type: "POST",
        success: function(count) {
          if(count === 0) {
            alert("장바구니에 담기지 않았어요. 다시 시도해 주세요."); return false;
          }
          alert("물품이 장바구니에 담겼어요."); return true;
        },
        error: function() {
          alert("장바구니에 담기지 않았어요. 다시 시도해 주세요."); return false;
        }
      });
    }
  </script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>