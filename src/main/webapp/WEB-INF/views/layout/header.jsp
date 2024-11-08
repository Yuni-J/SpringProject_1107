<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="ses" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<!-- <nav class="navbar navbar-expand-lg bg-body-tertiary mb-4" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <div class="d-flex flex-column">
      <a class="navbar-brand" href="#">Navbar</a>
      <ul class="navbar-nav flex-column mb-2">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
      </ul>
    </div>
  </div>
</nav> -->
<nav class="navbar navbar-expand-lg bg-body-tertiary mb-4">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">Spring</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/board/list">목록</a>
        </li>
        <!-- isAnonymous() : 사용자가 익명(로그인되지 않은) 상태 -->
        <ses:authorize access="isAnonymous()">
	        <li class="nav-item">
	          <a class="nav-link" href="/user/register">회원가입</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/user/login">로그인</a>
	        </li>
        </ses:authorize>
        
      <!-- 로그인을 해야 볼 수 있는 화면 -->
      	<!-- isAuthenticated() : 사용자가 로그인한 상태 -->
      	<ses:authorize access="isAuthenticated()">
      		<!-- 인증 객체가 만들어져 있는 상태 -->
      		<!-- 인증된 객체 가져오기 => 현재 로그인정보는 : principal -->
      		<ses:authentication property="principal.uvo.email" var="authEamil"/>
      		<ses:authentication property="principal.uvo.nickName" var="authNick"/>
      		<ses:authentication property="principal.uvo.authList" var="auths"/>
	        <li class="nav-item">
	          <a class="nav-link" href="/board/register">작성</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/user/modify">회원정보수정 (${authNick })</a>
	        </li>
	        <!-- 회원리스트는 ADMIN만 확인 가능 -->
	        <c:if test="${auths.stream().anyMatch(AuthVO -> AuthVO.auth.equals('ROLE_ADMIN')).get() }">
		        <li class="nav-item">
		          <a class="nav-link text-primary" href="/user/list">회원리스트</a>
		        </li>
	        </c:if>
	        <li class="nav-item">
	          <a class="nav-link" href="/user/logout">로그아웃</a>
	        </li>
      	</ses:authorize>
      </ul>
    </div>
  </div>
</nav>



</body>
</html>