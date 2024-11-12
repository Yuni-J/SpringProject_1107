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
			<span class="badge rounded-pill" style="background-color: #9b7be4;">${auths.auth }</span>
		</c:forEach>
		<button type="submit" class="btn btn-primary btn-sm">modify</button>
		<a href="/user/remove"><button type="button" class="btn btn-danger btn-sm">remove</button></a>
	</form>


</div>

<jsp:include page="../layout/footer.jsp" />

<style>
/* 전체 컨테이너 */
/* .container-md {
    background-color: #fff;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    margin-top: 50px;
} */
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

/* 제목 */
h1 {
    color: #6f42c1;  /* 보라색 */
    font-size: 2rem;
    text-align: center;
    margin-bottom: 20px;
}

/* 구분선 */
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

input[type="text"] {
    height: 60px; /* 입력 필드 높이 */
}

/* 레이블 스타일 */
.form-label {
    font-weight: bold;
    margin-right: 10px;
    color: #333;
}

/* 카드 텍스트 스타일 */
.card-text {
    font-size: 1rem;
    color: #555;
}

.card-text small {
    color: #888;
}

/* 권한 배지 스타일 */
.badge {
    font-size: 1rem;
    margin: 5px 10px 5px 0;
}

/* 버튼 스타일 */
button {
    font-size: 1rem;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    width: auto;
}

/* 수정 버튼 */
.btn-primary {
    background-color: #6f42c1;
    border: none;
    color: white;
}

.btn-primary:hover {
    background-color: #5a33a1;
}

/* 제거 버튼 */
.btn-danger {
    background-color: #e03e3e;
    border: none;
    color: white;
}

.btn-danger:hover {
    background-color: #c32a2a;
}

/* 버튼 사이 여백 */
a button {
    margin-left: 10px;
}

/* 폼 컨테이너와 버튼 정렬 */
.d-flex {
    display: flex;
    align-items: center;
}

.d-flex button {
    margin-top: 20px;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .container-md {
        padding: 20px;
        margin-top: 30px;
    }

    h1 {
        font-size: 1.5rem;
    }

    .form-control {
        padding: 12px;
        font-size: 1rem;
    }

    button {
        font-size: 1rem;
        padding: 10px;
    }

    .d-flex {
        flex-direction: column;
        align-items: flex-start;
    }

    .d-flex button {
        width: 100%;
        margin-top: 15px;
    }
}

</style>
