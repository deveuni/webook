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
    <form action="/member/signup" method="post" id="Login">
    
       <label>아이디</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userId">
       </div>

	   <label>비밀번호</label>
       <div class="form-group">
         <input type="password" class="form-control" name="userPass">
       </div>
       
       <label>비밀번호 재확인</label>
       <div class="form-group">
         <input type="password" class="form-control" name="userPassCheck">
       </div>
       
       <label>이름</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userName">
       </div>
       
       <label>이메일</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userEmail">
       </div>
       
       <label>주소</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userAddr1">
       </div>
       
       <label>상세주소</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userAddr2">
       </div>
       
       <label>우편번호</label>
       <div class="form-group">
         <input type="text" class="form-control" name="postcode">
       </div>
       
       <label>휴대전화</label>
       <div class="form-group">
         <input type="text" class="form-control" id="userid">
       </div>
       
       <br>
       <input type="submit" value="가입하기" class="btn btn-primary">

    </form>
    </div>
	</div>
	</div>

</body>
</html>