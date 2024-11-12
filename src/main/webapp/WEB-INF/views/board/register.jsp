<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="../layout/header.jsp" />

<div class="container-md">
    <h1>Board Register</h1>
    <hr>
    <form action="/board/insert" method="post" enctype="multipart/form-data">
        <div class="form-group mb-3">
            <label for="t">제목</label>
            <input class="form-control" type="text" id="t" name="title" placeholder="제목을 입력해 주세요" required>
        </div>

        <div class="form-group mb-3">
            <label for="w">작성자</label>
            <sec:authentication property="principal.uvo" var="uvo"/>
            <input class="form-control" type="text" id="w" name="writer" readonly="readonly" value="${uvo.nickName}">
        </div>

        <div class="form-group mb-3">
            <label for="c">내용</label>
            <textarea class="form-control" id="c" name="content" rows="5" placeholder="내용을 입력해 주세요" required></textarea>
        </div>

        <div class="form-group">
            <label for="file">첨부파일</label>
            <input type="file" class="form-control" name="files" id="file" multiple="multiple" style="display: none;">
            <button type="button" class="btn btn-outline-info" id="trigger" style="width: 150px;">파일 업로드...</button>
        </div>

        <div id="fileZone" class="file-list"></div>

        <button type="submit" class="btn btn-primary" id="regBtn">등록</button>
    </form>
</div>

<script type="text/javascript" src="/resources/js/boardFileRegister.js"></script>

<jsp:include page="../layout/footer.jsp" />

<style>
/* 전체 컨테이너 스타일 */
/* .container-md {
    background-color: #fff;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    margin-top: 60px;
    max-width: 1000px;
    margin-left: auto;
    margin-right: auto;
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


/* 제목 스타일 */
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
    margin-top: 15px;
    margin-bottom: 30px;
}

/* 입력 필드 스타일 */
.form-control {
    border-radius: 8px;
    border: 1px solid #ddd;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
    padding: 10px;
}

/* 입력 필드 포커스 시 */
.form-control:focus {
    border-color: #6f42c1;
    box-shadow: 0 0 6px rgba(111, 66, 193, 0.4);
    outline: none;
}

/* 버튼 스타일 */
#trigger, #regBtn {
    width: 100%;
    padding: 12px;
    font-size: 1rem;
    border-radius: 8px;
    transition: background-color 0.3s ease;
}

#trigger {
    background-color: #9b7be4;
    color: #fff;
    border: none;
}

#trigger:hover {
    background-color: #5a33b1;
}

#regBtn {
    background-color: #6f42c1;
    color: white;
    border: none;
    font-weight: bold;
}

#regBtn:hover {
    background-color: #5a33b1;
}

/* 첨부파일 목록 스타일 */
#fileZone {
    margin-top: 20px;
    font-size: 0.9rem;
}

.file-list {
    list-style: none;
    padding-left: 0;
}

.file-item {
    background-color: #f4f4f4;
    padding: 8px;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.file-item a {
    color: #6f42c1;
    text-decoration: none;
    font-weight: bold;
}

.file-item a:hover {
    color: #5a33b1;
}

.remove {
    color: #e74c3c;
    cursor: pointer;
}

.remove:hover {
    text-decoration: underline;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .container-md {
        padding: 20px;
    }

    #regBtn, #trigger {
        font-size: 0.9rem;
        padding: 10px;
    }
}
</style>
