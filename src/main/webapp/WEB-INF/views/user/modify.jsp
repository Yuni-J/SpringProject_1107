<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
	<h1> User Modify Page </h1>
	<hr>
	<sec:authentication property="principal.uvo" var="uvo"/>
	<form action="/user/modify" method="post">
		<input type="hidden" name="email" value="${uvo.email }">
		<div class="mb-3 d-flex align-items-center">
			<label for="i" class="form-label">ID</label>
			 ${uvo.email }
		</div>
		<div class="mb-3 d-flex align-items-center">
			<label for="n" class="form-label">NickName</label>
			<input type="text" class="form-control" name="nickName" value="${uvo.nickName }" style="height: 60px;">
		</div>
		<div class="mb-3 d-flex align-items-center">	
			<label for="p" class="form-label">Pwd</label>	
			<input type="text" class="form-control" name="pwd" style="height: 60px;" >
		</div>
		<p class="card-text">regDate : ${uvo.regDate } </p>
	    <p class="card-text"><small class="text-body-secondary">Last login ${uvo.lastLogin } ago</small></p>
		<c:forEach items="${uvo.authList }" var="auths">
			<span class="badge rounded-pill text-bg-success">${auths.auth }</span>
		</c:forEach>
		<button type="submit" class="btn btn-primary btn-sm">modify</button>
		<a href="/user/remove"><button type="button" class="btn btn-danger btn-sm">remove</button></a>
	</form>


</div>

<jsp:include page="../layout/footer.jsp" />
