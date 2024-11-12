<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="ses" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <style>
        /* 기본 배경 이미지 설정 */
        body {
            background-image: url('/resources/img/5176528.jpg');
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }

        /* 네비게이션 스타일 */
        nav {
            background-color: #9b7be4; /* 네비게이션 배경색 */
            border-radius: 15px; /* 네비게이션 바에 둥근 모서리 추가 */
        }

        nav .navbar-brand img {
            width: 70px;
            height: 70px;
            border-radius: 50%; /* 로고를 원형으로 */
        }

        .navbar-nav .nav-item .nav-link {
            color: white !important; /* 링크 색상 흰색 */
            font-weight: bold; /* 글자 두껍게 */
            transition: color 0.3s ease; /* 마우스 오버시 색상 전환 효과 */
        }

        .navbar-nav .nav-item .nav-link:hover {
            color: #4a2c99; /* 링크 호버시 색상 */
        }

        /* 로그인 및 회원가입 버튼 스타일 */
        .nav-item .nav-link {
            font-size: 16px;
            text-transform: uppercase; /* 대문자화 */
            letter-spacing: 1px; /* 글자 간격 */
        }

        /* 모바일 네비게이션 메뉴 */
        .navbar-toggler-icon {
            background-color: white; /* 토글 아이콘 색상 */
        }

        /* 배경 이미지가 흐림 효과를 주는 스타일 */
        .container-fluid {
            position: relative;
            z-index: 1;
        }

        /* 네비게이션 바 위의 메뉴 텍스트를 돋보이게 */
        .navbar-nav {
            z-index: 2;
        }
        a {
		    color: black;            /* 링크 텍스트 색상 검은색 */
		    text-decoration: none;   /* 밑줄 제거 */
		}

		a:hover {
    		color: #6f42c1;          /* 링크 호버시 색상 (선택적) */
		}
		
		label{
			font-weight: bold;
		}
    

    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img alt="" src="/resources/img/Kirby.gif"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/board/list" style="font-size: large;">목록</a>
                </li>

                <!-- isAnonymous() : 사용자가 익명(로그인되지 않은) 상태 -->
                <ses:authorize access="isAnonymous()">
                    <li class="nav-item">
                        <a class="nav-link" href="/user/register" style="font-size: large;">회원가입</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/login" style="font-size: large;">로그인</a>
                    </li>
                </ses:authorize>
                
                <!-- 로그인을 해야 볼 수 있는 화면 -->
                <ses:authorize access="isAuthenticated()">
                    <ses:authentication property="principal.uvo.email" var="authEamil"/>
                    <ses:authentication property="principal.uvo.nickName" var="authNick"/>
                    <ses:authentication property="principal.uvo.authList" var="auths"/>
                    <li class="nav-item">
                        <a class="nav-link" href="/board/register" style="font-size: large;">작성</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/modify" style="font-size: large;">회원정보수정 (${authNick })</a>
                    </li>
                    <!-- 회원리스트는 ADMIN만 확인 가능 -->
                    <c:if test="${auths.stream().anyMatch(AuthVO -> AuthVO.auth.equals('ROLE_ADMIN')).get() }">
                        <li class="nav-item">
                            <a class="nav-link text-primary" href="/user/list" style="font-size: large;">회원리스트</a>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/logout" style="font-size: large;">로그아웃</a>
                    </li>
                </ses:authorize>
            </ul>
        </div>
    </div>
</nav>

</body>
</html>
