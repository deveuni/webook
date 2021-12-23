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

  <!-- ck에디터 -->
  <script src="/resources/ckeditor/ckeditor.js"></script>
  
  <script type="text/javascript">

	// 유효성 체크
	function goods_register(){

		var category = document.fr.category.value;
		var gdsName = document.fr.gdsName.value;
		var gdsAuthor = document.fr.gdsAuthor.value;
		var gdsCompany = document.fr.gdsCompany.value;
		var gdsPrice = document.fr.gdsPrice.value;
		var gdsStock = document.fr.gdsStock.value;
		var gdsDes = document.fr.gdsDes.value;

		if(category == ""){
			alert("도서분류를 선택하세요.");
			document.fr.category.focus();
			return false;
		}

		if(gdsName == ""){
			alert("도서이름을 입력하세요.");
			document.fr.gdsName.focus();
			return false;
		}

		if(gdsAuthor == ""){
			alert("도서저자를 입력하세요.");
			document.fr.gdsAuthor.focus();
			return false;
		}

		if(gdsCompany == ""){
			alert("도서출판사를 입력하세요.");
			document.fr.gdsCompany.focus();
			return false;
		}

		if(gdsPrice == ""){
			alert("도서가격을 입력하세요.");
			document.fr.gdsPrice.focus();
			return false;
		}

		if(gdsStock == ""){
			alert("도서수량을 입력하세요.");
			document.fr.gdsStock.focus();
			return false;
		}

		if(CKEDITOR.instances.gdsDes.getData() == '' 
			|| CKEDITOR.instances.gdsDes.getData().length == 0){
				alert("도서설명을 입력하세요.");
				$("#gdsDes").focus();
				return false;
		}
	}
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
    <h1 class="mt-4 mb-3">Webook
      <small>도서 상품 등록</small>
    </h1>

    <ol class="breadcrumb"></ol> 

    <!-- Contact Form -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <form action="/admin/goods/register" method="post" enctype="multipart/form-data" name="fr">
          <div class="control-group form-group">
            <div class="controls">
              <label>도서분류</label>
              <select class="form-control" name="category">
              	<option value="" selected>카테고리 선택</option>
              	<option value="국내도서" >국내도서</option>
              	<option value="해외도서" >해외도서</option>
              	<option value="eBook" >eBook</option>
              	<option value="웹소설" >웹소설</option>
              	<option value="음반" >음반</option>
              	<option value="중고도서" >중고도서</option>
              </select>
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>도서이름</label>
              <input type="text" class="form-control" name="gdsName" id="gdsName" required>
            </div>
          </div>
          
          <div class="control-group form-group">
            <div class="controls">
              <label>도서저자</label>
              <input type="text" class="form-control" name="gdsAuthor" id="gdsAuthor" required>
            </div>
          </div>
          
          <div class="control-group form-group">
            <div class="controls">
              <label>도서출판사</label>
              <input type="text" class="form-control" name="gdsCompany" id="gdsCompany" required>
            </div>
          </div>
          
          <div class="control-group form-group">
            <div class="controls">
              <label>도서가격</label>
              <input type="text" class="form-control" name="gdsPrice" id="gdsPrice" required>
            </div>
          </div>
          
          <div class="control-group form-group">
            <div class="controls">
              <label>도서수량</label>
              <input type="text" class="form-control" name="gdsStock" id="gdsStock"  required>
            </div>
          </div>
          
          <div class="control-group form-group">
            <div class="controls">
              <label>도서설명</label>
              <textarea rows="10" cols="100" class="form-control" name="gdsDes" id="gdsDes" required  maxlength="999" style="resize:none"></textarea>
            </div>
          </div>
          
          <!-- ck에디터 -->   
          <script>
 				var ckeditor_config = {
 		 			width: 1000,
 					height: 500,
   					resize_enaleb : false,
   					enterMode : CKEDITOR.ENTER_BR,
   					shiftEnterMode : CKEDITOR.ENTER_P,
   					uploadUrl: "/admin/goods/ckUpload",
   					filebrowserUploadUrl : "/admin/goods/ckUpload"
 				};
 
				 CKEDITOR.replace("gdsDes", ckeditor_config);

		  </script>
		  <!-- ck 에디터 끝 -->
          
          <div id="success"></div>
          <input type="submit" value="등록하기" class="btn btn-primary" onclick="return goods_register()">
          <input type="button" value="취소하기" class="btn btn-primary" onclick="cancel()">
        </form>
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

  <!-- Contact form JavaScript -->
  <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>

<script type="text/javascript">
	function cancel(){
		var result = confirm("취소하시겠습니까? 변경사항이 저장되지 않을 수 있습니다.");
		if(result){
			history.back();
		}
	}
</script>
</body>
</html>
    