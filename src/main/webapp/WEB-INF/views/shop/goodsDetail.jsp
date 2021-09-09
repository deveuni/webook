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
/* 버튼 */
.addCart_btn {
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
.buyCart_btn {
  background-color: #199db3;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;

} /* Blue */
/* 버튼 끝 */

.plus{ font-size:15px; border:1px; background:gray; }
.minus{ font-size:15px; border:1px; background:gray; }

/* 도서정보 테이블 */
table {
	 font-size: 18px; 
} 
tr.space {
  border-bottom: 10px solid #fff;
}
/* 도서정보 테이블 끝 */

/* 리뷰 리스트 */
ol {list-style: none;}
section.replyList {padding: 30px 0;}
section.replyList ol {padding: 0; margin: 0;}
section.replyList ol li {padding: 10px 0; border-bottom: 2px solid #eee;}
section.replyList div.userInfo {}
section.replyList div.userInfo .userName {font-size: 24px; font-weight: bold;}
section.replyList div.userInfo .date {color: #999; disply:inline-block; margin-left: 10px;}
section.replyList div.replyContent {padding: 10px; margin: 20px 0;}

section.replyList div.replyFooter button {font-size: 14px; border: 1px solid #999; background: none; margin-right: 10px;}
/* 리뷰 리스트 끝 */

/* 리뷰 수정 모달창 */
div.replyModal { position:relative; z-index:1; display: none;}
div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:525px; height:290px; padding:20px 10px; background:#fff; border:2px solid #666; }
div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
div.modalContent button.modal_cancel { margin-left:20px; }
/* 리뷰 수정 모달창 끝 */
</style>

 
<script type="text/javascript">
// 수정/삭제 이동
 $(document).ready(function(){
	var gdsNum = $('#gdsNum').val();

	// 수정
	$(document).on("click","#modify_Btn",function(){
		location.href = '/admin/goods/modify?n=${goods.gdsNum}';
	});

	// 삭제
	$(document).on("click","#delete_Btn",function(){
		var con = confirm("정말로 삭제하시겠습니까?");
		if(con){
			location.href = '/admin/goods/delete?n=${goods.gdsNum}';
		}
	});
}); 

// 리뷰 리스트
function replyList() {
								
	var gdsNum = ${goods.gdsNum};
	$.getJSON("/shop/detail/replyList" + "?n=" + gdsNum, function(data){
		var str = "";

		$(data).each(function(){
			
			console.log(data);

			// 날짜 데이터를 보기 쉽게 변환 
			var repDate = new Date(this.repDate);
			repDate = repDate.toLocaleDateString("ko-US")

			// HTML 코드 조립
			str += "<li data-repNum='" + this.repNum + "'>"
				+ "<div class='userInfo'>"
				+ "<span class='userName'>" + this.userName + "</span>"
				+ "<span class='date'>" + repDate + "</span>"
				+ "</div>"
				+ "<div class='replyContent'>" + this.repCon + "</div>"

				+ "<c:if test='${member != null}'>"
				
				+ "<div class='replyFooter'>" 
				+ "<button type='button' class='modify' data-repNum='" + this.repNum +"'>수정</button>" 
				+ "<button type='button' class='delete' data-repNum='" + this.repNum +"'>삭제</button>" 

				+ "</c:if>"
				
				+ "</li>";
			});

				$("section.replyList ol").html(str);
		});
	}

</script>

</head>
<body>
<% String userId = (String) session.getAttribute("userId"); %>  

 <!-- header -->
 <jsp:include page="../include/header.jsp"/>
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
				<td>
				 <button type="button" class="plus">+</button>
				 <input type="number" class="numBox" min="1" max="${goods.gdsStock}" value="1" readonly style="width: 42px;"/>
				 <button type="button" class="minus">-</button>
				</td> 
			</tr>   
         </table>
         <br>
         <button type="button" class="addCart_btn">카트에 넣기</button>
         <button class="buyCart_btn">바로구매</button>
      </div> 
    </div>
    <!-- 본문 끝 -->
    
    <script type="text/javascript">

		// 수량 +
		$(".plus").click(function(){
			var num = $(".numBox").val();
			var plusNum = Number(num) + 1;

			if(plusNum >= ${goods.gdsStock}) {
				$(".numBox").val(num);
			} else {
				$(".numBox").val(plusNum);
			}
		});

		// 수량 -
		$(".minus").click(function(){
			var num = $(".numBox").val();
			var minusNum = Number(num) - 1;

			if(minusNum <= 0) {
				$(".numBox").val(num);
			} else {
				$(".numBox").val(minusNum);
			}
		});
		
    
    	// 카트 담기
		$(".addCart_btn").click(function(){
			var gdsNum = $("#gdsNum").val();
			var cartStock = $(".numBox").val();

			var data = {
					gdsNum : gdsNum, 
					cartStock : cartStock
					};

			$.ajax({
				url : "/admin/goods/detail/addCart",
				type : "post",
				data : data, 
				success : function(result){

					if(result == 1) {
						alert("카트 담기 성공");
						$(".numBox").val("1");
					} else {
						alert("로그인한 회원만 사용할 수 있습니다.");
						$(".numBox").val("1");
					}
				},
				error : function(){
					alert("카트 담기 실패");
				}
			});
		});
    </script>
    
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
				  <a href="#reply" class="nav-link" id="review-tab" data-toggle="tab" role="tab"
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
				<div class="tab-pane fade" id="reply" role="tabpanel" aria-labelledby="review-tab">
				
					<c:if test="${member == null}">
						<p>소감을 남기시려면 <a href="/member/signin">로그인</a>해주세요</p>
					</c:if>
					
					<c:if test="${member != null}">
					<!-- <button class="btn btn-dark mt-3" id="reviewToggleBtn">리뷰쓰기</button> -->
					<div class="card mb-2" id="reviewToggle"> 
					
					<section class="replyForm">
					  <form  role="form" method="post" autocomplete="off">
						
						<input type="hidden" name="gdsNum" id="gdsNum" value="${goods.gdsNum}">
						
						<div class="card-header bg-light">
	        				<!-- <i class="fa fa-comment fa"></i> 도서리뷰 -->
						</div> 
						
						<div class="card-body">
							<!-- <ul class="list-group list-group-flush">
		    					<li class="list-group-item"> -->
									<div class="form-inline mb-2">
										
										<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
										<input type="text" class="form-control ml-2" id="replyId" name="reUserId" value="<%=userId%>" readonly> 
										<!-- <label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
										  <input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword"> -->
									</div> 
									<textarea class="form-control" name="repCon" id="repCon" rows="3" placeholder="한글 기준 2000자까지 작성가능합니다."></textarea>
									
									<button type="button" class="btn btn-dark mt-3" id="reply_btn" >등록</button> 
									
									<script type="text/javascript">
										$("#reply_btn").click(function(){

											var formObj = $(".replyForm form[role='form']");
											var gdsNum = $("#gdsNum").val();
											var repCon = $("#repCon").val();

											var data = {
													gdsNum : gdsNum, 
													repCon : repCon
												};

											$.ajax({
												url : "/shop/detail/registReply", 
												type : "post", 
												data : data, 
												success : function(){
													replyList();
													$("#repCon").val("");
												}
											});
										});
									</script>
									
		    				<!-- 	</li>
							</ul> -->
							</div>
							
						   </form>	
						 </section>
						</div> 
						</c:if>
						
						<section class="replyList">
							<ol>
								<%-- <c:forEach items="${reply}" var="reply">
								<li>
									<div class="userInfo">
									<span class="userName">${reply.userName}</span>
									<span class="date"><fmt:formatDate value="${reply.repDate}" pattern="yyyy-MM-dd"/></span>
									</div>
									<div class="replyContent">${reply.repCon}</div>
								</li>
								</c:forEach> --%>
							</ol>
							
							<script type="text/javascript">
								replyList();
							</script>
							
							<script type="text/javascript">

								// 리뷰 수정 버튼 클릭시
								$(document).on("click", ".modify", function(){
									//$(".replyModal").attr("style", "display:block;");
									$(".replyModal").fadeIn(200);

									var repNum = $(this).attr("data-repNum");
									var repCon = $(this).parent().parent().children(".replyContent").text();

									$(".modal_repCon").val(repCon);
									$(".modal_modify_btn").attr("data-repNum", repNum);
								});

								
								
								// 리뷰 삭제하기
								$(document).on("click", ".delete", function(){

								  var deleteConfirm = confirm("정말로 삭제하시겠습니까?");

								  if(deleteConfirm) {

									var data = { repNum : $(this).attr("data-repNum") };

									$.ajax({
										url : "/shop/detail/deleteReply", 
										type : "post", 
										data : data, 
										success : function(result){
											if(result == 1){
												replyList();
											} else {
												alert("작성자 본인만 삭제할 수 있습니다.");
											}
										}, 
										error : function(){
											alert("로그인이 필요합니다.");
										}
									});

								  }
								});

								





								
							</script>
							
							
						</section>
					
					</div>
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
   <jsp:include page="../include/footer.jsp"/>
<%--   <%@ include file="../include/footer.jsp" %> --%>
  <!-- footer -->

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- 리뷰 수정 모달창 -->
	<div class="replyModal">
	
		<div class="modalContent">
		
			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>
			
			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancel">취소</button>
			</div>
		</div>
		
		<div class="modalBackground"></div>
	</div>
	<!-- 리뷰 수정 모달창 끝 -->
	
	<script type="text/javascript">

	// 리뷰 수정하기
	$(".modal_modify_btn").click(function(){
		var modifyConfirm = confirm("정말로 수정하시겠습니까?");

		if(modifyConfirm) {
			var data = {
						repNum : $(this).attr("data-repNum"), 
						repCon : $(".modal_repCon").val()
					}; // ReplyVO 형태로 데이터 생성

			$.ajax({
				url : "/shop/detail/modifyReply", 
				type : "post", 
				data : data, 
				success : function(result){

					if(result == 1) {
						replyList(); // 리스트 새로고침
						$(".replyModal").fadeOut(200);
					} else {
						alert("작성자만 수정할 수 있습니다.");
					}
				}, 
				error : function(){
					alert("로그인이 필요합니다.");
				}
			});
		}
	});

	// 리뷰 수정 취소하기
	$(".modal_cancel").click(function(){
		//$(".replyModal").attr("style", "display:none;");
		$(".replyModal").fadeOut(200);
	});
	</script>


</body>
</html>
