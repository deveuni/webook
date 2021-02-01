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
   <!-- <form action = "/member/find_id" method="post" id="Login" > -->
       <div class="form-group">
          <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디"> 
       </div>
       <div class="form-group">
          <input type="text" class="form-control" name="userEmail" id="userEmail" placeholder="이메일">
       </div>
       <br>
       <input type="submit" class="btn btn-primary" id="findBtn" value="비밀번호 찾기" style="margin-bottom: 10px;"><br>
       <button type="button" onclick="history.go(-1);" class="btn btn-primary">로그인</button>
   <!-- </form> -->
</div>
</div>
</div>

<script type="text/javascript">

// 비밀번호 찾기
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/member/findPw",
				type : "POST",
				data : {
					userId : $("#userId").val(),
					userEmail : $("#userEmail").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	});
</script>
</body>
</html>