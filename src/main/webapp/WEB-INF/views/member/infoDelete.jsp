<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>webook 온라인서점</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${pageContext.request.contextPath}/resources/css/signup&in/signup&in.css" rel="stylesheet"> 
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

</head>
<body id="LoginForm">

<div class="container">
<div class="login-form">
<div class="main-div">
   <div class="panel">
   	<h1><a href="/webook" class="webook-main">webook</a></h1>
    <h5>회원탈퇴</h5>
    </div>
    
    <form action="/member/infoDelete" method="post" id="delForm" role="form">
   	  <input type="hidden" name="userId" value="${memVO.userId}">
   	 
   	  <label>아이디</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userId" id="userId" value="${memVO.userId}" readonly>
       </div>
   	 
   	  <label>비밀번호</label>
       <div class="form-group">
         <input type="password" class="form-control" name="userPass" id="userPass">
         <div class="check_font" id="userPassCheck"></div>
       </div>
       <input type="submit"  id="submit" value="회원탈퇴" id="signUp" class="btn btn-primary">
    </form>
    </div>
	</div>
	</div>


<script type="text/javascript">

$(document).ready(function(){
	$("#submit").on("click", function(){
		if($("#userPass").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			return false;
	}
		
		$.ajax({
			url : "/member/passChk",
			type : "POST",
			dataType : "json",
			data : $("#delForm").serializeArray(),
			success : function(data){
				if(data == 0){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				} else {
					if(confirm("회원탈퇴 하시겠습니까?")){
						$("#delForm").submit();
					}
				}
			}
		})
	})
});



</script>
	

</body>
</html>