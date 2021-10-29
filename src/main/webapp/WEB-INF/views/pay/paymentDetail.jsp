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
 
<!-- 결제창  -->
<div class="container">
  <h2>최종결제</h2>             
  <table class="table">
    <thead>
      <tr>
        <th>상품명</th>
        <th>결제금액</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>${gvo.gname}</td>
        <td>${gvo.bidprice}원</td>
        <td width="250px;">
        <div style="width: 270px; height: 50px;">
        <input type="hidden" name="gname" value="${gvo.gname}">
      	<input type="hidden" name="gno" value="${gvo.gno}">
      	<input type="hidden" name="lowestprice" value="${gvo.bidprice}">
        <input type="button" value="결제하기" id="btn1" class="payMove"> <input type="reset" value="취소하기" class="payMove">
         <!-- <a class="btn btn-primary" href="/pay/order">결제하기</a>&nbsp;<a class="btn btn-primary" href="#">취소하기</a> -->
        </div>
        </td>
      </tr>
     
    </tbody>
  </table>
</div><!-- 결제창  -->

 
 
 
 <!-- footer -->
   <jsp:include page="../include/footer.jsp"/>
<%--   <%@ include file="../include/footer.jsp" %> --%>
  <!-- footer -->

</body>
</html>