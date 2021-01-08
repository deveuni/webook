<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   </div>
   <br>
    <form action = "" method="post" id="Login" >

        <div class="form-group">
           <input type="text" class="form-control" name="userId" placeholder="아이디">
        </div>

        <div class="form-group">
           <input type="password" class="form-control" name="userPass" placeholder="비밀번호">
        </div>
        
        <c:if test="${msg == false}">
        	<p style="color:#f00;" class="check_font">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</p>
        </c:if>
		
        <input type="submit" class="btn btn-primary" value="로그인">
        <div class="forgot">
        	<a href="reset.html">아이디/비밀번호 찾기</a>
        	<a href="/member/signup" style="margin-left: 160px;">회원가입</a>
		</div>
    </form>
    
    
	<div id="sns_login">
	<!-- 네이버 로그인 -->
	 <a href="${url}">
		<img width="175px"  src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
	 </a>
	<!-- 구글 로그인 -->
	 <a onclick="init();" id="google_login">
	 	<img width="175px" id="googleLoginImg" src="${pageContext.request.contextPath}/resources/images/btn_google_signin_light_focus_web.png">
	 </a>	
	</div>
		
    </div>
	</div>
	</div>
	
<!-- google signin api -->
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

<script type="text/javascript">

// 구글 로그인 API
var googleUser = {};
function init() {
	gapi.load('auth2', function(){
	  console.log("init()시작");
	  auth2 = gapi.auth2.init({
			client_id: '256250496782-21qhnh35qfoiv2ivbn9a4co3po0u20kq.apps.googleusercontent.com',
			cookiepolicy: 'single_host_origin',
		  });
	  	  attachSignin(document.getElementById('google_login'));
	});
}

// 구글 로그인 API2
function attachSignin(element) {
	auth2.attachClickHandler(element, {}, 
		function(googleUser) {
		var profile = googleUser.getBasicProfile();
		var id_token = googleUser.getAuthResponse().id_token;
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  	  console.log('ID토큰: ' + id_token);
	  	  console.log('Name: ' + profile.getName());
	  	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			$(function() {
				$.ajax({
					url: '${pageContext.request.contextPath}/member/signinGoogle',
					type: 'post',
					data: {"userId": profile.getEmail(),
						   "userPass": profile.getId(),
						   "userName": profile.getName(),
						   "userEmail": profile.getEmail()
						 },
					success: function (data) {
						location.href="/webook";
					}
				});
			})
		}, function(error) {
			alert("구글아이디 로그인이 실패했습니다.");
		});
}
</script>
	

</body>
</html>