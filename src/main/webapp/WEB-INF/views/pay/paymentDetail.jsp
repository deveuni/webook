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
 
 div class="form-group">
                        <label for="date" class="col-sm-3 control-label">상세주소</label>
                        <div class="col-sm-9">                        	
                            <input type="text" class="form-control" id="re_addr2" name="re_addr2">                           
                        </div>
                    </div>
                     <div class="form-group">
                        <div class="col-sm-12 text-right">
                            <button type="button" class="btn btn-default preview-add-button" onclick="javascript:same_info(document.order_form)">
                                <span class="glyphicon glyphicon-plus"></span> 주문자 정보와 동일하게
                            </button>
                        </div>
 
 
 
 <!-- footer -->
   <jsp:include page="../include/footer.jsp"/>
<%--   <%@ include file="../include/footer.jsp" %> --%>
  <!-- footer -->

</body>
</html>