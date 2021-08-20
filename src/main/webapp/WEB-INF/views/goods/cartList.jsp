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
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="/resources/jquery/jquery-3.3.1.min.js"></script>
  
  
<style type="text/css">
/*선택박스*/
.allCheck { float:left; width:200px; }
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px; }
.delBtn { float:right; width:300px; text-align:right; margin-right: 100px;}
.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}

.checkBox { float:left; width:30px; }
.checkBox input { width:16px; height:16px; }
/*선택박스 끝*/
</style>  
</head>
<body>

 <!-- header -->
 <jsp:include page="../include/header.jsp"/>
 <!-- header -->
 <br><br>

  <!-- Page Content -->
  <div class="container">

    <!-- 카트리스트 -->
    <h1 class="mt-4 mb-3">카트리스트</h1>

    <ol class="breadcrumb"></ol> 
	
  	<div class="allCheck">
   		<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">전체선택</label> 
  	</div>
  	<script type="text/javascript">
		$("#allCheck").click(function(){
			var chk = $("#allCheck").prop("checked");
			if(chk) {
				$(".chBox").prop("checked", true);
			} else {
				$(".chBox").prop("checked", false);
			}
		});
  	</script>
  	<div class="delBtn">
   		<button type="button" class="selectDelete_btn">삭제</button> 
   		<script type="text/javascript">
			$(".selectDelete_btn").click(function(){
				var confirm_val = confirm("정말 삭제하시겠습니까?");

				if(confirm_val) {
					var checkArr = new Array();

					$("input[class='chBox']:checked").each(function(){
						checkArr.push($(this).attr("data-cartNum"));
					});

					$.ajax({
						url : "/goods/deleteCart",
						type : "post",
						data : { chbox : checkArr },
						success : function(result){

							if(result == 1) {
								location.href = "/goods/cartList";
							} else {
								alert("삭제 실패");
							}
						}
					});
				}
			});
   		</script>
 	 </div>
	 
	<br><br>    

 	<table class="table" style="display:table;">
 	  <thead>
 	  	<tr>
 	  		<th colspan="3" scope="col" style="display:table-cell; text-align:center; vertical-align:middle;">상품정보</th>
 	  		<th scope="col" style="display:table-cell; text-align:center; vertical-align:middle;">수량</th>
 	  		<th scope="col" style="display:table-cell; text-align:center; vertical-align:middle;">상품금액</th>
 	  		<th scope="col" style="display:table-cell; text-align:center; vertical-align:middle;">배송정보</th>
 	  		<th scope="col" style="display:table-cell; text-align:center; vertical-align:middle;">주문</th>
 	  	</tr>
 	  </thead>
 	  <c:forEach items="${cartList}" var="cartList">
 	  <tbody>
 	  	<tr>
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  	  		<div class="checkBox">
   					<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
   					<script type="text/javascript">
						$(".chBox").click(function(){
							$("#allCheck").prop("checked", false);
						});
   					</script>
  		  		</div>
 	  	  		<a href="#">
             		<img class="img-fluid rounded" src="${cartList.gdsImg}" alt="" width="100px" height="150px">
          		</a>
 	  		</td>
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  			${cartList.gdsName}
 	  			sdfs 
 	  		</td>
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
				  	
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
            	<button type="button" class="btn btn-primary" id="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button>
            	
            	<script type="text/javascript">
					$("#delete_${cartList.cartNum}_btn").click(function(){
						var confirm_val = confirm("정말 삭제하시겠습니까?");

						if(confirm_val) {
							var checkArr = new Array();
							
							checkArr.push($(this).attr("data-cartNum"));

							$.ajax({
								url : "/goods/deleteCart",
								type : "post",
								data : { chbox : checkArr },
								success : function(result){

									if(result == 1) {
										location.href = "/goods/cartList";
									} else {
										alert("삭제 실패");
									}
								}
							});
						}
					});
   		</script>
 	  		</td>
 	  	</tr>
 	  </tbody>
 	  </c:forEach> 
 	</table>
 <!-- 카트리스트 끝-->


 
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
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
