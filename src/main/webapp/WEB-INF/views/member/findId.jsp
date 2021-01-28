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
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='/member/signin';
		})
	})
</script>
</head>
<body id="LoginForm">

<div class="container">
<div class="login-form">
<div class="main-div">
    <div class="panel">
   	  <h1><a href="/webook" class="webook-main">webook</a></h1>
    </div>
   	<br>
    <div class="form-group">
      <div>
		<h6>
		   회원가입시 사용한 아이디는 <b>${ userId }</b>입니다.
		</h6>
		<br>
	    <p class="w3-center">
		   <button type="button" id=loginBtn class="btn btn-primary">로그인</button>
		</p>	
	  </div>		
    </div>
</div>
</div>
</div>
</body>
</html>
