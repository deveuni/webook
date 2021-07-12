<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="card mb-2">
	<div class="card-header bg-light">
	     <i class="fa fa-comment fa"></i> 도서리뷰목록
	</div>
	
	<!-- <table id="reviewList" class="container">
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
			<tr>
				<td></td>
				<td></td>
				<td><textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="한글 기준 2000자까지 작성가능합니다."></textarea></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	
	</table> -->
	
	
	<div class="card-body">
		<form name="frRe" id="frRe" method="post">
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
		</form>	
						  <!--  <button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">등록</button> -->
	</div>
</div>

<script type="text/javascript">
// 공통 변수 초기화
let gdsNum = ${param.gdsNum};



</script>





</body>
</html>