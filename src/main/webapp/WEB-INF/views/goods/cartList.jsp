<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>webook 온라인서점</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
</head>
<body>

 <!-- header -->
 <jsp:include page="../include/header.jsp"/>
 <!-- header -->
 <br><br>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Blog Home Two
      <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Blog Home 2</li>
    </ol>

    <!-- 장바구니 목록 -->
  <c:forEach items="${cartList}" var="cartList"> 
    <div class="card mb-4">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-6">
            <a href="#">
              <img class="img-fluid rounded" src="${cartList.gdsImg}" alt="">
            </a>
          </div>
          <div class="col-lg-6">
            <h2 class="card-title">${cartList.gdsName}</h2>
            <p class="card-text">
            	<span>상품명 : </span> ${cartList.gdsName}<br />
            	<span>개당 가격 : </span>
            		<fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}"/><br />
            	<span>구입 수량 : </span>${cartList.cartStock}<br />
            	<span>최종 가격 : </span>
            		<fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}"/><br />	
            </p>
            <a href="#" class="btn btn-primary">Read More &rarr;</a>
          </div>
        </div>
      </div>
      <div class="card-footer text-muted">
        Posted on January 1, 2017 by
        <a href="#">Start Bootstrap</a>
      </div>
    </div>
    
    <div class="delete">
     <button type="button" class="delete_btn">삭제</button>
    </div>
    
  </c:forEach> 

 <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
   1.  shop매퍼에서 mysql 오라클 문법 구문 다른 거 수정하기!!~~ 
 
  -->


 
    <!-- Pagination -->
    <ul class="pagination justify-content-center mb-4">
      <li class="page-item">
        <a class="page-link" href="#">&larr; Older</a>
      </li>
      <li class="page-item disabled">
        <a class="page-link" href="#">Newer &rarr;</a>
      </li>
    </ul>

  </div>
  <!-- /.container -->

  <!-- footer -->
   <jsp:include page="../include/footer.jsp"/>
  <!-- footer -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
