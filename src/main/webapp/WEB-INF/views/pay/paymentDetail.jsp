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
 
 <h4>배송지 정보</h4>
            <div class="panel panel-default">
                <div class="panel-body form-horizontal payment-form">
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">이름</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="re_username" name="re_username">
                        </div>
                    </div>                    
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">연락처</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="re_phone" name="re_phone">
                        </div>
                    </div>        
 

                        <label for="date" class="col-sm-3 control-label">상세주소</label>
                        <div class="col-sm-9">                        	
                            <input type="text" class="form-control" id="re_addr2" name="re_addr2">                           
                        </div>
                    </div>
                     
                        
                        <div class="form-group">
                        <label for="date" class="col-sm-3 control-label">주소</label>
                        <div class="col-sm-9">
                           <input id="postcode1" type="hidden" value="" style="width:50px;" readonly/>
                           <input id="postcode2" type="hidden" value="" style="width:50px;" readonly/>
                           <input id="zonecode" type="hidden" value="" style="width:50px;" readonly/>
                           <input type="text" class="form-control" id="re_addr1" name="re_addr1" readonly style="width:218px;display: inline-block;">  
                           <input type="button" class="payMove" onClick="openDaumZipAddress();" value = "주소 찾기" style="padding: 8px 10px;font-size: 14px;">                              
                        </div>
                        
                    </div> 
 
 
 
 <!-- footer -->
   <jsp:include page="../include/footer.jsp"/>
<%--   <%@ include file="../include/footer.jsp" %> --%>
  <!-- footer -->

</body>
</html>