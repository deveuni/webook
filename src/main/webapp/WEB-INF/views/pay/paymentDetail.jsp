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

<script type="text/javascript">
	function same_info(f) {
			f.re_username.value = f.username.value;
			f.re_phone.value = f.phone.value;
			f.re_addr1.value = f.addr1.value;
			f.re_addr2.value = f.addr2.value;
	}	

	function openDaumZipAddress() {

		new daum.Postcode({

			oncomplete:function(data) {

				jQuery("#postcode1").val(data.postcode1);

				jQuery("#postcode2").val(data.postcode2);

				jQuery("#zonecode").val(data.zonecode);

				jQuery("#re_addr1").val(data.address);

				jQuery("#re_addr2").focus();

				console.log(data);

			}

		}).open();

	}	
</script>

<script>
	var re_username = document.order_form.re_username;
	var re_phone = document.order_form.re_phone;
	var re_addr1 = document.order_form.re_addr1;
	var re_addr2 = document.order_form.re_addr2;	
	
	
	
   $('#btn1').click(function(){
	   if(!re_username.value){
			alert("받는사람 이름을 입력해주세요.");
			$("#re_username").focus();
			return false;
	   }else if(!re_phone.value){
		   alert("연락가능한 연락처를 입력해주세요.");
			$("#re_phone").focus();
			return false;
	   }else if(!re_addr1.value){
		   alert("받으실 주소를 입력해주세요.");
			$("#re_addr1").focus();
			return false;	   		   
	   }else {
       		      	
    	var IMP = window.IMP; // 생략가능
        IMP.init('imp24656167'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용		
        // imp24656167 <- 내 식별코드
        var msg;
        
    	IMP.request_pay({
    	    pg : 'kakaopay',
    	    pay_method : 'card',
    	    merchant_uid : 'merchant_' + new Date().getTime(),
    	    name : '${gvo.gname}',
            amount : ${gvo.bidprice},       
            buyer_name : '${memVO.username}',
            buyer_tel : '${memVO.phone}',
            buyer_addr : '${memVO.addr1}'+' '+'${memVO.addr2}',
    	}, function(rsp) {
    	    if ( rsp.success ) {
    	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	    	jQuery.ajax({
    	    		url: "/pay/payment", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    	    		type: 'POST',
    	    		dataType: 'json',
    	    		data: {
    		    		// imp_uid : rsp.imp_uid,
    		    		p_merchant_uid : 'merchant_' + new Date().getTime(),
    		    		p_g_gno : ${gvo.gno},
    		    		pg : 'kakaopay',
    		    		p_method : 'card',
    		    		p_buyer_name : '${memVO.username}',
    		    		p_buyer_tel : '${memVO.phone}',
    		    		p_g_gname : '${gvo.gname}',    		    		
    		    		p_g_bidprice : ${gvo.bidprice},
    		    		p_re_name : document.getElementById('re_username').value,
    		    		p_re_tel : document.getElementById('re_phone').value,
    		    		p_re_addr1 : document.getElementById('re_addr1').value,
    		    		p_re_addr2 : document.getElementById('re_addr2').value
    		    		//기타 필요한 데이터가 있으면 추가 전달
    	    		}
    	    	}).done(function(data) {
    	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    	    		if ( everythings_fine ) {
    	    			var msg = '결제가 완료되었습니다.';
    	    			msg += '\n고유ID : ' + rsp.imp_uid;
    	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    	    			msg += '\결제 금액 : ' + rsp.paid_amount;
    	    			msg += '카드 승인번호 : ' + rsp.apply_num;

    	    			alert(msg);
    	    		} else {
    	    			//[3] 아직 제대로 결제가 되지 않았습니다.
    	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    	    		}    	    		
    	    	});    	    	    	    	
   
    	    	alert("결제 성공"); // 임시로 띄어놓음. alert없으면 DB에 insert처리하는 시간보다 빨리 처리되서 상품정보 출력X    	    	    		    	    	
        	    location.href="/pay/order?gno=" + ${gvo.gno}; 
        	           	    
    	    	
    	    } else {
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;

    	        alert(msg);
    	    }     	     	   
    	});
	   }// else문 종료        
    });
    </script> 7854


<!-- Pagination -->
    <ul class="pagination justify-content-center mb-4">
      <li class="page-item">
        <a class="page-link" href="#">&larr; Older</a>
      </li>
      <li class="page-item disabled">
        <a class="page-link" href="#">Newer &rarr;</a>
      </li>
    </ul>

 
 
 
 <!-- footer -->
   <jsp:include page="../include/footer.jsp"/>
<%--   <%@ include file="../include/footer.jsp" %> --%>
  <!-- footer -->

</body>
</html>