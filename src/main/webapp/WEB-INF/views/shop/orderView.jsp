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

/* 주문정보 */
/* .orderInfo { border:5px solid #eee; padding:20px; width: 1067px; display: none; }
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:15px; border:2px solid #ccc; padding:5px 10px;  margin-right:20px;} */
/* 주문정보 끝 */

/* orderInfo */
.orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
/* orderInfo 끝 */

/* 배송상태 */
.deliveryChange { text-align:right; }
.delivery1_btn, 
.delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
/* 배송상태 끝 */

</style>  
</head>
<body>

 <!-- header -->
 <jsp:include page="../include/header.jsp"/>
 <!-- header -->
 <br><br>

  <!-- Page Content -->
  <div class="container">
  
  
 

    <!-- 주문리스트 -->
    <h1 class="mt-4 mb-3">주문리스트</h1>

    <ol class="breadcrumb"></ol> 
    
    <div class="orderInfo">
  		<c:forEach items="${orderView}" var="orderView" varStatus="status">
   			<c:if test="${status.first}">
   				<p><span>주문자</span>${orderView.userId}</p>
    			<p><span>수령인</span>${orderView.orderRec}</p>
    			<p><span>주소</span>(${orderView.postcode}) ${orderView.userAddr1} ${orderView.userAddr2}</p>
    			<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
    			<p><span>배송</span>${orderView.delivery}</p>
    			
    			<div class="deliveryChange">
    			  <form role="form" method="post" class="deliveryForm">
    			  
    			    <input type="hidden" name="orderId" value="${orderView.orderId}">
    			    <input type="hidden" name="delivery" class="delivery" value="">
    			    
    				<!-- <button type="button" class="delivery1_btn">배송중</button>
    				<button type="button" class="delivery2_btn">배송완료</button>
    				
    				<script type="text/javascript">
						$(".delivery1_btn").click(function(){
							$(".delivery").val("배송중");
							run();
						});

						$(".delivery2_btn").click(function(){
							$(".delivery").val("배송완료");
							run();
						});

						function run(){
							$(".deliveryForm").submit();
						}
    				</script> -->
    			  </form>
    			</div>
   			</c:if>
  		</c:forEach>
 </div>
	
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
 	  		<th colspan="3" scope="col" style="display:table-cell; text-align:center; vertical-align:middle;">상품명</th>
 	  		<th scope="col" style="display:table-cell; text-align:center; vertical-align:middle;">개당가격</th>
 	  		<th scope="col" style="display:table-cell; text-align:center; vertical-align:middle;">구입수량</th>
 	  		<th scope="col" style="display:table-cell; text-align:center; vertical-align:middle;">최종가격</th>
 	  		<th scope="col" style="display:table-cell; text-align:center; vertical-align:middle;">배송상태</th>
 	  		<th scope="col" style="display:table-cell; text-align:center; vertical-align:middle;"></th>
 	  	</tr>
 	  </thead>
 	  
 	  <c:set var="sum" value="0"/>
 	  
 	  <c:forEach items="${orderView}" var="orderView">
 	  <tbody>
 	  	<tr>
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  	  		<div class="checkBox">
   					<input type="checkbox" name="chBox" class="chBox" data-cartNum="${orderList.orderId}" />
   					<script type="text/javascript">
						$(".chBox").click(function(){
							$("#allCheck").prop("checked", false);
						});
   					</script>
  		  		</div> 
 	  	  		<a href="#">
             		<img class="img-fluid rounded" src="${orderView.gdsImg}" alt="" width="100px" height="150px">
          		</a> 
 	  		</td>
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  			${orderView.gdsName}
 	  		</td>
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  		</td>
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
				<fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />  	
 	  		</td> 
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  			${orderView.cartStock} 개
 	  		</td>
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
				<fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원 
 	  		</td>
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
				${orderView.delivery}
 	  		</td>
 	  		<td style="display:table-cell; text-align:center; vertical-align:middle;">
 	  			<!-- <a href="#" class="btn btn-primary">주문하기</a> -->
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
 <!-- 주문리스트 끝-->
 	
 
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
