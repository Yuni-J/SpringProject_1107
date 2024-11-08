<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
	<h1> User Login Page </h1>
	<hr>
	<br> <br>
	<div class="d-flex justify-content-center">
		<form action="/user/login" method="post" class="w-50">
			<div class="mb-3">
				<input type="text" class="form-control" id="email" name="email" placeholder="아이디 또는 이메일" style="height: 60px;">
				<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호" style="height: 60px;">
			</div>
			
			<!-- 로그인 실패시 errMessage 출력 -->
			<c:if test="${param.errMsg ne null }">
				<div class="text-danger">${param.errMsg }</div>
			</c:if>
			
			<button type="submit" class="form-control btn btn-primary" style="height: 50px;"> 로그인 </button>
		</form>
	</div>
</div>

<jsp:include page="../layout/footer.jsp" />

