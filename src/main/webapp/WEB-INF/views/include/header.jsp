<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">


  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">

  <!-- 상품 메뉴바 -->
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link href="${pageContext.request.contextPath}/resources/css/goodsbar.css" rel="stylesheet">
</head>
<body>

 <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/webook">webook</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        <!-- 로그아웃 상태 -->
        <c:if test="${member == null && naverUserId == null && googleId == null}">
          <li class="nav-item">
            <a class="nav-link" href="/member/signin">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/member/signup">회원가입</a>
          </li>
         </c:if>
         <!--  일반 회원가입 로그인 상태 -->
         <c:if test="${member != null}">
          <li class="nav-item">
			<p class="nav-link">${member.userName}님 환영합니다.</p>
          </li>
          <li class="nav-item">
			<a class="nav-link" href="/member/signout">로그아웃</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              마이페이지
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/member/infoUpdate">회원정보수정</a>
              <a class="dropdown-item" href="/member/updatePw">비밀번호수정</a>
              <a class="dropdown-item" href="/member/infoDelete">회원탈퇴</a>
            </div>
          </li>
         </c:if> 
         <!-- 네이버 아이디 로그인 상태 --> 
         <c:if test="${naverUserId != null}">
          <li class="nav-item">
			<p class="nav-link">${naverName}님 환영합니다.</p>
          </li>
          <li class="nav-item">
			<a class="nav-link" href="./member/signout">로그아웃</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              마이페이지
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/member/infoUpdate">회원정보수정</a>
              <a class="dropdown-item" href="/member/updatePw">비밀번호수정</a>
			  <a class="dropdown-item" href="/member/infoDelete">회원탈퇴</a>            </div>
          </li>
         </c:if>
         <!-- 구글 아이디 로그인 상태 -->
         <c:if test="${googleId != null}">
          <li class="nav-item">
			<p class="nav-link">${googleName}님 환영합니다.</p>
          </li>
          <li class="nav-item">
			<a class="nav-link" href="./member/signout">로그아웃</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              마이페이지
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/member/infoUpdate">회원정보수정</a>
              <a class="dropdown-item" href="/member/updatePw">비밀번호수정</a>
              <a class="dropdown-item" href="/member/infoDelete">회원탈퇴</a>
            </div>
          </li>
         </c:if>    
         
         <!-- 관리자만 상품등록 보이기 -->
         <c:if test="${member != null}">
          <c:if test="${userId == 'webook'}">
          	<li class="nav-item">
            	<a class="nav-link" href="/goods/register">상품등록</a>
          	</li>
          </c:if>
         </c:if>
          
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Portfolio
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
              <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Blog
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
              <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
              <a class="dropdown-item" href="blog-post.html">Blog Post</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Other Pages
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
              <a class="dropdown-item" href="full-width.html">Full Width Page</a>
              <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
              <a class="dropdown-item" href="faq.html">FAQ</a>
              <a class="dropdown-item" href="404.html">404</a>
              <a class="dropdown-item" href="pricing.html">Pricing Table</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  
  <!-- 상품 메뉴바 -->
        <nav class="navbar fixed-top navbar-expand-md navbar-new-bottom">
            <div class="navbar-collapse collapse pt-2 pt-md-0" id="navbar2">

                <ul class="navbar-nav w-100 justify-content-center px-3">
                    <li class="nav-item active">
                        <a class="nav-link" href="/goods/list?category=국내도서">국내도서</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/goods/list?category=외국도서">외국도서</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/goods/list?category=eBook">eBook</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/goods/list?category=웹소설">웹소설</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/goods/list?category=음반">음반</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/goods/list?category=중고도서">중고도서</a>
                    </li>
                </ul>
            </div>
        </nav> 
  <!-- 상품 메뉴바 -->
  
  
  
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>