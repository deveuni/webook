<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Webook
      <small>도서 상품 수정</small>
    </h1>

    <ol class="breadcrumb"> </ol>

    <!-- Contact Form -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <form action="/goods/modify" method="post" name="fr" role="form" >
        	<input type="hidden" name="gdsNum" value="${goods.gdsNum}">

	          <div class="control-group form-group">
    	        <div class="controls">
        	      <label>도서분류</label>
            	  <select class="form-control" name="category" id="category">
              		<option value="" selected>카테고리 선택</option>
              		<option value="국내도서" >국내도서</option>
              		<option value="해외도서" >해외도서</option>
              		<option value="eBook" >eBook</option>
              		<option value="웹소설" >웹소설</option>
              	  </select>
            	  <p class="help-block"></p>
            	</div>
          	  </div>
          	  
          	<div class="control-group form-group">
               <div class="controls">
               <label>도서이름</label>
              	  <input type="text" class="form-control" name="gdsName" id="gdsName" value="${goods.gdsName}" required >
               </div>
          	</div>
           
            <div class="control-group form-group">
            	<div class="controls">
              	<label>도서저자</label>
              	  <input type="text" class="form-control" name="gdsAuthor" id="gdsAuthor" value="${goods.gdsAuthor}" required >
            	</div>
          	</div>
          
          	<div class="control-group form-group">
            	<div class="controls">
              	<label>도서가격</label>
              	  <input type="text" class="form-control" name="gdsPrice" id="gdsPrice" value="${goods.gdsPrice}" required >
            	</div>
          	</div>
          	
          	<div class="control-group form-group">
            	<div class="controls">
              	<label>도서수량</label>
              	  <input type="text" class="form-control" name="gdsStock" id="gdsStock" value="${goods.gdsStock}" required >
            	</div>
          	</div>
          
          	<div class="control-group form-group">
            	<div class="controls">
              	<label>도서설명</label>
              	  <textarea rows="10" cols="100" class="form-control" name="gdsDes" id="gdsDes" required  maxlength="999" style="resize:none">${goods.gdsDes}</textarea>
            	</div>
          	</div>
          
          <div id="success"></div>
	          <input type="submit" value="수정하기" id="modify_Btn" class="btn btn-primary" >
	          <input type="button" value="취소하기" id="back" class="btn btn-primary" onclick="cancel()">
        </form>
      </div>
      
<script type="text/javascript">

 // 수정,목록,취소 버튼
 $(document).ready(function(){
	 
 var formObj = $("form[role='form']");

		// 수정하기 
		$("#modify_Btn").on("click",function(){
			formObj.submit();
		});
 
 	
 });    

 	function cancel(){
		var result = confirm("취소하시겠습니까? 변경사항이 저장되지 않을 수 있습니다.");
		if(result){
		    history.back();
		}
	}
 // 수정,목록,취소 버튼
</script> 
      
      
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

  <!-- Contact form JavaScript -->
  <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>

</body>

</html>
    