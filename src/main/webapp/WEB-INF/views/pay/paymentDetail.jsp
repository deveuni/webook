<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 카카오페이 결제모듈 스크립트 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
.container {
	width: 900px !important;
}
</style>
</head>
<body>

<!-- header -->
 <jsp:include page="../include/header.jsp"/>
 <!-- header -->
 
 <form name="order_form">
		<div class="container login-container" style="margin-bottom: 50px;">
			<div class="row">

				<div class="col-md-6 login-form-1">
					<h3>주문자 정보</h3>

					<div class="form-group">
						<input type="text" class="form-control" id="username"
							name="username" value="${memVO.username}" readonly />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="phone" name="phone"
							value="${memVO.phone}" readonly />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="addr1" name="addr1"
							value="${memVO.addr1}" readonly />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="addr2" name="addr2"
							value="${memVO.addr2}" readonly />
					</div>

				</div>
				<div class="col-md-6 login-form-2">

					<h3>배송지 정보</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름을 입력해주세요"
							id="re_username" name="re_username" />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="연락처를 입력해주세요"
							id="re_phone" name="re_phone" />
					</div>
					<div class="form-group" style="display: flex;">
						<input id="postcode1" type="hidden" value="" style="width: 50px;"
							readonly /> <input id="postcode2" type="hidden" value=""
							style="width: 50px;" readonly /> <input id="zonecode"
							type="hidden" value="" style="width: 50px;" readonly /> <input
							type="text" class="form-control" placeholder="주소를 입력해주세요"
							style="float: left; width: 300px;" id="re_addr1" name="re_addr1"
							readonly /> <input type="button" class="payMove"
							onClick="openDaumZipAddress();" value="주소 찾기"
							style="float: right; width: 100px; padding: 8px 10px; font-size: 14px; margin: auto;">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="상세주소를 입력해주세요"
							id="re_addr2" name="re_addr2" />
					</div>
					<div class="form-group">
						<button type="button" class="payMove"
							onclick="javascript:same_info(document.order_form)"
							style="margin-left: 184px;">
							<span class="glyphicon glyphicon-plus"></span> 주문자 정보와 동일하게
						</button>
					</div>


				</div>



				<br> <br>
				<div class="col-md-12">
					<h1 class="my-4">상품 정보</h1>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<table class="table" cellspacing="0">
								<thead>
									<tr>
										<th>판매물품 명</th>
										<th>판매물품 번호</th>
										<th>판매물품 가격</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${gvo.gname}</td>
										<td>${gvo.gno}</td>
										<td>${gvo.finalprice}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-md-12">
					<h1 class="my-4">최종 결제</h1>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<table class="table" cellspacing="0">
								<thead>
									<tr>
										<th>판매물품 명</th>																			
										<th>판매물품 최종가격</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${gvo.gname}</a></td>																				
										<td>${gvo.finalprice}원</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="pay_ok" style="margin-left: 40%;">
				<input type="hidden" name="gname" value="${gvo.gname}"> <input
					type="hidden" name="gno" value="${gvo.gno}"> <input
					type="hidden" name="finalprice" value="${gvo.finalprice}">
				<input type="button" value="결제하기" id="btn1" class="payMove">
				<input type="button" value="취소하기" onclick="back()"
					class="payMoveFail">
			</div>
		</div>
	</form>
 
 
 <!-- footer -->
   <jsp:include page="../include/footer.jsp"/>
<%--   <%@ include file="../include/footer.jsp" %> --%>
  <!-- footer -->

</body>
</html>