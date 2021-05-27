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
      <small>도서 상품 등록</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">Contact</li>
    </ol>

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <form action="/goods/register" method="post" name="sentMessage" id="contactForm" novalidate>
          <div class="control-group form-group">
            <div class="controls">
              <label>도서분류</label>
              <select class="form-control" name="category">
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
              <input type="text" class="form-control" name="gdsName" id="gdsName" required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
           <div class="control-group form-group">
            <div class="controls">
              <label>도서저자</label>
              <input type="text" class="form-control" name="gdsAuthor" id="gdsAuthor" required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>도서가격</label>
              <input type="text" class="form-control" name="gdsPrice" id="gdsPrice" required data-validation-required-message="Please enter your email address.">
            </div>
          </div>
          
          <div class="control-group form-group">
            	<div class="controls">
              	<label>도서수량</label>
              	  <input type="text" class="form-control" name="gdsStock" id="gdsStock"  required >
            	</div>
          </div>
          
          
          <div class="control-group form-group">
            <div class="controls">
              <label>도서설명</label>
              <textarea rows="10" cols="100" class="form-control" name="gdsDes" id="gdsDes" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
            </div>
          </div>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <input type="submit" value="등록하기" class="btn btn-primary" >
          <input type="button" value="취소하기" class="btn btn-primary" onclick="cancel()">
        </form>
      </div>
      
   <script type="text/javascript">
		function cancel(){
			var result = confirm("취소하시겠습니까? 변경사항이 저장되지 않을 수 있습니다.");
			if(result){
			    history.back();
			}
		}
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
    