<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
    <h1> User List Page </h1>
    <hr>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>NickName</th>
                <th>LastLogin</th>
                <th>RegDate</th>
                <th>auth</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userList }" var="uvo">
                <tr>
                    <td>${uvo.email }</td>
                    <td>${uvo.nickName }</td>
                    <td>${uvo.lastLogin }</td>
                    <td>${uvo.regDate }</td>
                    <c:forEach items="${uvo.authList }" var="auths">
                        <td>${auths.auth }</td>
                    </c:forEach>
                </tr> 
            </c:forEach>
        </tbody>
    </table>
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
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}

/* 제목 */
h1 {
    color: #6f42c1;
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

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

/* 테이블 헤더 */
th {
    background-color: #6f42c1;
    color: #fff;
    padding: 12px;
    text-align: left;
    font-weight: bold;
    border-bottom: 2px solid #fff;
}

/* 테이블 바디 */
td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

/* 행 hover 효과 */
tr:hover {
    background-color: #f4f4f4;
    cursor: pointer;
}

/* 테이블 캡션 */
/* caption {
    font-size: 1.2rem;
    font-weight: bold;
    margin-bottom: 15px;
    text-align: center;
    color: #6f42c1;
} */

/* 반응형 디자인 */
@media (max-width: 768px) {
    table {
        width: 100%;
        border: none;
    }
    th, td {
        font-size: 0.9rem;
        padding: 10px;
    }
/*     caption {
        font-size: 1rem;
    } */
}
 
 </style>