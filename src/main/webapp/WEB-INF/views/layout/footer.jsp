<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Footer Example</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    height: 100vh;  /* 화면 전체 높이를 차지 */
}

main {
    flex: 1;  /* main 영역이 남은 공간을 차지하도록 설정 */
}

/* Footer 스타일 */
footer {
    background-color: #6f42c1;
    color: white;
    padding: 20px 0;
    text-align: center;
    width: 100%; /* 푸터가 화면을 꽉 채우도록 */
}

footer .footer-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 15px;
}

footer .footer-links {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-bottom: 15px;
}

footer .footer-links a {
    color: white;
    text-decoration: none;
    font-size: 14px;
    transition: color 0.3s;
}

footer .footer-links a:hover {
    /* 여기에 hover 스타일 추가 가능 */
}

footer .social-icons {
    display: flex;
    justify-content: center;
    gap: 15px;
}

footer .social-icons a {
    color: white;
    font-size: 24px;
    transition: color 0.3s;
}

footer .social-icons a:hover {
    color: #ff9900; /* Hover 효과 */
}

footer .copyright {
    margin-top: 15px;
    font-size: 12px;
}

</style>
</head>
<body>
    <main>
        <!-- 페이지의 주요 콘텐츠 영역 -->
    </main>

    <footer>
        <div class="footer-container">
            <!-- 링크 섹션 -->
            <div class="footer-links">
                <a href="#">홈</a>
                <a href="#">서비스</a>
                <a href="#">연락처</a>
                <a href="#">블로그</a>
            </div>

            <!-- 소셜 미디어 아이콘 섹션 -->
            <div class="social-icons">
                <a href="#" target="_blank" title="Facebook">
                    <i class="fab fa-facebook"></i>
                </a>
                <a href="#" target="_blank" title="Twitter">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="#" target="_blank" title="Instagram">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="#" target="_blank" title="LinkedIn">
                    <i class="fab fa-linkedin"></i>
                </a>
            </div>

            <!-- 저작권 정보 -->
            <div class="copyright">
                &copy; 2024 Your Website Name. All rights reserved.
            </div>
        </div>
    </footer>

    <!-- FontAwesome 아이콘 라이브러리 로드 (소셜 아이콘용) -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
