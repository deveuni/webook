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
  
<style type="text/css">
/*선택박스*/
.allCheck { float:left; width:200px; }
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px; }
.delBtn { float:right; width:300px; text-align:right; }
.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}

.checkBox { float:left; width:30px; }
.checkBox input { width:16px; height:16px; }
/*선택박스 끝*/

.table {display:table;}
.td {display:table-cell; text-align:center; vertical-align:middle; }

</style>  

<!-- 상품 테이블 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!-- 상품 테이블 끝-->
</head>
<body>

 <!-- header -->
 <jsp:include page="../include/header.jsp"/>
 <!-- header -->
 <br><br>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">카트리스트</h1>

    <ol class="breadcrumb">
    </ol> 

    
	<ul>
	 <li>
  		<div class="allCheck">
   			<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
  		</div>
  
  		<div class="delBtn">
   			<button type="button" class="selectDelete_btn">선택 삭제</button> 
 	 	</div>
	 </li>
	</ul>
	    
	    
	    
<!-- //////////////////////////////////////////////// -->	    

 <table class="table" style="display:table;">
 	<thead>
 	  <tr>
 	  	<th colspan="3" scope="col">상품정보</th>
 	  	<th scope="col">수량</th>
 	  	<th scope="col">상품금액</th>
 	  	<th scope="col">배송정보</th>
 	  	<th scope="col">주문</th>
 	  </tr>
 	</thead>
 	 <c:forEach items="${cartList}" var="cartList">
 	<tbody>
 	  <tr>
 	  	<td>
 	  	  <div class="checkBox">
   			<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
  		  </div>
 	  	  <a href="#">
             <img class="img-fluid rounded" src="${cartList.gdsImg}" alt="" width="100px" height="150px">
          </a>
 	  	</td>
 	  	<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  		${cartList.gdsName}
 	  	</td>
 	  	<td style="display:table-cell; text-align:center; vertical-align:middle;">
			sdfs 	  	
 	  	</td>
 	  	<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  		${cartList.cartStock}개
 	  	</td>
 	  	<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  	 	<fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}"/>
 	  	</td>
 	  	<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  		<fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}"/>원
 	  	</td>
 	  	<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  		<a href="#" class="btn btn-primary">주문하기</a>
            <a href="#" class="btn btn-primary" data-cartNum="${cartList.cartNum}">삭제</a>
 	  	</td>
 	  </tr>
 	</tbody>
 	</c:forEach> 
 </table>






<!-- //////////////////////////////////////////////// -->	    
    
<%--   <c:forEach items="${cartList}" var="cartList"> 
    <div class="card mb-4">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-6">
          <div class="checkBox">
   			<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
  		  </div>
            <a href="#">
              <img class="img-fluid rounded" src="${cartList.gdsImg}" alt="" width="100px" height="150px">
            </a>
          </div> 
          <div class="col-lg-6">
            <h2 class="card-title">${cartList.gdsName}</h2>
            <p class="card-text">
            	<span>상품명 : </span> ${cartList.gdsName}<br />
            	<span>개당 가격 : </span>
            		<fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}"/>원<br />
            	<span>구입 수량 : </span>${cartList.cartStock}개<br />
            	<span>최종 가격 : </span>
            		<fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}"/>원<br />	
            </p>
            <a href="#" class="btn btn-primary">주문하기</a>
            <a href="#" class="btn btn-primary">삭제</a>
          </div>
        </div>
      </div>
      <div class="card-footer text-muted"></div>
    </div>
    
    <!-- <div class="delete">
     <button type="button" class="delete_btn">삭제</button>
    </div> -->
    
    
  </c:forEach>   --%>

 <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
   
   1.  webook 말고 다른 아이디로 카트담기 안됨 ㅠㅠㅠ 자증나 ㅎ
   2. 카트리스트 css 정리 
   
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
