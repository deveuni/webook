<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.updateBtnCustom{
	width:60px;padding-right:0px;padding-left:0px;display:inline;background:#FFC107;border:solid 2px #FFC107;
}
.deleteBtnCustom{
	width:60px;padding-right:0px;padding-left:0px;display:inline;background:#DC3545;border:solid 2px #DC3545;
}
.collapseTextareaCss{
	width:100%; border: 0;
}
.collapseInputCss{
	width:100%; border: 0;
}
</style>
<body>
<%-- <%
String userId = (String) session.getAttribute("userId");
%> --%>


<div class="card mb-2">
	<div class="card-header bg-light">
	     <i class="fa fa-comment fa"></i> 도서리뷰목록
	</div>
	
	<table id="reviewList" class="container">
		<colgroup>
			<col width="7%" />
			<col width="15%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th></th>
				<th>아이디</th>
				<th>리뷰내용</th>
				<th>작성일</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="ppap2">
		<c:forEach items="${reviewList}" var="review">
			<tr id="tr_${review.reNum}">
				<td><input type="hidden" id="td_reNum_${review.reNum}" class="collapseInputCss" value="${review.reNum}" readonly></td>
				<td>${fn:substring(review.reUserId,0, 4)}*****</td>
				<td><textarea class="collapseTextareaCss" id="id_reDes_${review.reNum}" rows="3" readonly>${review.reDes}</textarea></td>
				<td><fmt:formatDate value="${review.reRegdate}" pattern="yyyy-MM-dd" /></td>
				<td>
					<%-- <c:if test="${userId == review.reUserId || userId == 'webook' || userId == goods.gdsName}"> --%>
					<c:if test="${review.re_seq == 0 }">
					<button class="round-black-btn" id="rereplyBtn_${review.reNum}" onclick="rereplyRe(${review.reNum});">댓글</button><br>
					</c:if>
				<button class="round-black-btn updateBtnCustom" id="updateBtn_${review.reNum}" onclick="updateRe(${review.reNum});"> 수정 </button>
				<button class="round-black-btn deleteBtnCustom" onclick="deleteRe(${review.reNum});">삭제</button>
				
				</td>
			</tr>
		</c:forEach>
		</tbody>
	
	</table> 
	
	
	<%-- <div class="card-body">
		<!-- <form name="frRe" id="frRe" method="post"> -->
			<c:forEach items="${reviewList}" var="review">
			<ul class="list-group list-group-flush">
		    	<li class="list-group-item">
					<div class="form-inline mb-2">
						<input type="hidden" name="reGdsNum" value="${goods.gdsNum}">
						<!-- 리뷰제목 -->
						<!-- <label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label> -->
						<input type="text" class="form-control ml-2" id="replyPassword" value="리뷰제목">  
						<!-- 리뷰쓴 아이디 -->
						<!-- <label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label> -->
						<input type="text" class="form-control ml-2" id="replyId" name="reUserId" value="리뷰쓴아이디" readonly>  
						<input type="text" class="form-control ml-2" id="replyId" name="reUserId" value="리뷰등록일" readonly>  
										
					</div> 
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" >리뷰내용</textarea>
						<button type="button" class="btn btn-dark mt-3" id="reviewBtn" onclick="clickedReviewBtn();">등록</button> 
		    	</li>
			</ul>
			</c:forEach>
		<!-- </form>	 -->
						  <!--  <button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">등록</button> -->
	</div> --%>
</div>

<script type="text/javascript">
// 공통 변수 초기화
let gdsNum = ${param.gdsNum};
let ck_reDes = "";
let ck_reGdsNum = 0;

// 오늘일자 포맷팅
let today = new Date();
let dd = today.getDate();
let mm = today.getMonth()+1; // January is 0
let yyyy = today.getFullYear();

	if(dd<10) {
		dd='0'+dd
	}
	if(mm<10) {
		mm='0'+mm
	}

today = yyyy+'-'+mm+'-'_dd;

// 리뷰쓰기 토글
$('#reviewToggle').hide();
$('#reviewToggleBtn').click(function(){
	$('#reviewToggle').slideToggle();
}); 

// 리뷰 등록 버튼 클릭시
function clickedReviewBtn(){
	let reDes = document.frRe.reDes.value;
	let reUserIdFormat = document.frRe.reUserId.value;

	let info = {
		reUserId: reUserIdFormat, 
		reGdsNum: document.frRe.reGdsNum.value, 
		reDes: reDes,
	};

	// 리뷰 내용이 없는 경우
	if(reDes == ""){
		alert("리뷰를 작성해주세요");
		document.getElementById('reDes').focus();
		return false;
	}

	$.ajax({
		type: "post", // 데이터를 보낼 방식
		url: "/detail/review/insert", // 데이터를 보낼 url
		data: {
			reUserId: document.frRe.reUserId.value, 
			reGdsNum: document.frRe.reGdsNum.value, 
			reDes: reDes
		}, 
		success: function(data){//데이터를 보내는 것이 성공했을 시 출력 메시지
			if(data){
				alert("리뷰가 등록되었습니다.");
				$("#reDes").val("");
				$("#ppap2").after("<tr><td> </td><td>"+info.reUserId+"</td><td>"+info.reDes+"</td><td>"+today+"</td>"
						+"<td><button class='round-black-btn updateBtnCustom' id='updateBtn_"+data+"' onclick='updateReview("+data+");'> 수정 </button>"
						+"<button class='round-black-btn deleteBtnCustom' style='margin-left: 5px;' onclick='deleteReview("+data+");'>삭제</button></td></tr>"
						);
			}else{
				alert("리뷰 등록에 오류가 발생했습니다. 다시 시도하세요");
			}
		},
		error:function(request,status,error){
				alert("예상치 못한 에러가 발생했습니다. 재접속하세요");
		}
	});
};
// 리뷰 등록 버튼 클릭시 끝




</script>





</body>
</html>