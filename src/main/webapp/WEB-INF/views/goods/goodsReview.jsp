<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
<%
String userId = (String) session.getAttribute("userId");

%>


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


// 리뷰 목록!! 등록!! 중임다. 상세페이지랑 리뷰페이징 연결

// 리뷰 등록 버튼 클릭시
function clickedReviewBtn(){
	let reDes = document.frRe.reDes.value;
	let 
}

// 리뷰 등록 버튼 클릭시 끝




</script>





</body>
</html>