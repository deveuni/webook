<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">
</head>
<body>

 <!-- header -->
 <%@ include file="../include/header.jsp" %>
 <!-- header -->
 
 <br><br>
  <!-- Page Content -->
  <div class="container">

    <h1 class="mt-4 mb-3">도서목록</h1>

	<!-- 도서목록 카드 -->
    <div class="row">
    <c:forEach items="${list}" var="list">
      <div class="col-lg-4 col-sm-6 portfolio-item"  style="text-align: center;">
        <div class="card h-100">
         <a href="/goods/detail?gdsNum=${list.gdsNum}"><img class="card-img-top" src="${list.gdsImg}" alt="" width="400px" height="300px"></a>   
          <div class="card-body">
              <a href="/goods/detail?gdsNum=${list.gdsNum}">${list.gdsName}</a> <br>
            	${list.gdsAuthor} | 출판사
            	<br>
            	<fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###"/>원
          </div>
        </div>
      </div>
     </c:forEach>
     </div>
     <!-- 도서목록 카드 끝 -->

    <!-- Pagination -->
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">2</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">3</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>

  </div>
  <!-- /.container -->

 <!-- footer -->
  <%@ include file="../include/footer.jsp" %>
  <!-- footer -->

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>