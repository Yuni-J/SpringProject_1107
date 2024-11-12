<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
	<h1> User Login Page </h1>
	<hr>
	<br>
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
			
			<br>
			<button type="submit" class="form-control btn btn-primary" style="height: 50px;"> 로그인 </button>
		</form>
	</div>
</div>

<jsp:include page="../layout/footer.jsp" />

<style>
/* 전체 페이지 스타일 */
.container-md {
    background-color: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    margin-top: 50px;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}

/* 페이지 제목 스타일 */
h1 {
    color: #6f42c1;  /* 보라색 */
    font-size: 2rem;
    text-align: center;
    margin-bottom: 20px;
}

/* 구분선 스타일 */
hr {
    border-color: #6f42c1;
    border-width: 2px;
    margin-top: 20px;
    margin-bottom: 30px;
}

/* 입력 필드 */
.form-control {
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 15px;
    font-size: 1rem;
    margin-bottom: 15px;
}

.form-control:focus {
    border-color: #6f42c1;  /* 포커스 시 보라색 */
    box-shadow: 0 0 5px rgba(111, 66, 193, 0.5);
}

input[type="password"], input[type="text"] {
    height: 60px;
}

/* 로그인 실패 메시지 */
.text-danger {
    color: #e03e3e;
    font-weight: bold;
    margin-bottom: 15px;
    text-align: center;
}

/* 로그인 버튼 */
button[type="submit"] {
    background-color: #6f42c1;
    color: white;
    border: none;
    padding: 15px;
    font-size: 1.1rem;
    border-radius: 5px;
    width: 100%;
    cursor: pointer;
    font-weight: bold;
}

button[type="submit"]:hover {
    background-color: #5a33a1;  /* 버튼 hover 색상 */
}

/* 로그인 폼 컨테이너 */
.d-flex.justify-content-center {
    display: flex;
    justify-content: center;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .container-md {
        padding: 20px;
        margin-top: 30px;
    }

    .w-50 {
        width: 100% !important;  /* 작은 화면에서는 전체 폭으로 확장 */
    }

    h1 {
        font-size: 1.5rem; /* 모바일에서 제목 크기 조정 */
    }

    button[type="submit"] {
        padding: 12px;
        font-size: 1rem;
    }
}

</style>