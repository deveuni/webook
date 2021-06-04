<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
// 수정/삭제 이동
 $(document).ready(function(){
	var gdsNum = $('#gdsNum').val();

	// 수정
	$(document).on("click","#modify_Btn",function(){
		location.href = '/goods/modify?gdsNum=${goods.gdsNum}';
	});

	// 삭제
	$(document).on("click","#delete_Btn",function(){
		var con = confirm("정말로 삭제하시겠습니까?");
		if(con){
			location.href = '/goods/delete?gdsNum=${goods.gdsNum}';
		}
	});
}); 
</script>
</head>
<body>

 <!-- header -->
 <%@ include file="../include/header.jsp" %>
 <!-- header -->
 <br><br>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">${goods.gdsName}</h1>
    
	<!-- 수정/삭제 버튼 관리자만 보이기 -->
     <ol class="breadcrumb">
      <c:if test="${userId == 'webook'}">
       <li class="breadcrumb-item active">
      	<form action=""  role="form" name="form">
      		<input type="hidden" name="gdsNum" id="gdsNum" value="${goods.gdsNum}">
    	    <input type="button" id="modify_Btn" value="수정"> 
    		<input type="button" id="delete_Btn" value="삭제">
    	</form>
       </li>
      </c:if>
     </ol> 
	<!-- 수정/삭제 버튼 관리자만 보이기 끝 -->
	
	
	
    <!-- Portfolio Item Row -->
    <div class="row">
      <div class="col-md-8">
      <img src="${goods.gdsImg}" alt="" width="300px" height="300px"> 
      </div>

      <div class="col-md-4" style="margin-left: 0px">
        <h3 class="my-3">도서 정보</h3>
        <ul>
          <li> 분류 <b>${goods.category}</b></li>
          <li> 저자 <b>${goods.gdsAuthor}</b></li>
          <li> 정가 <b><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></b></li>
          <li> 수량 <b>${goods.gdsStock}</b></li>
        </ul>
      </div> 
    </div>
    <!-- /.row -->
    <br>
    
    <h3 class="my-3">책 소개</h3>
	<p>${goods.gdsDes}</p>

	
    <!-- Related Projects Row -->
    <h3 class="my-4">Related Projects</h3>
    <div class="row">
      <div class="col-md-3 col-sm-6 mb-4">
        <a href="#">
          <img class="img-fluid" src="http://placehold.it/500x300" alt="">
        </a>
      </div>

      <div class="col-md-3 col-sm-6 mb-4">
        <a href="#">
          <img class="img-fluid" src="http://placehold.it/500x300" alt="">
        </a>
      </div>

      <div class="col-md-3 col-sm-6 mb-4">
        <a href="#">
          <img class="img-fluid" src="http://placehold.it/500x300" alt="">
        </a>
      </div>

      <div class="col-md-3 col-sm-6 mb-4">
        <a href="#">
          <img class="img-fluid" src="http://placehold.it/500x300" alt="">
        </a>
      </div>

    </div>
    <!-- /.row -->

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
