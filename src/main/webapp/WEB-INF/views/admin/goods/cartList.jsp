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

/* 총 합계 */
.listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; }
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
.listResult::after { content:""; display:block; clear:both; }
/* 총 합계 끝 */

/* 주문정보 */
.orderInfo { border:5px solid #eee; padding:20px; width: 1067px; display: none; }
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:15px; border:2px solid #ccc; padding:5px 10px;  margin-right:20px;}
/* 주문정보 끝 */


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
   		<button type="button" id="selectDelete_btn" class="btn btn-info">삭제</button> 
   		<script type="text/javascript">
			$("#selectDelete_btn").click(function(){
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
 	  
 	  <c:set var="sum" value="0"/>
 	  
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
 	  
		<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
 	  
 	  </c:forEach> 
 	</table>
 <!-- 카트리스트 끝-->
 	
 	<div class="listResult">
 	  <div class="sum">
 		총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}"/>원
 	  </div>
 	  <div class="orderOpen">
 	  	<button type="button" id="orderOpen_btn"  class="btn btn-info">주문 정보 입력</button>
 	  	
 	  	<script type="text/javascript">
			$("#orderOpen_btn").click(function(){
				$(".orderInfo").slideDown();
				$("#orderOpen_btn").slideUp();
			});
 	  	</script>
 	  	
 	  </div>
 	</div>
 	
 	 <div class="card mb-4">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-6">
          	<div class="orderInfo"> 
 			  <form role="form" method="post" autocomplete="off">
    
  				<input type="hidden" name="amount" value="${sum}" />
    
  				<div class="inputArea">
   				 <label for="">수령인</label>
   				 <input type="text" name="orderRec" id="orderRec" required="required" />
  				</div>
  
  				<div class="inputArea">
   				 <label for="orderPhon">수령인 연락처</label>
   				 <input type="text" name="orderPhon" id="orderPhon" required="required" />
  				</div>
  
  				<div class="inputArea">
   				 <label for="postcode">우편번호</label>
   				 <input type="text" name="postcode" id="postcode" required="required" />
  				</div>
  
  				<div class="inputArea">
   				 <label for="userAddr1">1차 주소</label>
   				 <input type="text" name="userAddr1" id="userAddr1" required="required" />
  				</div>
  
  				<div class="inputArea">
   				 <label for="userAddr2">2차 주소</label>
   				 <input type="text" name="userAddr2" id="userAddr2" required="required" />
  				</div>
  
  				<div class="inputArea">
   				 <button type="submit" id="order_btn" class="btn btn-info">주문</button>
   				 <button type="button" id="cancel_btn" class="btn btn-primary">취소</button> 
   				 
   				 <script type="text/javascript">
					$("#cancel_btn").click(function(){
						$(".orderInfo").slideUp();
						$("#orderOpen_btn").slideDown();
					});
 	  			</script>
  				</div>
 			 </form> 
			</div>
          </div>
        </div>
      </div>
      <div class="card-footer text-muted">
        Posted on January 1, 2017 by
        <a href="#">Start Bootstrap</a>
      </div>
      </div>

	<br>
 
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
