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
   </div>
   <br>
    <form action = "" method="post" id="Login" >

        <div class="form-group">
           <input type="text" class="form-control" name="userId" placeholder="아이디">
        </div>

        <div class="form-group">
           <input type="password" class="form-control" name="userPass" placeholder="비밀번호">
        </div>
        
        <div class="forgot">
        	<a href="reset.html">아이디/비밀번호 찾기</a>
		</div>
		
        <input type="submit" class="btn btn-primary" value="로그인">
        
    </form>
    </div>
	</div>
	</div>

</body>
</html>