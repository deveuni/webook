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
<style type="text/css">
/* 버튼 */
.button {
  background-color: #008CBA; /* Blue */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.button2 {background-color: #199db3;} /* Blue */
/* 버튼 끝 */

/* 도서정보 테이블 */
table {
	 font-size: 18px; 
} 
tr.space {
  border-bottom: 10px solid #fff;
}
/* 도서정보 테이블 끝 */
</style>
</head>
<body>
<%
String userId = (String) session.getAttribute("userId");

%>

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
      		<input type="hidden" name="page" value="${cri.page}"> 
			<input type="hidden" name="pageSize" value="${cri.pageSize}">
			<input type="hidden" name="category" value="${category}"> 
    	    <input type="button" id="modify_Btn" value="수정"> 
    		<input type="button" id="delete_Btn" value="삭제">
    	</form>
       </li>
      </c:if>
     </ol> 
	<!-- 수정/삭제 버튼 관리자만 보이기 끝 -->
	
    <!-- 본문 -->
    <div class="row">
      <div class="col-md-8">
      <img src="${goods.gdsImg}" alt="" width="400px" height="450px"> 
      </div>

      <div class="col-md-4" style="margin-left: 0px">
        <h3 class="my-3">도서 정보</h3>
      <%--   <ul>
          <li> 분류 <b>${goods.category}</b></li>
          <li> 저자 <b>${goods.gdsAuthor}</b></li>
          <li> 정가 <b><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></b></li>
          <li> 수량 <b>+ ${goods.gdsStock} - </b></li>
          
          카트에 넣기 / 바로구매 / 배송안내
          출판사 출간날짜
          
        </ul> --%>
        
         <table>
           <colgroup>
            <col width="110">
            <col width="*">
           </colgroup>
         	<tr class="space">
         		<td>분류</td>
         		<td><b>${goods.category}</b></td>
         	</tr>
         	<tr class="space">
         		<td>저자</td>
         		<td><b>${goods.gdsAuthor}</b></td>
         	</tr>
         	<tr class="space">
         		<td>출판사</td>
         		<td><b>${goods.gdsCompany}</b></td>
         	</tr>
			<tr class="space">
				<td>가격</td>
				<td><b><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></b></td>
			</tr>
			<tr class="space">
				<td>수량</td>
				<td><b>+ ${goods.gdsStock} - </b></td>
			</tr>   
         </table>
         <br>
         <button class="button">카트에 넣기</button>
         <button class="button button2">바로구매</button>
      </div> 
    </div>
    <!-- 본문 끝 -->
    
    <br>
    <br>

  <!-- 도서정보, 도서리뷰 tab -->
  <div class="product-info-tabs">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
				  <a href="#description" class="nav-link active" id="description-tab" data-toggle="tab"
			              role="tab" aria-controls="description" aria-selected="true">도서정보</a>
				</li>
				<li class="nav-item">
				  <a href="#review" class="nav-link" id="review-tab" data-toggle="tab" role="tab"
					aria-controls="review" aria-selected="false">도서리뷰</a>
				</li>
			</ul>
			
			<br>

			<!-- 탭전환  -->
			<div class="tab-content" id="myTabContent">
				<!-- 상품정보 -->
				<div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
					${goods.gdsDes}
				</div>
				<!-- 상품정보 끝-->
				
				<!-- 상품리뷰 -->
				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					
					<c:if test="${userId != null}">
					<div class="card mb-2">
						<div class="card-header bg-light">
	        				<i class="fa fa-comment fa"></i> 도서리뷰
						</div>
						<div class="card-body">
						  <form name="frRe" id="frRe" method="post">
							<ul class="list-group list-group-flush">
		    					<li class="list-group-item">
									<div class="form-inline mb-2">
										<input type="hidden" name="reGdsNum" value="${goods.gdsNum}">
										<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
										<input type="text" class="form-control ml-2" id="replyId" name="reUserId" value="<%=userId%>" readonly> 
										<!-- <label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
										  <input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword"> -->
									</div> 
									<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="한글 기준 2000자까지 작성가능합니다."></textarea>
									<button type="button" class="btn btn-dark mt-3" id="reviewBtn" onclick="clickedReviewBtn();">등록</button> 
		    					</li>
							</ul>
						   </form>	
						  <!--  <button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">등록</button> -->
						</div>
					</div>
					</c:if>
					<!-- 리뷰 목록 -->
					<%@ include file="../goods/goodsReview.jsp" %>
					<!-- 리뷰 목록 끝 -->
					
				</div>
				<!-- 상품리뷰 끝 -->
			</div>		
  </div>
  <!-- 도서정보, 도서리뷰 tab 끝 -->
	
	
	
	
	
	
	

	
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
