<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
	<h1> 회원가입 </h1>
	<hr>
	<br>
	<div class="d-flex justify-content-center">
		<form action="/user/register" method="post" class="w-50">
			<div class="d-flex align-items-center form-control">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
			 		<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
				</svg>
			  	<input type="text" class="form-control" id="e" name="email" placeholder="아이디 또는 이메일" style="height: 60px; border: none;">
			</div>
			<div class="d-flex align-items-center form-control">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
					<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2M5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1"/>
				</svg>
				<input type="text" class="form-control" id="p" name="pwd" placeholder="비밀번호" style="height: 60px; border: none;">
			</div>
			<div class="mb-3 d-flex align-items-center form-control">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-arms-up" viewBox="0 0 16 16">
					<path d="M8 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3"/>
					<path d="m5.93 6.704-.846 8.451a.768.768 0 0 0 1.523.203l.81-4.865a.59.59 0 0 1 1.165 0l.81 4.865a.768.768 0 0 0 1.523-.203l-.845-8.451A1.5 1.5 0 0 1 10.5 5.5L13 2.284a.796.796 0 0 0-1.239-.998L9.634 3.84a.7.7 0 0 1-.33.235c-.23.074-.665.176-1.304.176-.64 0-1.074-.102-1.305-.176a.7.7 0 0 1-.329-.235L4.239 1.286a.796.796 0 0 0-1.24.998l2.5 3.216c.317.316.475.758.43 1.204Z"/>
				</svg>
				<input type="text" class="form-control" id="n" name="nickName" placeholder="닉네임" style="height: 60px; border: none;">
			</div>
			<br>
			<button type="submit" class="form-control btn btn-primary" style="height: 50px;">회원가입</button>
		</form>
	</div>

</div>
<br>
<jsp:include page="../layout/footer.jsp" />

<style>
/* 전체 컨테이너 */
.container-md {
    background-color: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    margin-top: 50px;
    max-width: 600px;
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

/* 입력 필드 컨테이너 */
.d-flex.align-items-center {
    margin-bottom: 20px;
    position: relative;
    display: flex;
    align-items: center;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

/* 입력 필드 */
.form-control {
    background-color: transparent;
    border: none;
    font-size: 1rem;
    padding-left: 35px; /* 아이콘과 텍스트 간격 */
    height: 60px;
    width: 100%;
    color: #333;
}

.form-control:focus {
    outline: none;
    border-color: #6f42c1;
    box-shadow: 0 0 5px rgba(111, 66, 193, 0.5);
}

/* 아이콘 */
.bi {
    position: absolute;
    left: 10px;
    color: #6f42c1;
}

/* 회원가입 버튼 */
button[type="submit"] {
    background-color: #6f42c1;
    border: none;
    color: white;
    font-size: 1.2rem;
    padding: 15px;
    width: 100%;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
    background-color: #5a33a1;
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
        font-size: 1rem;
        padding-left: 30px; /* 아이콘과 텍스트 간격 */
    }

    button[type="submit"] {
        font-size: 1rem;
        padding: 12px;
    }
}

</style>
