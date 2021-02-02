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
    <h5>비밀번호수정</h5>
    </div>
    
    <form action="/member/updatePw" method="post" id="pwForm" role="form">
   	  <input type="hidden" name="userId" value="${memVO.userId}">
   	 
   	  <label>기존 비밀번호</label>
       <div class="form-group">
         <input type="password" class="form-control" name="oldPw" id="oldPw" onkeyup="oldPw()">
         <div class="check_font" id="userPassCheck"></div>
       </div>
   	 
   	  <label>새로운 비밀번호</label>
       <div class="form-group">
         <input type="password" class="form-control" name="userPass" id="userPass" onkeyup="userPassVal()">
         <div class="check_font" id="userPassCheck"></div>
       </div>
       
       <label>새로운 비밀번호 재확인</label>
       <div class="form-group">
         <input type="password" class="form-control" name="userPassRe" id="userPassRe" onkeyup="userPassReVal()">
         <div class="check_font" id="userPassReCheck"></div>
       </div>
       
       <input type="submit" value="비밀번호수정" id="signUp" class="btn btn-primary">
       
    </form>
    </div>
	</div>
	</div>


<script type="text/javascript">


// 기존 비밀번호 일치 체크
/* function oldPw(){
	var oldPw = $('#oldPw').val();

	
} */



// 비밀번호 체크
function userPassVal(){
	var pass1 = $('#userPass').val();
	var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

	// 비밀번호 유효성 체크
	if(pass1.length < 8 || pass1.length > 16 ){
		$("#userPassCheck").text("8~16자 영문, 숫자, 특수문자를 사용하세요.").css("color", "red");
		$("#signUp").attr("disabled", true);
	} else if(pwJ.test(pass1) == false){
		$("#userPassCheck").text("8~16자 영문, 숫자, 특수문자를 사용하세요.").css("color", "red");
		$("#signUp").attr("disabled", true);
	} else if(pass1.length == 0) {
		$("#userPassCheck").text("필수 정보입니다.").css("color", "red");
		$("#signUp").attr("disabled", true);
	} else {
		$("#userPassCheck").text("");
		$("#signUp").attr("disabled", false);
	}
}

// 비밀번호 재확인 체크
function userPassReVal(){
	var pass1 = $('#userPass').val();
	var pass2 = $('#userPassRe').val();
	var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

	// 비밀번호 재확인 일치 체크
	if(pass1 == pass2){
		$("#userPassReCheck").text("비밀번호가 일치합니다.").css("color", "blue");
		$("#signUp").attr("disabled", false);
	} else if(pass2.length == 0) {
		$("#userPassReCheck").text("필수 정보입니다.").css("color", "red");
		$("#signUp").attr("disabled", true);
	} else {
		$("#userPassReCheck").text("비밀번호가 일치하지 않습니다.").css("color", "red");
		$("#signUp").attr("disabled", true);
	}
}

// 나머지 회원가입 유효성 체크(정규식)
	// 모든 공백 체크 정규식 
	var empJ = /\s/g;
	
// 공백 유효성 체크
function checks(){
	
	if($("#userId").val() == ""){ 
		$("#userIdCheck").text("필수 정보입니다.").css("color", "red");
		$("#userId").focus(); 
		return false; 
	}

	if($("#userPass").val() == ""){ 
		$("#userPassCheck").text("필수 정보입니다.").css("color", "red");
		$("#userPass").focus(); 
		return false; 
	}

	if($("#userPassRe").val() == ""){ 
		$("#userPassReCheck").text("필수 정보입니다.").css("color", "red");
		$("#userPassRe").focus(); 
		return false; 
	}
	
}
	

</script>
	

</body>
</html>